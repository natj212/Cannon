extends Node


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BalloonSpawn_timeout():
	get_tree().get_root().get_node("Root").spawn_balloon()
