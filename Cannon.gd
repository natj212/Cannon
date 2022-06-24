extends Node2D

export var rot_speed = 20.0
export var speed = 200.0
export var reload_time = 1.0
var deg = 0
var Ball = preload("res://Ball.tscn")
var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var canFire: bool = true
export var trajectory_points = 40


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Ready")
	#Show trajectory line
	$Trajectory.show()

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()
	if event is InputEventMouseMotion:
		event = make_input_local(event)
		var cx = event.position.x
		var cy = event.position.y
		deg = atan2(cy,cx) * (180 / PI)
		
func shoot():
	if !canFire:
		return
	var b = Ball.instance()
	owner.add_child(b)
	b.transform = $CannonSprite/BarrelEnd.global_transform
	#Makes to shoot in the direction it's facing
	b.linear_velocity = b.transform.x * speed * 5
	#Makes the ball spin randomly
	b.angular_velocity = rng.randf_range(-5,5)
	$AnimationPlayer.play("Fire")
	reload()
	if rng.randf() > 0.5:
		$Boom.play()
	else:
		$Pow.play()
	
func reload():
	get_tree().create_timer(reload_time).connect("timeout",self,"_on_timeout")
	canFire = false
	

func _physics_process(delta):
	var old_deg = $CannonSprite.rotation_degrees
	var diff = deg - old_deg
	# Prevents issue from when it goes from -180 to 180
	if diff > 180.0:
		diff = -1.0 * (360.0 - diff)
	elif diff < -180.0:
		diff = -360.0 + diff
		
	var rot = (min(abs(diff),rot_speed * delta * 10) * (1.0 if diff >= 0 else -1.0) ) 
	$CannonSprite.rotation_degrees = rot + old_deg
	set_trajectory()

func traj_pos(vel: Vector2, gravity, time):
	var x = vel.x * time
	var y = vel.y * time - (gravity * pow(time, 2.0) / 2.0)
	return Vector2(x,y)

func set_trajectory():
	$Trajectory.global_position = $CannonSprite/BarrelEnd.global_position
	$Trajectory.clear_points()
	var vel = $CannonSprite/BarrelEnd.global_transform.x * speed * 5
	var gravity = -98.0
	var flight_time = (2 * vel.y) / gravity
	for i in trajectory_points:
		var t = i * (2 * flight_time / trajectory_points)
		$Trajectory.add_point(traj_pos(vel,gravity,t))
		

func _on_timeout():
	canFire = true
	$AnimationPlayer.play("Ready")
	$ReloadSound.play()
