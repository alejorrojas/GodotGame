extends Area2D

onready var animacion = $AnimationPlayer


func _ready():
	animacion.play("Idle")

func _on_PowerUpBaSe_body_entered(body):
	aplicar_powerup(body)
	animacion.play("Consumir")
	
# warning-ignore:unused_argument
func aplicar_powerup(body):
	pass
