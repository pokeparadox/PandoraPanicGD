extends Node2D

var LivesCount : int = 4
export var Spacing : int = 5

func ChangeLives(livesRemaining) -> void:
	var tree = get_tree()
	if tree:
		var lives = tree.get_nodes_in_group("Lives")
		if(lives):
			for l in lives:
				remove_child(l)
			lives.clear()

	var life : Node2D = $Life
	var spriteWidth = life.find_node("Normal").get_texture().get_width()

	var offset : int = 1
	for i in range(offset, LivesCount + offset):
		var life_clone : Node2D = life.duplicate()
		life_clone.position = Vector2((i-offset) * (spriteWidth + Spacing), 0)
		add_to_group("Lives")
		if i >= livesRemaining + offset and i <= LivesCount:
			life_clone.Lose()
		add_child(life_clone)
	$Life.hide()
