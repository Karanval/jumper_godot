extends AnimatedSprite

func update(motion):
  if motion.y < 0:
    animation = "jump"
  elif motion.x > 0:
    animation = "walk"
    flip_h = false
  elif motion.x < 0:
    animation = "walk"
    flip_h = true
  #elif motion.y == 0 && motion.x == 0:
  else: 
    animation = "iddle"
  #elif motion.y > 0:
   # animation = "fall"
  play(animation)