extends StaticBody2D

var mov=Vector2()
var flip = true
var pos_inicial
var pos_final
var atitude=true

func _ready():
	$Sprite.play("Walk")
	pos_inicial = $".".position.x
	pos_final = pos_inicial + 100
	
func _process(delta):
	
	if(pos_inicial <= pos_final and flip):
		$".".position.x += 0.5
		$Sprite.flip_h = false
		if($".".position.x >= pos_final):
			flip = false
	
	if($".".position.x >= pos_inicial and !flip):
		$".".position.x -= 0.5
		$Sprite.flip_h = true
		if($".".position.x <= pos_inicial):
			flip = true

func _matar_inimigo(body):
	if(body.get_name()=="Personagem"):
		morrer()
		
func morrer():
	
		atitude=false
		mov.x=0
		$Sprite.play("DeadInimigo")
		$morrer.play()
		yield(get_tree().create_timer(1),"timeout")
		queue_free()



func _on_Area2D_area_entered(area):
	if(area.get_name()=="magia"):
		morrer()
	pass # Replace with function body.
