extends Area2D

var distancia = 0

func _physics_process(delta):
	
	position.x += Global.magia_ini
	distancia += Global.magia_ini
	if(distancia >=300 || distancia <=-300):
		queue_free()
	pass
	


func _on_detectorI_body_entered(body):
	if(body.get_name().begins_with("Personagem")):
		body._matar_Player(body)
		$".".queue_free()
	
	pass # Replace with function body.


