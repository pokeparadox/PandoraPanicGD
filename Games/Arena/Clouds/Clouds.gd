
extends Sprite

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	# Randomise clouds starting offset
	var res = Resolution.GetResolution()
	var vec = Vector2(min(randf(), res.x), min(randf()*res.y, res.y))
	global_position = vec

func _process(delta):
	# Move clouds from right  to left
	global_position.x -= 2 * delta * 10

	# If the clouds go off the left of the screen then randomlyoffset them to enter from
	# The right.
	var res = Resolution.GetResolution()
	if global_position.x < -res.x:
		var vec = Vector2(res.x, min(randf()* res.y, res.y))
		global_position = vec
