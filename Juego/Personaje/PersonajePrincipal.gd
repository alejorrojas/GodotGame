extends KinematicBody2D


export var velocidad = Vector2(150.0, 150)
export var aceleracion_caida = 400
export var fuerza_salto = 3000
export var fuerza_rebote = 350
export var impulso_fuerza = 3600

onready var animacion = $Animacion
onready var sonido_salto = $AudioSalto
onready var camara = $Camera2D

var movimiento = Vector2.ZERO


func _ready():
	animacion.play("Idle")


func _physics_process(delta):
	movimiento.y += aceleracion_caida * delta
	caida_al_vacio()
	caer()
	caminar_pc()
	saltar()
	rebote_techo()
	move_and_slide(movimiento, Vector2.UP)


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
	
func respawn():
		get_tree().reload_current_scene()

#MovimientoAndroid

func _on_MovDerecha_pressed():
		movimiento.x = velocidad.x
		animacion.flip_h = false 
		animacion.play("Correr")
		


func _on_MovDerecha_released():
	movimiento.x = 0
	animacion.play("Idle")
	

func _on_MovIzquierda_pressed():
	movimiento.x = -velocidad.x
	animacion.flip_h = true 
	animacion.play("Correr")



func _on_MovIzquierda_released():
	movimiento.x = 0
	animacion.play("Idle")


func _on_MovArriba_pressed():
	if is_on_floor():
		sonido_salto.play()
		animacion.play("Saltar")
		movimiento.y = 0
		movimiento.y  -= fuerza_salto

func _on_MovArriba_released():
	rebote_techo()
	caer()
	if .is_on_floor():
		animacion.stop()
		animacion.play("Idle")

#Movimiento PC
func saltar():
	if Input .is_action_just_pressed("salto") and is_on_floor():
		sonido_salto.play()
		animacion.play("Saltar")
		movimiento.y = 0
		movimiento.y  -= fuerza_salto

	
func caminar_pc():
	if Input.is_action_just_pressed("mov_derecha"):
		animacion.flip_h = false
		movimiento.x = velocidad.x
		animacion.play("Correr")
		
	else:
		if Input.is_action_just_pressed("mov_izquierda"):
			animacion.flip_h = true
			movimiento.x = -velocidad.x
			animacion.play("Correr")
	
	
	
	
