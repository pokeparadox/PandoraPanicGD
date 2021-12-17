extends Node2D

signal ResultSoundFinished

func Win() -> void:
	$Win.show()
	$Lose.hide()
	$WinSound.play()

func Lose() -> void:
	$Win.hide()
	$Lose.show()
	$LoseSound.play()


func _on_WinSound_finished() -> void:
	emit_signal("ResultSoundFinished")


func _on_LoseSound_finished() -> void:
	emit_signal("ResultSoundFinished")
