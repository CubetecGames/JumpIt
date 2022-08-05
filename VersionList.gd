extends Label


var size = margin_bottom
var actual = 0
const move_velocity = 100
var stop = false

func _physics_process(delta):
	if actual < size:
		rect_position.y -= move_velocity * delta
		actual += move_velocity * delta
	else:
		if not stop:
			$"../Timer".start()
			stop = true

func change_back():
	get_tree().change_scene("res://Intro.tscn")
