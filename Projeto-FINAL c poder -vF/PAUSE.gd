extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var pausado = not get_tree().paused
		get_tree().paused = pausado
		visible = pausado
		


func _on_Button_pressed():
		get_tree().paused =not get_tree().paused
		visible = not visible
		

func _on_Button2_pressed():
		get_tree().quit()


