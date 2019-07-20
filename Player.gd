extends KinematicBody2D
var delay = 70
var frameCounter = 0
var colorArr = ["blu","aquamarine","leafcutter"]
var colorIdx = 0
onready var anim = $AnimatedSprite

var hit = 0
var hp = 3

func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.warp_mouse_position(position)

func _process(delta):
	frameCounter += 1
	if frameCounter >= delay:
		frameCounter = 0
		updateColor()
		
func _physics_process(delta):
	position = get_viewport().get_mouse_position()
	var lastMouseSpeed = Input.get_last_mouse_speed()
	var direction = atan2(lastMouseSpeed.y, lastMouseSpeed.x)
	var deg = direction*180/PI+135 
	rotation = Global.lerp_angle(rotation,direction+3*PI/4,0.3)

	move_and_slide(Vector2())

func getColor():
	return colorArr[colorIdx]

func updateColor():
	colorIdx += 1
	if colorIdx >= 3:
		colorIdx = 0
	anim.play(colorArr[colorIdx])

func checkHit(col):
	if col != getColor():
		getHit()

func getHit():
	print("Hit")
	hit += 1
	if hit >= hp:
		get_tree().change_scene("GameOver.tscn")
