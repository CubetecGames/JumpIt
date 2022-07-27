extends Node2D

func zoom(body, how:Vector2, transfer:bool):
	if body.name == "Hráč":
		$"/root/Svět/Hráč/Kamera".zoom_(how, transfer)

func end_zoom(body):
	if body.name == "Hráč":
		$"/root/Svět/Hráč/Kamera".zoom_(Vector2(1, 1), null)
