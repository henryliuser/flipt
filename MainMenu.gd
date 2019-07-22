extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Global.timing = false
	Global.lab.visible = false
	Global.timeSec = 0.0
	


func _on_Play_pressed():
	get_viewport().warp_mouse(Vector2(146,182))
	get_tree().change_scene("res://testlevel2.tscn")
	Global.timing = true
	Global.lab.visible = true
	


func _on_Quit_pressed():
	get_tree().quit()