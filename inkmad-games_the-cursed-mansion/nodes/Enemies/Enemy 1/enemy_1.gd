extends CharacterBody2D


var speed = 100


@export var player: Node2D
@onready var nav_agent:= $NavigationAgent2D as NavigationAgent2D

var dir = global_position
var p = 1

func _ready() -> void:
	
	makepaht()

func _physics_process(_delta: float) -> void:
	
	#var dir = to_local(nav_agent.get_next_path_position().normalized())
	
	if player.luz.visible and player in $Area2D.get_overlapping_bodies():
		makepaht()
		$AnimEnemy.play("Walk")
		speed = 300
	else:
		speed = 0
		$AnimEnemy.play("Idle")
	
	velocity = dir * speed
	
	if (dir.x < 0):
		$AnimEnemy.scale.x = -2
	else:
		$AnimEnemy.scale.x = 2
	
	move_and_slide()

func makepaht() -> void:
	dir = self.global_position.direction_to(player.global_position)
