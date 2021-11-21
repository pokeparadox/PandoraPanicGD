extends Node

# constants:
const FLASH_INTERVAL = 2.35

enum MainMenuOption { PandoraPanic, Pandordered, SelectionBox, Scores, Achievements, Credits, Quit }


func _ready():
	# Initialization here
	randomize()
