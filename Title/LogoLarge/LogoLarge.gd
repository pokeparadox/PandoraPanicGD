extends Sprite

var rot = false
var sc = false
var changeBgColour = false
var randRotVal = false
var randScaleVal = false
var currScale = 1
var currAng = 0
var angDir = 0
var scDir = 0
var currColour

func _ready():
	if randf() < 0.3:
		angDir = 1
	else:
		angDir = -1
	if randf() < 0.3:
		scDir = 1
	else:
		scDir = -1
	if randf() < 0.3:
		rot = true
	if randf() < 0.3:
		sc = true
	if randf() < 0.3:
		randRotVal = true
	if randf() < 0.3:
		randScaleVal = true

func _physics_process(delta: float) -> void:
	if rot:
		var rotVal = 0
		if randRotVal:
			rotVal = randf()*delta * 5
		else:
			rotVal = delta* 0.1
		currAng += (rotVal*angDir)
	if sc:
		var scVal = 0
		if randScaleVal:
			scVal = randf()*delta * 2
		else:
			scVal = delta* 0.001

		if currScale <= 0.8 || currScale > 2:
			scDir = -scDir
		currScale += (scVal*scDir)


	rotation_degrees = currAng
	self.scale = Vector2(currScale, currScale)
