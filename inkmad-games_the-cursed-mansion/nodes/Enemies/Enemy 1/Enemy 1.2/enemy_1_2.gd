extends CharacterBody2D


const speed = 100
const accel = 50

@export var player: Node2D
@onready var nav: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta):
	var direction = Vector3()
	makepaht()
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed , accel * delta)
	
	move_and_slide()
	
func makepaht() -> void:
	nav.target_position = player.global_position
