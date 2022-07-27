extends Sprite

var player
var player_in_me = false


func _process(delta):
	var audio = $AudioStreamPlayer
	if player_in_me:
		player.bounce()
		if not audio.playing:
			audio.play()


func _on_Oblast_body_entered(body):
	if body.name == "Hráč":
		player = body
		player_in_me = true


func _on_Oblast_body_exited(body):
	player_in_me = false
