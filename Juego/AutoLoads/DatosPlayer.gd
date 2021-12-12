extends Node
signal actualizar_datos()
signal game_over()

var vidas = 3
var llaves = 0
var moneda_oro = 0
var moneda_bronce = 0
var moneda_plata = 0
var nivel_actual = ""
var puntaje = 0

func sumar_puntaje():
	var valor_oro = moneda_oro * 10
	var valor_plata = moneda_plata * 5
	var valor_bronce = moneda_bronce * 2
	puntaje = valor_oro + valor_bronce + valor_plata
	return puntaje 

func monedas_reset():
	moneda_oro = 0
	moneda_bronce = 0
	moneda_plata = 0

func reset():
	vidas = 3
	monedas_reset()

func restar_vidas():
	vidas -=1
	if vidas == 0:
		emit_signal("game_over")
	emit_signal("actualizar_datos")
	
func restar_llaves():
	llaves -= 1
	emit_signal("actualizar_datos")
	
func contar_llaves(valor):
	llaves = valor
	emit_signal("actualizar_datos")
	
func sumar_monedas(moneda):
	match moneda:
		"oro": 
			moneda_oro += 1
		"plata": 
			moneda_plata += 1
		"bronce": 
			moneda_bronce += 1
		_: 
			print("ERROR")
	
	emit_signal("actualizar_datos")
