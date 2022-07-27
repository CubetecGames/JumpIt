extends KinematicBody2D


var velocity = Vector2(0, 0)
var gravity = 0
const speed = 150
const jump = 450
var ground = false
var die = false
const gravity_force = 1.2
const walljump_force = 5

func _physics_process(delta):
	if die:
		return 
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_up"):
		if ground:
			velocity.y -= jump
			play_sound(load("res://Assets/Zvuky/Jump.mp3"))
		elif walljump():
			velocity.y = jump * - 1 * walljump_force / 4
			if velocity.x >= 0:
				velocity.x = jump * - 1 * walljump_force
			elif velocity.x <= 0:
				velocity.x = jump * walljump_force
			play_sound(load("res://Assets/Zvuky/Basketball Bounce.mp3"))
	
	velocity.x *= 0.8
	gravity += gravity_force
	if gravity > gravity_force * 30:
		gravity = gravity_force * 30
	velocity.y += gravity
	
	move_and_slide(velocity, Vector2(0, - 1))
	ground = is_on_floor()
	if ground:
		gravity = 0
		velocity.y = 0
	if is_on_ceiling():
		gravity = 0
		velocity.y = 0
	
	if position.y > 5000:
		fall()
	
	for id in range(get_slide_count()):
		var object = get_slide_collision(id).collider.name
		if object == "LávaMapa":
			lava()


func die():
	get_tree().change_scene("res://hra.tscn")

func play_sound(file):
	$Zvuk.stream = file
	$Zvuk.play()
	
func fall():
	die = true
	$Kamera.zoom_(Vector2(10, 10), true)
	play_sound(load("res://Assets/Zvuky/Disconnect.mp3"))
	$Smrt.start()
	
func lava():
	die = true
	$Kamera.zoom_(Vector2(0, 0), true)
	play_sound(load("res://Assets/Zvuky/Rip.mp3"))
	$Smrt.start()

func walljump():
	for id in range(get_slide_count()):
		var object = get_slide_collision(id).collider.name
		if object == "KameníMapa":
			if is_on_wall() and not is_on_floor():
				return true
	return false
	
func bounce():
	gravity = 0
	velocity.y = jump * - 2
