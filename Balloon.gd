extends RigidBody2D

signal dead_balloon

var rng = RandomNumberGenerator.new()

@export var initial_impuse = -100.0


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	apply_impulse(Vector2(initial_impuse,0))

func set_color(col):
	material.set_shader_parameter("balloon_color",col)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Balloon_body_entered(body):
	pop()

func pop():
	$AnimationPlayer.play("Pop")
	$PopSound.play()
	emit_signal("dead_balloon")
	collision_layer = 0
	collision_mask = 0


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Pop":
		queue_free()
		
func _physics_process(_delta):
	pass
