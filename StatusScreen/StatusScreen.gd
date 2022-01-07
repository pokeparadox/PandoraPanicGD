extends "res://Title/GetReady.gd"

func _ready() -> void:
	._ready()
	$LifeBar.LivesCount = Score.Lives

func Setup(scoreMode, win : bool) -> void:
	var lives = Score.Lives
	$StatusBar.SetLives(lives)
	$LifeBar.ChangeLives(lives)
	$StatusBar.SetStage(Score.CurrentScore)
	mode = scoreMode
	if win:
		$Status.Win()
	else:
		$Status.Lose()

func _on_Status_ResultSoundFinished() -> void:
	LoadNext()
