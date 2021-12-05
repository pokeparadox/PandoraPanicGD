extends Sprite

func _ready():
	var fr = randi()%4
	self.set_frame(fr)
