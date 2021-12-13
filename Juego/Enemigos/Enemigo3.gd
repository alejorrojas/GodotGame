extends Node2D

export var rayo: PackedScene
export var cast_long = 800

onready var detectar_jugador = $Sprite/RayCast2D
onready var posiciones_disparo = $Sprite/PosicionesDisparo
onready var timer = $Timer
onready var sonido_disparo = $Rayos


var puede_disparar = true

func _ready():
	detectar_jugador.cast_to.y = cast_long

func _process(_delta):
	if detectar_jugador .is_colliding() and puede_disparar:
		disparar()
		puede_disparar = false
		timer.start()
		
		
func disparar():
	sonido_disparo.play()
	for posicion in posiciones_disparo.get_children():
		var nuevo_rayo = rayo.instance()
		nuevo_rayo.crear_pos(posicion.global_position)
		owner.get_node("Rayos").add_child(nuevo_rayo)
		
		
func _on_Timer_timeout():
	puede_disparar = true
