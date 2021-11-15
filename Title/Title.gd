extends Node2D

onready var attractMode : bool = true

func _ready() -> void:
	$StarSpread.emitting = true
	setAttractMode(attractMode)

func setAttractMode(attractEnabled : bool):
	$MainMenu.visible = not attractEnabled
	$SmallLogo.visible = not attractEnabled
	$LogoLarge.visible = attractEnabled
	$PressStart.isActive = attractEnabled

func _input(event: InputEvent) -> void:
	if attractMode and (event.is_action_pressed("ui_accept") or event.is_action("ui_cancel")):
		attractMode = false
		setAttractMode(attractMode)
	else:
		pass
		## todo process normal input

func _on_MainMenu_MenuOptionSelected(option) -> void:
	attractMode = true
	setAttractMode(attractMode)
