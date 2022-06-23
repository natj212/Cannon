extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var balloon = preload("res://Balloon.tscn")
var bird = preload("res://Bird.tscn")
var rng = RandomNumberGenerator.new()
var dead_balloons = 0
var dead_birds = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func game_over():
	$GameOver.popup()
	get_tree().paused = true
	

func get_random_pos():
	return Vector2(1280,rng.randf_range(150,700))

func get_random_color():
	return Color(rng.randf_range(0.5,1.0),
	rng.randf_range(0.5,1.0),
	rng.randf_range(0.5,1.0))

func spawn_bird():
	var b = bird.instance()
	b.position = get_random_pos()
	b.connect("dead_bird",self,"_on_bird_dead")
	add_child(b)

func spawn_balloon():
	var b = balloon.instance()
	b.position = get_random_pos()
	b.modulate = get_random_color()
	b.connect("dead_balloon",self,"_on_balloon_dead")
	add_child(b)

func _on_balloon_dead():
	dead_balloons += 1
	enemy_dead()

func _on_bird_dead():
	dead_birds += 1
	enemy_dead()

func enemy_dead():
	pass

func _on_FinishLine_body_entered(_body):
	$Hearts.remove_heart()

func _on_Okay_pressed():
	get_tree().quit()
