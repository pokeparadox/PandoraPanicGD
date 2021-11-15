extends Sprite
var res = Resolution.GetResolution()
var rect = Rect2(0, 0, res.x, res.y)
var fillColour = Color(0,0,1,0.3)
var interval = 0

func _process(delta: float) -> void:
	#if Input.is_action_pressed("ui_accept"):
	#	showAttract(false)
	#elif Input.is_action_pressed("ui_cancel"):
	#	showAttract(true)

	interval += (delta * Global.FLASH_INTERVAL)

	if interval > 2:
		interval = 0
		var r = min(randf(), 1)
		var g = min(randf(), 1)
		var b = min(randf(), 1)
		var a = min(randf(), 0.5)
		fillColour = Color(r,g,b,a)
		update()

func _draw():
	draw_rect(rect, fillColour)
	draw_texture(self.get_texture(), Vector2(0,0))

#func _on_Button_pressed():
#	showAttract(false)

#func showAttract(show):
#	var logo = get_node("LogoLarge")
#	var pressStart = get_node("PressStart")
#	logo.set_process(show)
#	pressStart.set_process(show)
#	if show:
#		logo.show()
#		pressStart.show()
#		get_node("Menu").hide()
#	else:
#		logo.hide()
#		pressStart.hide()
#		get_node("Menu").show()



#func _on_PandoraPanic_pressed():
#	SceneManager.SetScene("res://MiniGames/Arena/Arena.tscn")
