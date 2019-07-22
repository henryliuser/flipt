extends Control

func _ready():
	Global.timing = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://MainMenu.tscn")