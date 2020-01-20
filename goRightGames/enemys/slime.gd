extends "res://engine/entity.gd"

const GRAVITY = 10 

const wall = Vector2(0, -1)

var velocity = Vector2() 

var direction = 1


func _ready():
	pass

func _physics_process(delta):
    velocity.x  = SPEED * direction

    if direction == 1:
        $anim.bool = false
    else:
        $anim.bool = true

    $anim.play("default")

  

    velocity = move_and_slide(velocity, wall)

    if is_on_wall():
        direction = direction * -1