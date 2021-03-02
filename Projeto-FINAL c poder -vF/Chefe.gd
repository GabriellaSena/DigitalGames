extends KinematicBody2D

var atitude = true
var mov = Vector2()
var estilo_energia
var magia = preload("res://magiaInimigo.tscn")


func _ready():
	estilo_energia=$EnergiaInimigo.get("custom_styles/bg")
	estilo_energia.bg_color=Color("#cccccc")
	estilo_energia=$EnergiaInimigo.get("custom_styles/fg")
	estilo_energia.bg_color=Color("#f2071f")
	$EnergiaInimigo.value=1000
	
	
	pass 

func _physics_process(delta):
	magiaInimigo()
	
func criar_magia(posicao):
	var nova_magia= magia.instance()
	nova_magia.position = posicao
	get_parent().add_child(nova_magia)
	pass

func magiaInimigo():
	if($magia/recarga_magia.is_stopped()):
			Global.magia_ini = -5
			criar_magia($magia/magia_esquerda.global_position)
			$magia/recarga_magia.start()
			#$som_magia.play()
	pass
	
func energiaInimigo():
	#Decrementa a energia 
	$EnergiaInimigo.value-=50
	
	#Muda de cor quando diminui a energia
	if($EnergiaInimigo.value==750):
		estilo_energia.bg_color=Color("#00ff00")
		$dano.play()
	elif($EnergiaInimigo.value==500):
		estilo_energia.bg_color=Color("#ffff00")
		$dano.play()
	elif($EnergiaInimigo.value==250):
		estilo_energia.bg_color=Color("#ff5900")
		$dano.play()	
	#Morre quando a energia
	if($EnergiaInimigo.value==0):
		morrer()
	pass

func _matar_boss(body):
	if((body.get_name()=="Personagem")):
		
		energiaInimigo()
	pass # Replace with function body.

func morrer():
	$Sprite.play("DeadInimigo")
	yield(get_tree().create_timer(1.5),"timeout")
	queue_free()
	pass




func _on_Area2D_area_entered(area):
	if(area.get_name()=="magia"):
		energiaInimigo()
		
	pass # Replace with function body.


func _on_Timer_timeout():
	$magia/recarga_magia.stop()
	pass # Replace with function body.



