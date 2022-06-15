extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Balloon_body_entered(body):
	pop()

func pop():
	$AnimationPlayer.play("Pop")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Pop":
		queue_free()
