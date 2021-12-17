extends Node2D

var mode = Score.ScoreMode.Panic

const STATUS_DISPLAY_TIME : int = 2

func _ready() -> void:
	$LifeBar.LivesCount = Score.Lives

func SetupInit(scoreMode) -> void:
	mode = scoreMode
	LoadNext()

func Setup(scoreMode, win : bool) -> void:
	$LifeBar.ChangeLives(Score.Lives)
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
