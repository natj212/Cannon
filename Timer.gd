extends Label


var start_time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	start_time = OS.get_unix_time()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var t = OS.get_unix_time() - start_time
	var m = str(t / 60)
	var s = str(t % 60)
	if s.length() == 1:
		s = "0" + s
	text = m + ":" + s
