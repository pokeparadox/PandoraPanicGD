extends Node2D

export var LivesCount : int = 3
export var Spacing : int = 5
var curentLives : int = 3


func _ready() -> void:
	# Grab the Life node
	var life : Node2D = $Life
	var spriteWidth = life.find_node("LifeNormal").get_texture().get_width()

	for i in range(0, LivesCount):
		var life_clone : Node2D = life.duplicate()
		life_clone.position = Vector2(i * (spriteWidth + Spacing), 0)
		add_child(life_clone)

func ChangeLives(lives) -> void:
	var diff = LivesCount - lives
	for i in range(0, diff):
		var child = get_child(i)
		child.Lose()
