extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_score():
	var root = get_tree().get_root().get_node("Root")
	return root.dead_balloons + root.dead_birds * 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Score: " + str(get_score())
