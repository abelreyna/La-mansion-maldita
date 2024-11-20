extends CharacterBody2D


var speed = 5


@export var player: Node2D
@onready var nav_agent:= $NavigationAgent2D as NavigationAgent2D

func _ready() -> void:
	makepaht()

func _physics_process(_delta: float) -> void:
	
	var dir = to_local(nav_agent.get_next_path_position().normalized())
	velocity = dir * speed
	
	move_and_slide()

func makepaht() -> void:
	nav_agent.target_position = player.global_position


func _on_timer_timeout():
	makepaht()
	pass # Replace with function body.
