extends "res://Juego/Elementos/MonedaBase.gd"

var tipo_moneda = "bronce"

func _on_MonedasBase_body_entered(body):
	if body.is_in_group("jugadores"):
		DatosPlayer.sumar_monedas(tipo_moneda)
		animacion_consumir.play("Consumir")
