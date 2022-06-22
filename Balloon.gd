extends RigidBody2D

signal dead_balloon

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	

func set_color(col):
	material.set_shader_param("balloon_color",col)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Balloon_body_entered(body):
	pop()

func pop():
	$AnimationPlayer.play("Pop")
	$PopSound.play()
	emit_signal("dead_balloon")
	contact_monitor = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Pop":
		queue_free()
