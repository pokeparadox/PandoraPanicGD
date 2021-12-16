extends MiniGame

func _ready():
	._ready()
	self.Description = "Slash the monsters!"

func setupCredits() -> void:
	addCredit(CreditItem.CreditType.Game, "Dragons_Slayer", "Arena")
	addCredit(CreditItem.CreditType.Graphics, "Dragons_Slayer", "All")
	addCredit(CreditItem.CreditType.Music, "Dragons_Slayer", "All")
	addCredit(CreditItem.CreditType.Sound, "Dragons_Slayer", "All")
