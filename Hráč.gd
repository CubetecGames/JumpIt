extends KinematicBody2D


var velocity = Vector2(0, 0)
var gravity = 0
const speed = 150
const jump = 450
var ground = false
var die = false
const gravity_force = 1.2
const walljump_force = 5
var up_button

func _ready():
	position = Difficulty.spawn_point
	up_button = $"../Buttons/Up"
	
func _physics_process(delta):
	if die:
		return 
	if Input.is_action_pressed("ui_left"):
		left()
	if Input.is_action_pressed("ui_right"):
		right()
	if Input.is_action_pressed("ui_up"):
		if ground:
			jump()
		if walljump_test():
			walljump()
	
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
			
	if ground:
		up_button.set_button(0)
	elif walljump_test():
		up_button.set_button(1)


func die():
	get_tree().change_scene("res://hra.tscn")

func play_sound(file):
	var sound = load("res://Sound.gd").new()
	sound.stream = file
	add_child(sound)
	
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

func walljump_test():
	for id in range(get_slide_count()):
		var object = get_slide_collision(id).collider
		if object and object.name == "KameníMapa":
			if is_on_wall() and not is_on_floor():
				return true
	return false
func bounce():
	gravity = 0
	velocity.y = jump * - 2
	
func left():
	velocity.x -= speed
func right():
	velocity.x += speed
func jump():
	velocity.y -= jump
	play_sound(load("res://Assets/Zvuky/Jump.mp3"))
	
func walljump():
	velocity.y = jump * - 1 * walljump_force / 4
	if velocity.x >= 0:
		velocity.x = jump * - 1 * walljump_force
	elif velocity.x <= 0:
		velocity.x = jump * walljump_force
	play_sound(load("res://Assets/Zvuky/Basketball Bounce.mp3"))
