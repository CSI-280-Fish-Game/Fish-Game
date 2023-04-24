extends Label

# Declare member variables here.
var score = 0

# Called when the node enters the scene tree for the first time.
func _fish_caught():
	print("Here")
	score += 1
	text = "Score: %s" % score
