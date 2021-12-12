extends "res://Juego/Elementos/MonedaBase.gd"

var tipo_moneda = "oro"

func _on_MonedasBase_body_entered(_body):
	animacion_consumir.play("ConsumirOro")
	DatosPlayer.sumar_monedas(tipo_moneda)
