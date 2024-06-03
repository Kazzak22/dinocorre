extends Node2D
@export var mob_scence: PackedScene
var screen_size : Vector2i

var PlayerInitialPosition

func  _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position
	GHud.start_game.connect(new_game)
	
func game_over():
	GHud.update_high_score_label()
	
func new_game():
	print('empieza')
	$Floor.position.x = 0
	$Player.position = PlayerInitialPosition
	$MOBTimer.start() 

func _process (delta):
	$Floor.position.x = $Player.position.x - 150


func _on_mob_timer_timeout():
	var mob = mob_scence.instantiate()
	mob.position.x = $Player.position.x + 1500
	mob.position.y = 550
	add_child(mob)
	mob.hit.connect(game_over)
	$MOBTimer.wait_time = 2
