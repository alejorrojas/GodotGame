extends StaticBody2D

onready var animacion = $AnimationPlayer


func _ready():
	animacion.play("Idle")


func _on_DetectarJugador_body_entered(body):
	body.impulso()
	animacion.play("Impulsar")
