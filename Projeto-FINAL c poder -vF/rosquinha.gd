extends Area2D


func _coletar_item(body):
	if (body.get_name() == "Personagem"):
		Global.pontos +=1		
		#$coletar.play()
		queue_free()
	pass
	
		
