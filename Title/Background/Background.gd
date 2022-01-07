extends Sprite
var ChangeColour : bool = true
var res = Resolution.GetResolution()
var rect = Rect2(0, 0, res.x, res.y)
var fillColour = Color(0,0,1,0.3)
var interval = 0

func _ready() -> void:
	SetRandomColour()

func SetRandomColour() -> void:
	var r = min(randf(), 1)
	var g = min(randf(), 1)
	var b = min(randf(), 1)
	var a = min(randf(), 0.5)
	fillColour = Color(r,g,b,a)
	update()

func _physics_process(delta: float) -> void:
	if not ChangeColour:
		return

	interval += (delta * Global.FLASH_INTERVAL)

	if interval > 2:
		interval = 0
		SetRandomColour()

func _draw():
	draw_rect(rect, fillColour)
	draw_texture(self.get_texture(), Vector2(0,0))
