extends RigidBody2D

# Called when mob node enters scene for first time.
func _ready():
	$AnimatedSprite.play()
	#var mob_types = $AnimatedSprite.get_sprite_frames().get_animation_names()
	#$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]  # randomly picks animation type


# Destroys mob instance when it leaves screen view.
func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
