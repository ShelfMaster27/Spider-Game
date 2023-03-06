extends RigidBody2D


var velocity
var speed
onready var animation = $"Bigger Spider animation"


func _process(delta):
	var player = get_node("/root/Game/Player") 
	var distance = player.position - self.position
	var move_x = distance.x
	var move_y = distance.y
	if move_x == 0 and move_y == 0:
		animation.play("Idle")
	elif abs(move_x) < 20:
		animation.play("up_down")
	elif move_x > 0:
		animation.play("move right")
	elif move_x < 0:
		animation.play("move left")


func _physics_process(delta):
	var player = get_node("/root/Game/Player") 
	var distance = player.position - self.position
	var velocity_factor = 50
	if distance.length() < 200:
		velocity_factor = 50
		
	velocity = distance.normalized()*delta*velocity_factor
	global_position += velocity
	

func _ready() -> void:
	get_node("/root/Game/Bigger Spider").visible = false
 

func _on_Spawn_Timer_spawn():
	pass







