extends TileMap


func _ready():
	var a = TileMap.new()
	a.name = "LávaMapa"
	a.tile_set = load("res://Assets/Mapa/MAPASVĚTA.tres")
	add_child(a)
	var c = TileMap.new()
	c.name = "KameníMapa"
	c.tile_set = load("res://Assets/Mapa/MAPASVĚTA.tres")
	add_child(c)
	var b = $"LávaMapa"
	var d = $"KameníMapa"
	for block in get_used_cells():
		var id = get_cellv(block)
		if id == 5:
			var trampoline = load("res://Trampolína.tscn")
			var tramp = trampoline.instance()
			tramp.position = block * 64 + Vector2(32, 32)
			set_cellv(block, - 1)
			add_child(tramp)
		if id == 4:
			b.set_cellv(block, 4)
			set_cellv(block, - 1)
		if id == 3:
			var cracked_stone = load("res://Nakřáplý kámen.tscn")
			var stone = cracked_stone.instance()
			stone.position = block * 64 + Vector2(32, 32)
			set_cellv(block, - 1)
			add_child(stone)
		if id == 2:
			d.set_cellv(block, 2)
			set_cellv(block, - 1)
