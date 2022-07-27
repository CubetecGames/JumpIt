extends Node2D



func _on_Area2D_body_entered(body):
	if body.name == "Hráč":
		get_tree().change_scene("res://Win.tscn")
