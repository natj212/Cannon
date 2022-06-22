extends Node2D

var texture = load("res://Assets/heart.png")
var heart_list = []
export var heart_offset = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func remove_heart():
	if !heart_list.empty():
		heart_list.back().queue_free()
		heart_list.pop_back()
	if heart_list.empty():
		get_tree().get_root().get_node("Root").game_over()

func remove_all_hearts():
	while !heart_list.empty():
		remove_heart()

func set_hearts(num):
	remove_all_hearts()
	for i in num:
		add_heart()

func add_heart():
	var h = Sprite.new()
	h.texture = texture
	if !heart_list.empty():
		h.position.x = heart_list.back().position.x + heart_offset
	add_child(h)
	heart_list.append(h)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
