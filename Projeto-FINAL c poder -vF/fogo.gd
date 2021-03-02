extends KinematicBody2D

var mov=Vector2()
var sentido=1
var pin=position.y
var flip = true
var pos_inicial
var pf=pin+300
var pos_final

func _ready():
	pos_inicial = $".".position.y
	pos_final = pos_inicial + 300
	pass # Replace with function body.	

func _process(delta):
	
	if(pos_inicial <= pos_final and flip):
		$".".position.y += 5
		$Sprite.flip_v = false
		if($".".position.y >= pos_final):
			flip = false
	
	if($".".position.y >= pos_inicial and !flip):
		$".".position.y -= 10
		$Sprite.flip_v = true
		if($".".position.y <= pos_inicial):
			flip = true




	
