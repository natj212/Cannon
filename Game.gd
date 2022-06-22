extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var balloon = preload("res://Balloon.tscn")
var rng = RandomNumberGenerator.new()
var dead_balloons = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn_balloon():
	var b = balloon.instance()
	b.position = Vector2(1280,rng.randf_range(20,700))
	var c = Color(rng.randf_range(0.5,1.0),
	rng.randf_range(0.5,1.0),
	rng.randf_range(0.5,1.0))
	b.modulate = c
	b.connect("dead_balloon",self,"_on_balloon_dead")
	add_child(b)

func _on_balloon_dead():
	dead_balloons += 1

func _on_FinishLine_body_entered(body):
	$Hearts.remove_heart()
