extends Node2D


func _on_WinArea_body_entered(body: Node) -> void:
	# Check velocity is lowering and then set win condition
	Score.GameWin()


func _on_ResetArea_body_entered(body: Node) -> void:
	# Reset logo back into hand
	pass

# Check for losing condition when logo comes to rest on floor

# Fix multiple throw bug
