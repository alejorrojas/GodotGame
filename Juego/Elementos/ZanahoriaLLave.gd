extends Area2D
signal consumida()


func _on_ZanahoriaLLave_body_entered(body):
	emit_signal("consumida")
	$ColisionPersonaje.set_deferred("disabled", true)
	$AnimationPlayer2.play("Consumir")
