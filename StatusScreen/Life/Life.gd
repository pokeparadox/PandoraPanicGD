extends Node2D

func Normal() -> void:
	$Normal.show()
	$Lost.hide()

func Lose() -> void:
	$Normal.hide()
	$Lost.show()
