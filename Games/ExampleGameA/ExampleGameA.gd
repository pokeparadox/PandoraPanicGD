extends MiniGame

func _ready() -> void:
	._ready()
	self.Description = "An example game where you can win or lose."

func setupCredits() -> void:
	addCredit(CreditItem.CreditType.Game, "PokeParadox", "ExampleGameA")

func _on_ButtonWin_pressed() -> void:
	Score.GameWin() # The API Call to announce that the game is won.


func _on_ButtonLose_pressed() -> void:
	Score.GameLose() # The API call to announce that the game is lost.
