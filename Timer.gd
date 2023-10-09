extends Label


var start_time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	start_time = Time.get_unix_time_from_system()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var t = Time.get_unix_time_from_system() - start_time
	var m = str(int(t / 60))
	var s = str(int(t) % 60)
	if s.length() == 1:
		s = "0" + s
	text = m + ":" + s
