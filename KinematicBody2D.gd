extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

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
	elif Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		_animated_sprite.play("move up_down")
	elif velocity.x == 0:
		_animated_sprite.play("idle")

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
onready var _animated_sprite = $AnimatedSprite

	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
