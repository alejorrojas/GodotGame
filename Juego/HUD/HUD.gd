extends Control

onready var etiqueta_vidas = $Vidas/Label	
onready var etiqueta_plata = $MonedasPlataHUD/Label
onready var etiqueta_oro = $MonedasOroHUD/Label
onready var etiqueta_bronce = $MonedasBronceHUD/Label
onready var etiqueta_llaves = $Llaves/Label

func _ready():
# warning-ignore:return_value_discarded
	DatosPlayer.connect("actualizar_datos", self, "actualizar_hud")
	actualizar_hud()

func actualizar_hud():
	etiqueta_vidas.text = "%s" % DatosPlayer.vidas
	etiqueta_bronce.text = "%s" % DatosPlayer.moneda_bronce
	etiqueta_plata.text = "%s" % DatosPlayer.moneda_plata
	etiqueta_oro.text = "%s" % DatosPlayer.moneda_oro
	etiqueta_llaves.text = "%s" %DatosPlayer.llaves
