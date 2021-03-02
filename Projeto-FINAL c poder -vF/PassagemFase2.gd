extends StaticBody2D



func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if(body.get_name()=="Personagem"):
		Global.pontos = 0
		get_tree().change_scene("res://Fase3.tscn")
		#Global.cont+=1
	pass # Replace with function body.
