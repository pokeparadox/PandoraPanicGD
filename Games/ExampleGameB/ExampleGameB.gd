extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_ButtonWin_pressed() -> void:
	Score.GameWin()


func _on_ButtonLose_pressed() -> void:
	Score.GameLose()
