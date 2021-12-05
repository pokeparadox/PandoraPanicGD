extends Node2D
signal FuelLevelChanged
export var FuelLevel = 100
export var Dimensions = Vector2(150, 15)
export var BackgroundColour = Color(1,1,1)
export var ForegroundColour = Color(1,0,0)
export var BorderSize = 1

func _draw():
	draw_rect(Rect2(position, Dimensions), BackgroundColour)
	var scale = FuelLevel/100.0
	var dims = Dimensions
	dims.x = dims.x * scale
	var offset = Vector2(BorderSize, BorderSize)
	draw_rect(Rect2(position+offset, dims-(offset*2)), ForegroundColour)

func OnFuelLevelChanged(var fuel):
	self.FuelLevel = fuel
	self.update()
