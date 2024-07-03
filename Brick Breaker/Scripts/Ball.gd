extends CharacterBody2D

const SPEED = 600
var Respawning: bool = false

var custom_icon = preload("res://Sprites/DVD icon.png")
var default_icon: Texture


func _ready():
	default_icon = get_node("Sprite2D").texture
	velocity = Vector2.DOWN * SPEED
	print("Ball ready")

func _physics_process(delta):
	
	if Input.is_key_pressed(KEY_1):
		get_node("Sprite2D").texture = default_icon
	if Input.is_key_pressed(KEY_2):
		get_node("Sprite2D").texture = custom_icon
	
	if Respawning:
		respawn()
	else:
		var collision_info = move_and_collide(velocity * delta)
		if collision_info:
			velocity = velocity.bounce(collision_info.get_normal())
			

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
		print("Body entered respawn area")
		if body == self:
			print("It's the ball!")
			Respawning = true

func respawn():
	print("Respawning")
	global_position = get_parent().get_node("Paddle").global_position
	velocity = Vector2.DOWN * SPEED
	Respawning = false


