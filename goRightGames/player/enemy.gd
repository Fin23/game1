extends KinematicBody2D

const GRAVITY = 10 
const SPEED = 90
const wall = Vector2(0, -1)

var velocity = Vector2() 

var direction = 1


func _ready():
	pass

func _physics_process(delta):
    velocity.x  = SPEED * direction

    if direction == 1:
        $AnimatedSprite.flip_h = false
    else:
        $AnimatedSprite.flip_h = true

    $AnimatedSprite.play("walk")

  

    velocity = move_and_slide(velocity, wall)

    if is_on_wall():
        direction = direction * -1
        
