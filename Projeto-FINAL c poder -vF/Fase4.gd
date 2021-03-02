extends Node

func _ready():
	$PERSONAGENS/Personagem.fase_atual="Fase4.tscn"
	$PERSONAGENS/GUI/vidas.set_text("x"+str(Global.total_vidas))
	pass # Replace with function body.

func _on_Musica_finished():
	$MUSICA/Musica.play()
	pass # Replace with function body.



