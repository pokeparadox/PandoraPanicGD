extends Node2D

export var Colour1 = Color(0.5, 0.5 , 0.5)
export var Colour2 = Color(1,1,0)
export var Colour3 = Color(1, 1 , 1)
export var Colour4 = Color(0.25, 0.25, 1)
export var Dimensions = Vector2(1,1)
var ActiveColour = Colour1

func _physics_process(delta):
	var colour = Random.NextIntRange(1,4)
	if colour == 1:
		ActiveColour = Colour1
	elif colour == 2:
		ActiveColour = Colour2
	elif colour == 3:
		ActiveColour = Colour3
	else:
		ActiveColour = Colour4
	if Random.NextBool():
		update()

func _draw():
	draw_rect(Rect2(position, Dimensions), ActiveColour)

