extends Area2D

onready var detectar_jugador = $DetectarJugador
onready var detectar_pisoton = $DetectarPisoton/ColisionadorPisoton
onready var animacion = $AnimationPlayer



func _on_DetectarPisoton_body_entered(body):
	desactivar_colisionadores([detectar_jugador, detectar_pisoton])
	animacion.stop()
	animacion.play("Morir")
	
	body.impulso()
	
	
	
	

func _on_Enemigo2_body_entered(body):
	body.respawn()

func desactivar_colisionadores(colisionadores):
	for colision in colisionadores:
		colision.set_deferred("disabled", true)
		colision.set_deferred("visible", false)

