extends Node2D

export var NumStars = 100

func _ready():
	Random.SetLimits(20, Resolution.GetResolution().x *0.5)

	for i in range(0, NumStars):
		var ins = preload("res://Games/RocketEscape/Stars/LittleStar.tscn").instance()
		var pos = Vector2(Random.NextInt(), 0)
		if i > 0:
			pos = pos + get_child(i-1).position
		var width = Resolution.GetWidth()
		if pos.x > width:
			pos.x = pos.x - width
		ins.position = pos
		self.add_child(ins)
	var height = Resolution.GetHeight()
	Random.SetLimits(20,  height*0.5)
	for i in range(0, get_child_count()):
		var pos = get_child(i).position
		pos.y = Random.NextInt()
		if i > 0:
			pos.y = pos.y + get_child(i-1).position.y
		if pos.y > height:
			pos.y =  pos.y - height
		get_child(i).position = pos
