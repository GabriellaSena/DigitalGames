extends Area2D


var distancia = 0

func _physics_process(delta):
	
	position.x += Global.magia_dir
	distancia += Global.magia_dir
	if(distancia >=300 || distancia <=-300):
		queue_free()
	pass
	


func _on_detector_body_entered(body):
	if(body.get_name().begins_with("INIMIGOM")):
		body._matar_inimigom(body)
		$".".queue_free()
	if(body.get_name().begins_with("Inimigo")):
		body._matar_inimigo(body)
		$".".queue_free()	
	
	pass # Replace with function body.
