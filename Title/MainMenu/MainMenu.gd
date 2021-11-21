extends VBoxContainer
signal MenuOptionSelected(option)

func _on_PandoraPanic_pressed() -> void:
	emit_signal("MenuOptionSelected", Global.MainMenuOption.PandoraPanic)


func _on_Pandordered_pressed() -> void:
	emit_signal("MenuOptionSelected", Global.MainMenuOption.Pandordered)


func _on_SelectionBox_pressed() -> void:
	emit_signal("MenuOptionSelected", Global.MainMenuOption.SelectionBox)


func _on_Scores_pressed() -> void:
	emit_signal("MenuOptionSelected", Global.MainMenuOption.Scores)


func _on_Achievements_pressed() -> void:
	emit_signal("MenuOptionSelected", Global.MainMenuOption.Achievements)


func _on_Credits_pressed() -> void:
	emit_signal("MenuOptionSelected", Global.MainMenuOption.Credits)


func _on_Quit_pressed() -> void:
	emit_signal("MenuOptionSelected", Global.MainMenuOption.Quit)
