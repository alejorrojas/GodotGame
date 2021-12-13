extends Control

export var menu_ruta = "res://Juego/Menus/principal.tscn"

var nivel_actual = ""

func _ready():
	nivel_actual = DatosPlayer.nivel_actual 
	DatosPlayer.reset()


func _on_MenuPrincipal_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_ruta)


func _on_Reintentar_pressed():
# warning-ignore:return_value_discarded
	MusicaGlobal.reset()
	DatosPlayer.monedas_reset()
	get_tree().change_scene(nivel_actual)
