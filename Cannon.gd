extends Node2D


# Declare member variables here. Examples:
export var rot_speed = 20.0
var deg = 0
var Ball = preload("res://Ball.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		var b = Ball.instance()
		add_child(b)
	elif event is InputEventMouseMotion:
		event = make_input_local(event)
		var cx = event.position.x
		var cy = event.position.y
		deg = atan2(cy,cx) * (180 / PI)

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
	
