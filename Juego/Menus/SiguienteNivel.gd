extends Button

export var siguiente_nivel = "res://Juego/Niveles/Nivel1.tscn"

func _on_pressed():
	get_tree().change_scene(siguiente_nivel)
