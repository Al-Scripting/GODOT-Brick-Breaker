extends CharacterBody2D

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	if move_and_slide():
		queue_free()
		pass	
