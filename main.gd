extends Node2D

var screen_size : Vector2i

var PlayerInitialPosition

func  _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player .position
	print(PlayerInitialPosition)
func new_game():
	$Floor.position.x = 0
	$Player.position = PlayerInitialPosition

func _process (delta):
	$Floor.position.x = $Player.position.x - 250
