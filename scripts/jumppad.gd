extends Node2D

func _on_Timer_timeout():
  $AnimatedSprite.play("idle")

func _on_Area2D_body_entered(body):
  $AnimatedSprite.play("boost")
  $Timer.start()
  global.player.boost()
