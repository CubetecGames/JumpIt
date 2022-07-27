extends Camera2D

var zooms = Vector2(1, 1)
var transfer = true

func zoom_(scale:Vector2, transfer_):
	if not transfer_ == null:
		transfer = transfer_
	zooms.x = scale.x
	zooms.y = scale.y
func _physics_process(delta):
	if transfer:
		zoom.x += (zooms.x - zoom.x) / 30
		zoom.y += (zooms.y - zoom.y) / 30
	else :
		zoom = zooms;
