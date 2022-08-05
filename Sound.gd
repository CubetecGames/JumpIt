extends AudioStreamPlayer2D

var played = false

func _physics_process(delta):
	print(played)
	if not playing and played:
		queue_free()
	if not played:
		play()
		played = true
