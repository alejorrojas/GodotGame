extends "res://Juego/Elementos/Pinchos.gd"

onready var detectar_jugador = $DetectarJugador
onready var animacion = $AnimationPlayer

export var cast_long = 40


func _ready():
	detectar_jugador.cast_to.y = cast_long

func _process(_delta):
	if detectar_jugador.is_colliding():
		animacion.play("caer_trampa")
		
