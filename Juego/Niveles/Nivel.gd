extends Node
signal activar_portal()

onready var nubes = $ParallaxBackground/Nubes

var numero_llaves = 0
var contenedor_llaves


func _ready():
	contenedor_llaves = get_node_or_null("Zanahorias")
	if contenedor_llaves != null:
		contar_llaves()
		
func _process(delta):
	nubes.motion_offset.x -= 1
		
func contar_llaves():
	numero_llaves = contenedor_llaves.get_child_count()
	for llave in contenedor_llaves.get_children():
		llave.connect("consumida", self, "llaves_restantes")
			
func llaves_restantes():
	numero_llaves -= 1
	print(numero_llaves)
	if numero_llaves == 0:
		emit_signal("activar_portal")
