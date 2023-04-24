extends Node

# Declare member variables here.
export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	$StartTimer.start()

func _on_MobTimer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instance()
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	
	# Choose a random location on Path2D.
	var path_node = randi()%5+1
	print(path_node)
	if path_node == 1:
		mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	elif path_node == 2:
		mob_spawn_location = get_node("MobPath2/MobSpawnLocation")
	elif path_node == 3:
		mob_spawn_location = get_node("MobPath3/MobSpawnLocation")
	elif path_node == 4:
		mob_spawn_location = get_node("MobPath4/MobSpawnLocation")
	else:
		mob_spawn_location = get_node("MobPath5/MobSpawnLocation")

	# Set the mob's position to the spawn location.
	mob.position = mob_spawn_location.global_position
	print("Here I am!")
	
	# Choose the velocity for the mob.
	var velocity = Vector2(rand_range(125.0, 200.0), 0.0)
	mob.linear_velocity = velocity

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)

func _on_StartTimer_timeout():
	$MobTimer.start()
