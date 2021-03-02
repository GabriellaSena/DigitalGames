extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://menu.tscn")
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	$Musica.play()
	pass # Replace with function body.
