extends "res://Juego/Elementos/MonedaBase.gd"

func _on_MonedasBase_body_entered(body):
	animacion_consumir.play("ConsumirOro")
