extends Control

export var proximo_nivel = "res://Juego/Niveles/Nivel1.tscn"

func _ready():
	DatosPlayer.reset()

func _on_Iniciar_pressed():
# warning-ignore:return_value_discarded
	MusicaGlobal.reset()
	get_tree().change_scene(proximo_nivel)
