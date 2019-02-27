extends "res://scripts/player.gd"
  
func _process(delta):
  update_animation()
  
func update_animation():
  $AnimatedSprite.update(motion)  



