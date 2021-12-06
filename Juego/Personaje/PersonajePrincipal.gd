extends KinematicBody2D


export var velocidad = Vector2(150.0, 150)
export var aceleracion_caida = 400
export var fuerza_salto = 2800
export var fuerza_rebote = 350
export var impulso_fuerza = 3000
export var powerup_vuelo = 60

onready var animacion = $Animacion
onready var sonido_salto = $AudioSalto
onready var camara = $Camera2D
onready var timer = $TimerPowerupSalto
onready var animacion_personaje = $AnimationPlayer
onready var timer_volar = $TimerPowerupVolar


var movimiento = Vector2.ZERO
var fuerza_salto_original 
var aceleracion_caida_original
var movimiento_habitado = true

func _ready():
	animacion.play("Idle")
	animacion_personaje.play("aclarar")
	fuerza_salto_original = fuerza_salto
	aceleracion_caida_original = aceleracion_caida

func _physics_process(delta):
	movimiento.x = velocidad.x * tomar_direccion() 
	caida_al_vacio()
	caer()
	saltar()
	rebote_techo()
	move_and_slide(movimiento, Vector2.UP)

#Movimiento PC
func saltar():
	if Input .is_action_just_pressed("salto") and is_on_floor() and movimiento_habitado:
		sonido_salto.play()
		animacion.play("Saltar")
		movimiento.y = 0
		movimiento.y  -= fuerza_salto

func tomar_direccion():
	var direccion = 0
	if movimiento_habitado:
		direccion = Input.get_action_strength("mov_derecha") - Input.get_action_strength("mov_izquierda")
		if direccion == 0:
			animacion.play("Idle")
		else:
			if direccion < 0:
				animacion.flip_h = true
			else:
				animacion.flip_h = false 
			animacion.play("Correr")

	return direccion
	
func caer():
	if not is_on_floor():
		animacion.play("Saltar")
		movimiento.y += aceleracion_caida
		movimiento.y = clamp(movimiento.y, -impulso_fuerza, velocidad.y)
	
func rebote_techo():
	if .is_on_ceiling():
		movimiento.y = fuerza_rebote
	

func caida_al_vacio():
	if position.y > camara.limit_bottom:
		respawn()

func impulso():
	movimiento.y = -impulso_fuerza
	
#metodos de respawn
func respawn():
	animacion_morir()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().reload_current_scene()
	
func animacion_morir():
	movimiento_habitado = false
	animacion.play("Morir")
	animacion_personaje.play("oscurecer")
	$GameOver.play()

#metodos de portal
func play_entrar_portal(posicion_portal):
	movimiento_habitado = false
	animacion_personaje.play("entrar_portal")
	$Tween.interpolate_property(
		self,
		"global_position",
		global_position,
		posicion_portal,
		0.8,
		Tween.TRANS_LINEAR, 
		Tween.EASE_IN_OUT
	)
	$Tween.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "entrar_portal":
		animacion_personaje.play("oscurecer") 


#PowerUp salto
func cambiar_fuerzasalto():
	timer.start()
	fuerza_salto = impulso_fuerza * 0.9

func _on_TimerPowerup_timeout():
	fuerza_salto = fuerza_salto_original
	
#PowerUp Volar

func volar():
	timer_volar.start()
	aceleracion_caida = powerup_vuelo
	animacion_personaje.play("Volar")
	movimiento.y = 0
	movimiento.y  -= fuerza_salto
	

func _on_TimerPowerupVolar_timeout():
	animacion_personaje.play("default")
	aceleracion_caida = aceleracion_caida_original



