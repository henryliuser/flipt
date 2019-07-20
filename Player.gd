extends KinematicBody2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _physics_process(delta):
	position = get_viewport().get_mouse_position()
	var lastMouseSpeed = Input.get_last_mouse_speed()
	var direction = atan2(lastMouseSpeed.y, lastMouseSpeed.x)
	var deg = direction*180/PI+135 
	rotation = Global.lerp_angle(rotation,direction+3*PI/4,0.4)
	move_and_slide(Vector2())
	

