extends Sprite

var timer = null
var time

func destroy(body):
	if body.name == "Hráč":
		timer = 0

func _process(delta):
	if not timer == null:
		timer += delta
		$Label.text = str(round((time - timer) * 100) / 100)
		if timer > time:
			queue_free()

func _ready():
	if Difficulty.get_difficulty() == "Hard":
		time = 0.05
	else:
		time = 0.5
