extends Area2D

signal hit

func _ready():
	var collisions = [
		$SquareA,
	] 
	var sprites = [
		$SquareA,
	]
	var random_int = randi() % collisions.size()
	var selected_collisions = collisions [random_int]
	var selected_sprite = sprites[random_int]
	selected_collisions.disabled = false
	selected_sprite.visible = true


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body. is_in_proup("dinosaurio"):
		print("game over")
		hit.emit()

