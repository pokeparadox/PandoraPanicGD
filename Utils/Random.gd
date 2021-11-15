extends Node
var rand = RandomNumberGenerator.new()
var MaxValue = 1
var MinValue = 0

func SetLimits(minV,  maxV):
	MaxValue = maxV
	MinValue = minV

func NextFloat() -> float:
	return rand_range(MinValue, MaxValue)

func NextInt() -> int:
	return rand.randi_range(MinValue, MaxValue)

func NextFloatRange(minV, maxV) -> float:
	return rand_range(minV, maxV)

func NextIntRange(minV, maxV) -> int:
	return rand.randi_range(minV, maxV)

func NextBool() -> bool:
	if rand.randi_range(0, 1) == 1:
		return true
	else:
		return false

func _ready():
	randomize()
	rand.randomize()
