extends Node2D

var middleSegs = []

func _ready():
	var numSegs = 3
	var beginNode = get_node("LeftSegment")
	var leftAnim = get_node("LeftSegment/AnimationPlayer").play("Flash")
	var middle = get_node("MiddleSegment")
	var rightNode = get_node("RightSegment")
	var rightAnim = get_node("RightSegment/AnimationPlayer").play("Flash")
	var width = get_node("MiddleSegment/Sprite").get_texture().get_width()
	middleSegs.append(middle)
	for i in range(1, numSegs):
		var ins = preload("res://Games/RocketEscape/Platform/MiddleSegment.tscn").instance()
		ins.position = (middle.position + Vector2(width*i, 0))
		middleSegs.append(ins)


	rightNode.position = (middleSegs.back().position + Vector2(width, 0))
	for i in middleSegs:
		self.add_child(i)
