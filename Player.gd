extends KinematicBody2D
var delay = 70
var frameCounter = 0
var colorArr = ["blu","aquamarine","leafcutter"]
var colorIdx = 0
onready var anim = $AnimatedSprite
var firstTwo = 0
var hit = 0
var hp = 3

var lastPos = position
var moved = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.warp_mouse_position(position)
	hp = get_parent().hpLul
	if get_parent().name == "asif":
		visible = false
	position = Vector2(146,182)

func _process(delta):
	frameCounter += 1
	if frameCounter >= delay:
		frameCounter = 0
		updateColor()
	if not moved or (not lastPos == Vector2(146,182)):
		moved = true
		
		
func _physics_process(delta):
	
	if firstTwo < 2:
		visible = false
		position = Vector2(146,182)
		firstTwo += 1
		
	if firstTwo >= 2:
		if moved:
			print("GAH")
			visible = true
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
	if firstTwo >= 2:
		hit += 1
		if hit >= hp:
			Global.timing = false
			get_tree().change_scene("GameOver.tscn")
