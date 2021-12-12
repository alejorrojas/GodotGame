extends Area2D

export var proximo_nivel =""

var encendido = false

func _ready():
# warning-ignore:return_value_discarded
	get_parent().connect("activar_portal", self, "animacion_play")


func _on_Portal_body_entered(body):
	if encendido:
		body.play_entrar_portal(global_position)
		yield(get_tree().create_timer(1.0), "timeout")
		cambiar_nivel()
		
func cambiar_nivel():
# warning-ignore:return_value_discarded
	get_tree().change_scene(proximo_nivel)

func animacion_play():
	encendido = true
	$AnimationPlayer.play("activado")
	
