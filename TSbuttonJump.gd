extends TouchScreenButton

var jump_texture
var walljump_texture
var is_walljump = 0

func _ready():
	jump_texture = load("res://Assets/Buttons/Up.svg")
	walljump_texture = load("res://Assets/Buttons/Wall.svg")
	
func set_button(walljump):
	if is_walljump != walljump:
		normal = walljump_texture if walljump else jump_texture
		is_walljump = walljump
