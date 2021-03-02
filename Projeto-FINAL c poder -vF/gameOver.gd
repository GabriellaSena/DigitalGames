extends Control


func _ready():
	pass # Replace with function body.

func _on_Button2_pressed():
	get_tree().change_scene("res://Fase1.tscn")
	pass

func _on_Button_pressed():
	get_tree().quit()
	pass # Replace with function body.
