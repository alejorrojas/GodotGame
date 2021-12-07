extends Control

export var proximo_nivel = ""


func _on_Iniciar_pressed():
	get_tree().change_scene(proximo_nivel)
