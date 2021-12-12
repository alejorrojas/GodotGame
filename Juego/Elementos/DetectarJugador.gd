extends "res://Juego/Elementos/Pinchos.gd"

onready var detectar_jugador = $DetectarJugador
onready var animacion = $AnimationPlayer

func _process(_delta):
	if detectar_jugador.is_colliding():
		animacion.play("Caer")
		
