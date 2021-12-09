extends Node2D

signal PlatformHit(hit)

var middleSegs = []

func _ready():
	var numSegs = 3
	var beginNode = get_node("LeftSegment")
	var leftAnim = get_node("LeftSegment/AnimationPlayer").play("Flash")
	var middle = get_node("MiddleSegment")
	var rightNode = get_node("RightSegment")
	var rightAnim = get_node("RightSegment/AnimationPlayer").play("Flash")
	var width = get_node("MiddleSegment/Sprite").get_texture().get_width()
	var totalWidth = (numSegs + 2) * width
	var height = get_node("MiddleSegment/Sprite").get_texture().get_height()

	var colShape = $PlatformShape
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(totalWidth/2, height/2))
	colShape.set_shape(shape)

	middleSegs.append(middle)
	for i in range(1, numSegs):
		var ins = preload("res://Games/RocketEscape/Platform/MiddleSegment.tscn").instance()
		ins.global_position = (middle.position + Vector2(width*i, 0))
		middleSegs.append(ins)



	rightNode.global_position = (middle.global_position + Vector2(width * numSegs, 0))
	for i in middleSegs:
		self.add_child(i)
	middle.hide()


func _on_Platform_body_entered(body: Node) -> void:
	emit_signal("PlatformHit", true)


func _on_Platform_body_exited(body: Node) -> void:
	emit_signal("PlatformHit", false)
