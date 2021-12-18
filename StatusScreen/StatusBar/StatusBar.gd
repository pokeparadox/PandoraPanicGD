extends Node2D


func SetLives(lives : int) -> void:
	$HBoxContainer/LivesValue.text = str(lives)

func SetStage(stage : int) -> void:
	$HBoxContainer/StageValue.text = str(stage)
