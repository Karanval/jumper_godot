extends "res://scripts/player.gd"

func _ready():
  global.player = self
  
func _process(delta):
  update_animation()
  
func update_animation():
  $AnimatedSprite.update(motion)  



