extends VBoxContainer

signal MenuOptionSelected(option)

enum MainMenuOption { PandoraPanic, Pandordered, SelectionBox, Scores, Achievements, Credits, Quit }

func _on_PandoraPanic_pressed() -> void:
	emit_signal("MenuOptionSelected", MainMenuOption.PandoraPanic)


func _on_Pandordered_pressed() -> void:
	emit_signal("MenuOptionSelected", MainMenuOption.Pandordered)


func _on_SelectionBox_pressed() -> void:
	emit_signal("MenuOptionSelected", MainMenuOption.SelectionBox)


func _on_Scores_pressed() -> void:
	emit_signal("MenuOptionSelected", MainMenuOption.Scores)


func _on_Achievements_pressed() -> void:
	emit_signal("MenuOptionSelected", MainMenuOption.Achievements)


func _on_Credits_pressed() -> void:
	emit_signal("MenuOptionSelected", MainMenuOption.Credits)


func _on_Quit_pressed() -> void:
	emit_signal("MenuOptionSelected", MainMenuOption.Quit)
