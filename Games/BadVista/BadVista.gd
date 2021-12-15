extends MiniGame

func _ready() -> void:
	._ready()
	self.Description = "If you wanna win, throw windows in the bin!"

func setupCredits() -> void:
	addCredit(CreditItem.CreditType.Game, "Todd", "BadVista")
	addCredit(CreditItem.CreditType.Music, "Gruso", "Windows (Badvista)")
	addCredit(CreditItem.CreditType.Graphics, "Gruso", "badvista.org")

func _on_WinArea_body_entered(body: Node) -> void:
	# Check velocity is lowering and then set win condition
	Score.GameWin()


func _on_ResetArea_body_entered(body: Node) -> void:
	# Reset logo back into hand
	pass

# Check for losing condition when logo comes to rest on floor

# Fix multiple throw bug
