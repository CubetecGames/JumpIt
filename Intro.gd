extends CanvasLayer


func _on_Button_pressed():
	Difficulty.set_difficulty($OptionButton.get_selected_id())
	get_tree().change_scene("res://hra.tscn")

func version_list():
	get_tree().change_scene("res://version_list.tscn")
