extends TileMap

func _ready():
	for block in get_used_cells():
		set_cellv(block, -1)
	for i in range(3):
		if get_child(i).name == Difficulty.get_difficulty():
			for block in get_child(i).get_used_cells():
				set_cellv(block, 0)
	
	for block in get_used_cells():
		var checkpoint = load("res://Checkpoint.tscn")
		var check = checkpoint.instance()
		check.position = block * 64 + Vector2(32, 32)
		set_cellv(block, - 1)
		add_child(check)
