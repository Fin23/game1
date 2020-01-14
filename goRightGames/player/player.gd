extends KinematicBody2D

#============= Movement Function (fns) ==========

const SPEED = 770
var movedir = Vector2(0,0)
var spritedir = "down"

func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop()
	
	if is_on_wall():
		if spritedir == "left" and test_move(transform, Vector2(-1,0)):
			anim_switch("push")
		if spritedir == "right" and test_move(transform, Vector2(1,0)):
			anim_switch("push")
		if spritedir == "up" and test_move(transform, Vector2(0,-1)):
			anim_switch("push")	
		if spritedir == "down" and test_move(transform, Vector2(0, 1)):
			anim_switch("push")	
			
	elif movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")


func controls_loop():
	var LEFT	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
	
func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"
	
func anim_switch(animation):
	var newanim = str(animation, spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)
	
	#================== end of movement fns ========