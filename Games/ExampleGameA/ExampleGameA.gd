extends MiniGame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_ButtonWin_pressed() -> void:
	Score.GameWin() # The API Call to announce that the game is won.


func _on_ButtonLose_pressed() -> void:
	Score.GameLose() # The API call to announce that the game is lost.
