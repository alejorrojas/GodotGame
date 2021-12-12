extends KinematicBody2D

export var velocidad = 200.0

var gravedad = 800.0
var movimiento = Vector2.ZERO

onready var animacion = $CorrerAnimacion
onready var detectar_vacio = $DetectarVacio
onready var detectar_pared = $DetectarPared

func _physics_process(_delta):
	correr()
	caer()
# warning-ignore:return_value_discarded
	move_and_slide(movimiento, Vector2.UP)
	
func caer():
	if not .is_on_floor():
		movimiento.y = gravedad
		
func correr():
	if not animacion.is_playing():
		animacion.play("correr")
		
	detectar_colision()
				
	movimiento.x = velocidad

func detectar_colision():
	if not detectar_vacio.is_colliding() or detectar_pared.is_colliding():
		velocidad *= -1
		detectar_vacio.position.x *= -1
		detectar_pared.position.x *= -1
		detectar_pared.scale *=-1
		animar(animacion.flip_h)

func animar(valor_actual):
	animacion.flip_h = !valor_actual


func _on_DetectarJugador_body_entered(body):
	body.respawn()
