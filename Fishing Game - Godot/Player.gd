extends Area2D

const SPEED = 500 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _process(delta):
	var vec = get_viewport().get_mouse_position() - self.position # getting the vector from self to the mouse
	vec = vec.normalized() * delta * SPEED # normalize it and multiply by time and speed
	position += vec # move by that vector
