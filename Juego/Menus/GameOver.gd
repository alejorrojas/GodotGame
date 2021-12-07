extends Control

export var proximo_nivel = ""

func _on_MenuPrincipal_pressed():
	get_tree().change_scene(proximo_nivel)
