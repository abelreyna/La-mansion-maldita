extends CharacterBody2D
const SPEED =150

@onready var luz:= $PointLight2D as PointLight2D

func _physics_process(delta):
	var dir: Vector2 =Input.get_vector("izquierda","derecha","arriba","abajo")
	var position = global_position
	
	if Input.is_action_just_pressed("light"):
		luz.visible = !luz.visible
	
	if dir:
		if dir.x != 0:
			if dir.x > 0:
				if dir.y > 0 or dir.y == 0:
					$"AnimNiña".play("walk_right_down")
				if dir.y < 0:
					$"AnimNiña".play("walk_right_up")
				pass
			else:
				if dir.y > 0 or dir.y == 0:
					$"AnimNiña".play("walk_left_down")
				if dir.y < 0:
					$"AnimNiña".play("walk_left_up")
				pass
		else:
			if dir.y > 0:
				$"AnimNiña".play("walk_down")
				pass
			else:
				$"AnimNiña".play("walk_up") 
				pass   
	else:
		
		$"AnimNiña".play("Idle")
		
		pass
		
	velocity = dir.normalized() * SPEED
	move_and_slide()
	pass
