extends RigidBody2D


var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$AnimationPlayer.play("Idle")
	var c = Color(rng.randf_range(0.5,1.0),
	rng.randf_range(0.5,1.0),
	rng.randf_range(0.5,1.0))
	material.set_shader_param("balloon_color",c)


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
