extends "res://Juego/Elementos/MonedaBase.gd"

var tipo_moneda = "plata"

func _on_MonedasBase_body_entered(_body):
	animacion_consumir.play("Consumir")
	DatosPlayer.sumar_monedas(tipo_moneda)
