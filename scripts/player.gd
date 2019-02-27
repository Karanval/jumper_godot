extends KinematicBody2D

const SPEED = 700
const GRAVITY = 3600
const UP = Vector2(0, -1)
const JUMP_SPEED = -1200
const HURT_SPEED = -1000
const JUMP_BOOST = 1.5

var motion = Vector2()
export var world_limit = 3260

func _physics_process(delta):
  update_motion(delta)

func update_motion(delta):
  fall(delta)
  walk()
  jump()
  move_and_slide(motion, UP)
  
func fall(delta): 
  if is_on_floor() or is_on_ceiling():
    motion.y = 0
  else:
    motion.y += GRAVITY * delta
    
  motion.y = clamp(motion.y,(JUMP_SPEED * JUMP_BOOST), -JUMP_SPEED)
  
func walk():
  if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
    motion.x = SPEED
  elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
    motion.x = -SPEED
  else:
    motion.x = 0

func jump():
  if is_on_floor() and Input.is_action_pressed("ui_up"):
    motion.y = JUMP_SPEED

func boost():
  motion.y = JUMP_BOOST * JUMP_SPEED