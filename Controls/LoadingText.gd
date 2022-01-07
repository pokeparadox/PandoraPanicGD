extends Label
const maxDots : int = 3
var dotCount : int = 0
var undottedText : String = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dotCount = 0
	undottedText = self.text



func _on_Timer_timeout() -> void:
	# Increase the dot count.
	dotCount += 1
	if dotCount > maxDots:
		dotCount = 0

	# Update the label.
	var text : String = ""
	for _i in range(0, dotCount):
		text += "."
	self.text = undottedText + text

