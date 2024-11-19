extends CharacterBody2D
const SPEED =300.0
func _physics_process(delta):
	var dir: Vector2 =Input.get_vector("izquierda","derecha","arriba","abajo")
	
	if dir:
		if dir.x != 0:
			if dir.x > 0:
				$"AnimNiña".play("walk_right_down")
				pass
			else:
				$"AnimNiña".play("walk_left_down")
		else:
			if dir.y > 0:
				$"AnimNiña".play("walk_down")
				pass
			else:
				$"AnimNiña".play("walk_up") 
				pass   
	else:
		
		$"AnimNiña".stop()
		$"AnimNiña".frame = 0
		
		pass
		
	velocity = dir.normalized() * SPEED
	move_and_slide()
	pass
