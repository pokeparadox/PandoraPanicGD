tool
extends TextureButton

# TODO Have component auto size and centre the text within the image button.
# The manual positioning will do the job for now.

export var LabelText : String = "" setget setLabelText, getLabelText
export var LabelOffset : Vector2 = Vector2.ZERO setget setLabelOffset, getLabelOffset
export var SelectedTextColour : Color = Color.white
export var TextColour : Color = Color.yellow

func setLabelText(text) -> void:
	if $Label:
		$Label.text = text

func getLabelText() -> String:
	return $Label.text

func setLabelOffset(offset : Vector2) -> void:
	if $Label:
		$Label.set_position(offset)

func getLabelOffset() -> Vector2:
	return $Label.get_position()


func _on_TextureTextButton_focus_entered() -> void:
	$Label.set("custom_colors/font_color", SelectedTextColour)


func _on_TextureTextButton_focus_exited() -> void:
	$Label.set("custom_colors/font_color", TextColour)


func _on_TextureTextButton_mouse_entered() -> void:
	_on_TextureTextButton_focus_entered()


func _on_TextureTextButton_mouse_exited() -> void:
	_on_TextureTextButton_focus_exited()
