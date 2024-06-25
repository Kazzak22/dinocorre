extends Node2D

@export var mob_scene: PackedScene

var screen_size: Vector2i
var PlayerInitialPosition
var SonidoFondo = preload("res://dinoplayer/Zero-G -  Distorted Trumpets (Extended to 5 minutes and looped).mp3")

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position
	GHud.start_game.connect(new_game)
	Music.stream = SonidoFondo
	Music.play()

func game_over():
	GHud.mob_counter = 0
	GHud.update_high_score_label()
	$MOBTimer.stop()

func new_game():
	GHud.mob_counter = 0
	$Floor.position.x = 0
	$Player.position = PlayerInitialPosition
	$MOBTimer.start()

func _process(_delta):
	$Floor.position.x = $Player.position.x - 150
	
func _on_mob_timer_timeout():
	if GHud.mob_counter < 2:
		var mob = mob_scene.instantiate()
		mob.position.x = $Player.position.x + 1500
		mob.position.y = 640
		add_child(mob)
		mob.hit.connect(game_over)
		$MOBTimer.wait_time = 1
