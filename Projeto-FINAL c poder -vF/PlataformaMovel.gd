extends KinematicBody2D

var mov=Vector2()

var p_inicial = position.y
var p_final = p_inicial + 200

var sentido=1

#verifica sentido do movimento
func _physics_process(delta):
	if(sentido==1):
		mov.y =  100
	elif(sentido==-1):
		mov.y= -100
		
#verifica a posição inicial e a posição final
	if(position.y>p_final):
		sentido=-1
	elif (position.y<p_inicial):
		sentido=1
		
	move_and_slide(mov)

		
