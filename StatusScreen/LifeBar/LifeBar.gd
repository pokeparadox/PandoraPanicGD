extends Node2D

var LivesCount : int = 4
export var Spacing : int = 5

func _ready() -> void:
	pass


func ChangeLives(livesRemaining) -> void:
	var tree = get_tree()
	if tree:
		var lives = tree.get_nodes_in_group("Lives")
		if(lives):
			for l in lives:
				remove_child(l)
			lives.clear()
	# Grab the Life node
	var life : Node2D = $Life
	var spriteWidth = life.find_node("Normal").get_texture().get_width()

	for i in range(0, LivesCount):
		var life_clone : Node2D = life.duplicate()
		life_clone.position = Vector2(i * (spriteWidth + Spacing), 0)
		add_to_group("Lives")
		if i > livesRemaining:
			life_clone.Lose()
		add_child(life_clone)
	$Life.hide()
