extends Node2D

var mode = Score.ScoreMode.Panic

const STATUS_DISPLAY_TIME : int = 2

func _ready() -> void:
	$Background.ChangeColour = false
	$LifeBar.LivesCount = Score.Lives

func SetupInit(scoreMode) -> void:
	mode = scoreMode
	LoadNext()

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


func LoadNext() -> void:
	if mode == Score.ScoreMode.Ordered:
		SceneManager.LoadNextGameScene()
	elif mode == Score.ScoreMode.Panic:
		SceneManager.LoadRandomGameScene()

func _on_Status_ResultSoundFinished() -> void:
	LoadNext()
