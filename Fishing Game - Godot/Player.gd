extends Area2D

const SPEED = 750 # how fast the player will move (pixels/sec)
const FISHING_LINE = 2*(OS.window_size.x / 3) # 2/3 of window width

# The fish hook follows the height of the mouse cursor.
func _process(delta):
	# move vector from current position to cursor
	var vec = get_viewport().get_mouse_position() - self.position 
	# normalize it and multiply by time and speed
	vec = vec.normalized() * delta * SPEED
	position += vec # move by that vector
	position.x = FISHING_LINE # locks on vertical axis of screen
