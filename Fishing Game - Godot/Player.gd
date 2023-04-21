extends Area2D

const SPEED = 750 # how fast the player will move (pixels/sec)
const FISHING_LINE_X = 2*(OS.window_size.x / 3) # 2/3 of window width
const FISHING_LINE_Y = 3*(OS.window_size.y / 4) # 3/4 of window height

# The fish hook follows the height of the mouse cursor.
func _process(delta):
	# move vector from current position to cursor
	var vec = get_viewport().get_mouse_position() - self.position 
	# normalize it and multiply by time and speed
	vec = vec.normalized() * delta * SPEED
	position += vec # move by that vector
	position.x = FISHING_LINE_X # locks on vertical axis of screen
	update()

func _on_Player_body_entered(body):
	var mobscene = preload("res://Mob.tscn")
	var instance = mobscene.instance()
	instance._caught()  # call function from Mob.gd script
	body.queue_free()  # catch fish instance
