extends Node2D

var mode = Score.ScoreMode.Panic

func _ready() -> void:
	$Background.ChangeColour = false

func SetupInit(scoreMode) -> void:
	mode = scoreMode

func LoadNext() -> void:
	if mode == Score.ScoreMode.Ordered:
		SceneManager.LoadNextGameScene()
	elif mode == Score.ScoreMode.Panic:
		SceneManager.LoadRandomGameScene()


func _on_Timer_timeout() -> void:
	LoadNext()
