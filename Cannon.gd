extends Node2D


# Declare member variables here. Examples:
export var rot_speed = 20.0
export var speed = 200.0
export var reload_time = 1.0
var deg = 0
var Ball = preload("res://Ball.tscn")
var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var canFire: bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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
	b.linear_velocity = b.transform.x * speed
	#Makes the ball spin randomly
	b.angular_velocity = rng.randf_range(-10,10)
	$AnimationPlayer.play("Fire")
	reload()
	if rng.randf() > 0.5:
		$Boom.play()
	else:
		$Pow.play()
	
func reload():
	get_tree().create_timer(reload_time).connect("timeout",self,"_on_timeout")
	canFire = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var old_deg = $CannonSprite.rotation_degrees
	var diff = deg - old_deg
	# Prevents issue from when it goes from -180 to 180
	if diff > 180.0:
		diff = -1.0 * (360.0 - diff)
	elif diff < -180.0:
		diff = -360.0 + diff
		
	var rot = (min(abs(diff),rot_speed * delta * 10) * (1.0 if diff >= 0 else -1.0) ) 
	$CannonSprite.rotation_degrees = rot + old_deg
	


func _on_timeout():
	canFire = true
	$AnimationPlayer.play("Idle")
	$ReloadSound.play()
