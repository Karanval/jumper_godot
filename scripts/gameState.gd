extends Node2D

export var starting_lives = 5
export var coin_target = 5 #coinsto get new life
var lifes
var coins = 0
var next_scene_y = 0

func _ready():
  global.gameState = self
  load_scene()
  
  lifes = starting_lives
  #update_GUI()

#func update_GUI():
 # GUI.update_GUI(coins, lifes)
  
#func animate_GUI(animation):
 # GUI.animate(animation)

func hurt():
  lifes -= 1
  print("AUCH!")
  #global.player.hurt()
  #update_GUI()
  #animate_GUI("hurt")
  #Global.pain_sfx.play()
  #if lifes < 0:
    #end_game()

func coin_up():
  coins += 1
  #update_GUI()
  #animate_GUI("coinPulse")
  var coin_mult = (coins % coin_target) == 0
  if coin_mult:
    live_up()
  
func live_up():
  lifes += 1
  #animate_GUI("lifePulse")
  
#func end_game():
 # get_tree().change_scene(global.gameOver)
  
#func win_game():
  #get_tree().change_scene(Global.victory)
  
func load_scene():
  var index = get_random_index()
  var scene = load(global.scenes[2]).instance()
  scene.set_position(Vector2(0, next_scene_y))
  next_scene_y -= 5000
  $scenes.add_child(scene)
  
func get_random_index():
  var max_index = global.scenes.size()
  return randi() % max_index + 1

func _on_Portal_body_entered(body):
  win_game()

