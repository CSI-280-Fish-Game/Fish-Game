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

	# Set the mob's position to the spawn location.
	mob.position = mob_spawn_location.position
	print("Here I am!")
	
	# Choose the velocity for the mob.
	var velocity = Vector2(rand_range(125.0, 200.0), 0.0)
	mob.linear_velocity = velocity

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
	
	# bind the mob signal to the score fucntion
	# mob.connect("catch", $UserInterface/ScoreLabel, "_fish_caught")

func _on_StartTimer_timeout():
	$MobTimer.start()
