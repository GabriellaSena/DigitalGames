extends Node

func _ready():
	$PERSONAGENS/Personagem.fase_atual="Fase1.tscn"
	$PERSONAGENS/GUI/vidas.set_text("x"+str(Global.total_vidas))
	
	pass # Replace with function body.

func _on_Musica_finished():
	$Musica.play()
	pass # Replace with function body.
