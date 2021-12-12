extends Node
signal activar_portal()

export var escena_gameover = "res://Juego/Menus/GameOver.tscn"
export var nivel_actual = ""

var numero_llaves = 0
var contenedor_llaves

onready var nubes = $ParallaxBackground/Nubes


func _ready():
# warning-ignore:return_value_discarded
	DatosPlayer.connect("game_over", self, "game_over")
	contenedor_llaves = get_node_or_null("Zanahorias")
	if contenedor_llaves != null:
		contar_llaves()

func _process(_delta):
	nubes.motion_offset.x -= 1
		
func contar_llaves():
	numero_llaves = contenedor_llaves.get_child_count()
	DatosPlayer.contar_llaves(numero_llaves)
	for llave in contenedor_llaves.get_children():
		llave.connect("consumida", self, "llaves_restantes")
			
func llaves_restantes():
	numero_llaves -= 1
	if numero_llaves == 0:
		emit_signal("activar_portal")
		
func game_over():
	DatosPlayer.nivel_actual = nivel_actual
# warning-ignore:return_value_discarded
	get_tree().change_scene(escena_gameover)
