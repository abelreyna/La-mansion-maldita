extends CharacterBody2D


var speed = 100


@export var player: Node2D
@onready var nav_agent:= $NavigationAgent2D as NavigationAgent2D

var dir = global_position
var p = 1

func _ready() -> void:
	#Crea la ruta hacia el personaje
	makepaht()

func _physics_process(_delta: float) -> void:
	
	#var dir = to_local(nav_agent.get_next_path_position().normalized())
	
	#Detecta que la linterna este prendida y que este en el área de visión
	if player.luz.visible and player in $Area2D.get_overlapping_bodies():
		makepaht()
		#Reproduce animación de correr
		$AnimEnemy.play("Walk")
		speed = 300
	else:
		speed = 0
		#Reproduce animación de dezcanso
		$AnimEnemy.play("Idle")
	
	velocity = dir * speed
	
	#Gira al personaje dependiendo su dirección en x
	if (dir.x < 0):
		$AnimEnemy.scale.x = -2
	else:
		$AnimEnemy.scale.x = 2
	
	move_and_slide()

func makepaht() -> void:
	dir = self.global_position.direction_to(player.global_position)
