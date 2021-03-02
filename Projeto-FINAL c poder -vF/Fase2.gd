extends Node

func _ready():
	$PERSONAGENS/GUI/vidas.set_text("x"+str(Global.total_vidas))
	$PERSONAGENS/Personagem.fase_atual="Fase2.tscn"
	pass # Replace with function body.

func _on_Musica_finished():
	$Musica.play()
	pass # Replace with function body.
