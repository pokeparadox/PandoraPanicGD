extends MiniGame

func _ready():
	# Setup connection of fuel bar and rocket
	var rocket = get_node("Rocket")
	var fuel = get_node("FuelBar")
	rocket.connect("FuelLevelChanged", fuel, "OnFuelLevelChanged")
