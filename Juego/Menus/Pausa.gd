extends Control

export var menu_ruta = "res://Juego/Menus/principal.tscn"

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("pausa"):
		visible = not visible
		get_tree().paused = not get_tree().paused


func _on_ButtonContinuar_pressed():
	get_tree().paused = false
	visible = false


func _on_ButtonMenuPrncipal_pressed():
# warning-ignore:return_value_discarded
	get_tree().paused = false
	get_tree().change_scene(menu_ruta)
