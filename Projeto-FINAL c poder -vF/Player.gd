extends KinematicBody2D

#const UP = Vector2(0, -1)
var movimento = Vector2()
var up = Vector2(0, -1)
#var atitude=true
var salto = -600
var fase_atual
var estilo_energia
var alocar = true
var magia = preload("res://magia.tscn")

var passagem=preload("res://PassagemFase4.tscn")

func _ready():
	estilo_energia=$Energia.get("custom_styles/bg")
	estilo_energia.bg_color=Color("#cccccc")
	estilo_energia=$Energia.get("custom_styles/fg")
	estilo_energia.bg_color=Color("#f2071f")
	$Energia.value=100
	pass 

func _physics_process(delta):
	
	var p=get_parent().get_node("GUI/pontos")
	p.set_text("x"+str(Global.pontos))

	movimento.y += 20
	
	if Input.is_action_pressed("ui_right"):
		movimento.x = 200
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		movimento.x = -200
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		movimento.x = 0
		$Sprite.play("Idle")
			
	if is_on_floor():
		movimento.y = 400
		if Input.is_action_pressed("ui_up"):
			$pulo.play()
			movimento.y = salto
	else:
		$Sprite.play("Jump")
		#$pulo.play()
	if(Global.pizza==2):
		salto=-800
		
	if Input.is_action_just_released("poder"):
		magia()
		
	if(Global.pontos==6 && alocar):
		var nova_passagem=passagem.instance()
		get_parent().add_child(nova_passagem)
		nova_passagem.set_position(Vector2(2312,214))
		alocar=false
		
	movimento = move_and_slide(movimento, up)

func energia():
	#Decrementa a energia em 25%
	$Energia.value-=25
	
	#Muda de cor quando diminui a energia
	if($Energia.value==75):
		estilo_energia.bg_color=Color("#00ff00")
		$dano.play()
	elif($Energia.value==50):
		estilo_energia.bg_color=Color("#ffff00")
		$dano.play()
	elif($Energia.value==25):
		estilo_energia.bg_color=Color("#ff5900")
		$dano.play()	
	#Morre quando a energia
	if($Energia.value==0):
		morrer()
	pass

#func _cair(body):
#	if(body.get_name()=="Personagem"):
#		morrer()
#	pass # Replace with function body.

func _personagem_cair(body):
	if(body.get_name()=="Personagem"):
		morrer()
	pass # Replace with function body.

func _matar_Player(body):
#	if(body.get_name().substr(0,7)=="Inimigo"):
	if(body.get_name().begins_with("Inimigo")):
		energia()
	elif(body.get_name().begins_with("INIMIGOM")):
		energia()
	
	elif(body.get_name().begins_with("Chefe")):
		energia()
		
	pass # Replace with function body.
 
func _dano_esferas(body):
	if(body.get_name().begins_with("Esfera")):
		energia()
	elif(body.get_name().begins_with("fogo")):
		energia()
	pass # Replace with function body.
	
func morrer():
	movimento.x=0
	Global.total_vidas-=1
	Global.pontos=0
	Global.pizza=0
	#atitude=false
	$Sprite.play("Dead")
	yield(get_tree().create_timer(0.25),"timeout")
	get_tree().change_scene("res://"+fase_atual)
	#game over
	if(Global.total_vidas<=0):
		Global.total_vidas=3
		get_tree().change_scene("res://gameOver.tscn")
	pass

func criar_magia(posicao):
	var nova_magia= magia.instance()
	nova_magia.position = posicao
	get_parent().add_child(nova_magia)
	pass
	
func magia():
	if($magia/recarga_magia.is_stopped()):
		if($Sprite.flip_h == false):
			Global.magia_dir = 5
			criar_magia($magia/magia_direita.global_position)
			$magia/recarga_magia.start()
			#$som_magia.play()
		elif($Sprite.flip_h == true):
			Global.magia_dir = -5
			criar_magia($magia/magia_esquerda.global_position)
			$magia/recarga_magia.start()
			#$som_magia.play()
	pass

			
			










func _on_recarga_magia_timeout():
	$magia/recarga_magia.stop()
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if(area.get_name()=="magiaInimigo"):
		energia()	
	
	pass # Replace with function body.



