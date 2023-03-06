extends KinematicBody2D

signal hit
signal health_updated(health)
signal killed()

export (int) var speed = 200
export (float) var max_health = 100

onready var health = max_health
onready var invulnerability_timer = $InvulnerabilityTimer
onready var amount_hit = 0
onready var camera = $Pivot/Camera2D


var screen_size # Size of the game window.
var velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * 200
	
func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("move right")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("move left")
	elif Input.is_action_pressed("ui_up"):
		_animated_sprite.play("move up_down")
	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.play("move up_down")
	elif velocity.x == 0:
		_animated_sprite.play("idle")
	emit_signal("health_updated", health)

func _physics_process(_delta):
	get_input()
	move_and_slide(velocity)
	
onready var _animated_sprite = $AnimatedSprite

var look_direction = Vector2(1,0)
func _on_Player_hit():
	pass

func set_dead(value):
	set_process_input(not value)
	set_physics_process(not value)
	$CollisionShape2D.disabled = value

func damage(amount):
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
	if amount_hit == 10:
		_set_health(health - amount_hit)


func _set_health(value):
	var health = 100
	var previous_health = health
	health = clamp(value, 0, max_health)
	if health != previous_health:
		emit_signal("health_updated", health)
		if health == 0:
			emit_signal("killed")





func _on_Bigger_Spider_body_shape_entered(body_id, body, body_shape, local_shape):
	print ("hi")
