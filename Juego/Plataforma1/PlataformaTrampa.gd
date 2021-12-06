extends StaticBody2D



func _on_DetectarJugador_body_entered(body):
	$DetectarJugador.set_deferred("disable", true)
	$AnimationPlayer.play("Caer")
	
func desativar_plataforma():
	$CollisionPolygon2D.set_deferred("disable", true)
