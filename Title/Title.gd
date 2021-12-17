extends Node2D
var attractMode : bool = true setget setAttractMode, getAttractMode
var _attractMode : bool = true

func _ready() -> void:
	$StarSpread.emitting = true
	setAttractMode(true)

func setAttractMode(attractEnabled : bool) -> void:
	_attractMode = attractEnabled
	$MainMenu.visible = not attractEnabled
	$SmallLogo.visible = not attractEnabled
	$LogoLarge.visible = attractEnabled
	$PressStart.isActive = attractEnabled

func getAttractMode() -> bool:
	return _attractMode

func _input(event: InputEvent) -> void:
	if _attractMode and (event.is_action_pressed("ui_accept") or event.is_action("ui_cancel")):
		setAttractMode(false)
	else:
		pass
		## todo process normal input

func _on_MainMenu_MenuOptionSelected(option) -> void:
	match(option):
		Global.MainMenuOption.PandoraPanic:
			Score.Load(Score.ScoreMode.Panic)
		Global.MainMenuOption.Pandordered:
			Score.Load(Score.ScoreMode.Ordered)
		Global.MainMenuOption.SelectionBox:
			Score.Load(Score.ScoreMode.SelectionBox)
		Global.MainMenuOption.Scores:
			# Load Scores Scene
			pass
		Global.MainMenuOption.Credits:
			# Load Credits Scene
			pass
		Global.MainMenuOption.Quit:
			get_tree().quit()


func _on_PandoraPanicTheme_finished() -> void:
	setAttractMode(false)
	$PandoraPanicTheme.play()
