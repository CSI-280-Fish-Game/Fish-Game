extends Node

# Declare member variables here.
export var mob_scene: PackedScene
var score


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	# $Player.start($StartPosition.position)
	$StartTimer.start()

func _on_MobTimer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instance()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	#direction += rand_range(-PI / 4, PI / 4)
	#direction -= 1000
	

	# Choose the velocity for the mob.
	var velocity = Vector2(rand_range(125.0, 225.0), 0.0)
	mob.linear_velocity = velocity.rotated(245)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_StartTimer_timeout():
	$MobTimer.start()
