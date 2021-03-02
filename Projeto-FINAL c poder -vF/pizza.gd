extends Area2D
 
var movimento = Vector2()

func _ready():
	pass 

func _coletar_pizza(body):
	if(body.get_name()=="Personagem"):
		Global.pizza+=2
		queue_free()
	pass 
