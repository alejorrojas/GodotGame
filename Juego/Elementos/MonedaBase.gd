extends Area2D

onready var animacion = $AnimatedSprite
onready var colision_personaje = $ColisionPersonaje
onready var animacion_consumir = $AnimationPlayer

func _ready():
	animacion.play()


func _on_MonedasBase_body_entered(body):
	colision_personaje.set_deferred("disable", true)
	
