extends RigidBody2D

signal dead_bird

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var start_height = 0
export var flap_strength = 200
var flap = true

# Called when the node enters the scene tree for the first time.
func _ready():
	start_height = position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	#Get rid of out of bounds
	if position.y > 900:
		queue_free()
	if position.y >= start_height + 20 && linear_velocity.y > 0 && flap:
		linear_velocity.y -= flap_strength


func _on_Bird_body_entered(body):
	flap = false
	emit_signal("dead_bird")
	contact_monitor = false
