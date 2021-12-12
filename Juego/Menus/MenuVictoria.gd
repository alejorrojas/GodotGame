extends Control

export var proximo_nivel = "res://Juego/Niveles/NivelTemporal.tscn"

func _ready():
	$Puntaje.text = "Puntaje: %s" % DatosPlayer.sumar_puntaje()


func _on_SiguienteNivel_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(proximo_nivel)
	


func _on_MenuPrincipal_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Juego/Menus/principal.tscn")
