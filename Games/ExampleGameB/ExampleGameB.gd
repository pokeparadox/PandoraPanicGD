extends MiniGame

# Some setup
func _ready() -> void:
	._ready()
	self.Description = "An example game where you can choose to win or lose"

# Make sure everyone is properly creditted - then intention that this will feed into the credits screen.
func setupCredits() -> void:
	addCredit(CreditItem.CreditType.Game, "PokeParadox", "ExampleGameB")


func _on_ButtonWin_pressed() -> void:
	Score.GameWin()


func _on_ButtonLose_pressed() -> void:
	Score.GameLose()
