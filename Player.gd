extends KinematicBody2D
# This script controls movement
const UP = Vector2(0, -1)
var motion = Vector2()
export var speed = 200 # Exported variables can be modified in Inspector under 'Script Variables' upon clicking Player node
export var gravity = 50
export var jump_force = -700

func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_pressed("ui_right"):
		motion.x = speed # move by 200 px/s to the right
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -(speed) # parenthesis is optional. But nice imo.
		
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = jump_force
		
	motion = move_and_slide(motion, UP)
