extends Node2D

func _ready() -> void:
	Normal()

func Normal() -> void:
	$LifeNormal.show()
	$LifeLost.hide()

func Lose() -> void:
	$LifeNormal.hide()
	$LifeLost.show()
