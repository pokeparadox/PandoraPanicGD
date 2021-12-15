extends MiniGame

func _ready():
	._ready()
	self.Description = "Land the rocket on the landing Pad!"
	# Setup connection of fuel bar and rocket
	var rocket = get_node("Rocket")
	var fuel = get_node("FuelBar")
	rocket.connect("FuelLevelChanged", fuel, "OnFuelLevelChanged")



func setupCredits() -> void:
	addCredit(CreditItem.CreditType.Game, "PokeParadox", "Plander")
	addCredit(CreditItem.CreditType.Graphics, "Dragons_Slayer", "Rocket and Pad")
