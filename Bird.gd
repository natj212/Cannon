extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var start_height = 0
export var flap_strength = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	start_height = position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FlapTimer_timeout():
	if position.y >= start_height + 20 && linear_velocity.y > 0:
		linear_velocity.y -= flap_strength


func _on_Bird_body_entered(body):
	$FlapTimer.queue_free()
