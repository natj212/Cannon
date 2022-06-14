extends Node2D


# Declare member variables here. Examples:
export var rot_speed = 4.0
var deg = 0
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		pass
	elif event is InputEventMouseMotion:
		event = make_input_local(event)
		var cx = event.position.x
		var cy = event.position.y
		deg = atan2(cy,cx) * (180 / PI)
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var old_deg = $CannonSprite.rotation_degrees
	var diff = deg - old_deg
	var rot = (min(abs(diff),rot_speed) * (1.0 if diff >= 0 else -1.0) ) 
	$CannonSprite.rotation_degrees = rot + old_deg
