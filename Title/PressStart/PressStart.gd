extends Sprite

var cumulativeTime = 0
var showStart = false
var isActive : bool = true setget setIsActive, getIsActive
var _isActive : bool = true
func setIsActive(active : bool) -> void:
	_isActive = active
	visible = active

func getIsActive() -> bool:
	return _isActive

func _physics_process(delta: float) -> void:
	if _isActive:
		cumulativeTime += delta * Global.FLASH_INTERVAL
		if cumulativeTime > 1:
			showStart = ! showStart
			self.visible = showStart
			cumulativeTime = 0



