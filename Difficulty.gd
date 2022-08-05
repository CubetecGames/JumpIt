extends Node


var difficulty = 1
var difficulties = ["Easy", "Normal", "Hard"]
var spawn_point = Vector2(96, 224)

func get_difficulty():
	return difficulties[difficulty]
func set_difficulty(value: int):
	difficulty = value
