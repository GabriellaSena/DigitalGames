extends StaticBody2D


var proxima_fase

func _ready():
	proxima_fase="Fase"+str(Global.cont)+".tscn"
	pass

func _on_Area2D_body_entered(body):
	if(body.get_name()=="Personagem"):
		Global.pontos=0
		get_tree().change_scene("res://Fase4.tscn")
		Global.cont+=1
	pass # Replace with function body.

