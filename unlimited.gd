extends "res://Game.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Hearts.set_hearts(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BalloonSpawn_timeout():
	spawn_balloon()


func _on_BirdSpawn_timeout():
	spawn_bird()
