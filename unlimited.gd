extends "res://Game.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Hearts.set_hearts(3)
	spawn_balloon()

func get_score():
	return dead_balloons + 2 * dead_birds

func enemy_dead():
	$Score.text = "Score: " + str(get_score())
	$GameOver/VBoxContainer/HighScore.text = "Score: " + str(get_score())

func _process(delta):
	pass


func _on_BalloonSpawn_timeout():
	spawn_balloon()


func _on_BirdSpawn_timeout():
	spawn_bird()
