extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://Fase1.tscn")
	pass

func _physics_process(delta):
	if Input.is_action_pressed("start"):
		get_tree().change_scene("res://Fase1.tscn")
	pass
func _on_Button3_pressed():
	get_tree().change_scene("res://Instructions.tscn")
	pass 

func _on_Button2_pressed():
	get_tree().quit()
	pass 
