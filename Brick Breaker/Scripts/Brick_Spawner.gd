extends Node2D

# Store initial positions of bricks
var initial_positions = []

func _ready():
	# Save the initial positions of all child bricks
	for child in get_children():
		initial_positions.append(child.position)

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == Key.KEY_R:
			reset_bricks()

func reset_bricks():
	print("Resetting bricks")
	# Remove all existing bricks
	for child in get_children():
		child.queue_free()

	# Recreate bricks at initial positions
	for pos in initial_positions:
		var brick = preload("res://Items/Brick.tscn").instance()
		brick.position = pos
		add_child(brick)
