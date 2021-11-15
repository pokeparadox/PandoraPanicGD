extends Node

var AngleToVectorLookup = {}

func DegreesToVector2d(angleDeg: float) -> Vector2:
	angleDeg = clamp(abs(angleDeg), 0, 360)
	if(not AngleToVectorLookup.has(angleDeg)):
		var rad = deg2rad(angleDeg)
		AngleToVectorLookup[angleDeg] = Vector2(sin(rad), cos(rad))
	return AngleToVectorLookup[angleDeg]
