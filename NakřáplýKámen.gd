extends Sprite

var timer = null
const time = 0.5

func destroy(body):
	if body.name == "Hráč":
		timer = 0

func _process(delta):
	if not timer == null:
		timer += delta
		$Label.text = str(round((time - timer) * 100) / 100)
		if timer > time:
			queue_free()
