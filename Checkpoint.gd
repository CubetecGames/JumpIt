extends Sprite

func _on_Area2D_body_entered(body):
	if body.name == "Hráč":
		Difficulty.spawn_point = position
