extends CharacterBody2D

@onready var y_pos = position.y
var speed = 600


func _ready():
	pass

func _physics_process(delta):
	position.y = y_pos
	velocity.x = 0
	
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= speed
		
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += speed
		
	move_and_slide()
	pass
