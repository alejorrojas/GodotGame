extends Area2D

export var velocidad = 350.0

onready var animacion = $AnimatedSprite
onready var detectar_jugador = $Colisionador

var mi_pos = Vector2.ZERO

func crear_pos(pos):
	mi_pos = pos
	
func _ready():
	animacion.play("caer")
	global_position = mi_pos
	

func _process(delta):	
	global_position.y += velocidad * delta
	

func _on_Rayo_body_entered(body):
	if body.is_in_group("jugadores"):
		body.respawn()

 queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
