extends Node

const SavePath := "User://Score"
const SaveFile := "Score.scr"

enum ScoreMode { Panic, Ordered, SelectionBox }

onready var Mode = ScoreMode.Panic
onready var Lives : int = 4
onready var CurrentScore : int = 0
onready var HiScore : int = 0
onready var CurrentPlayer : String = ""

func Load(mode) -> void:
	Mode = mode
	Lives = 4
	CurrentScore = 0

func Save(name : String = "") -> void:
	# Save the hi score with the player's name
	pass

func LoadNext():
	if Mode == ScoreMode.Panic:
		SceneManager.LoadRandomGameScene()
	elif Mode == ScoreMode.Ordered:
		SceneManager.LoadNextGameScene()

func GameWin() -> void:
	CurrentScore += 1
	LoadNext()

func GameOver():
	# TODO load gameover screen
	pass

func GameLose() -> void:
	Lives -= 1
	if Lives <= 0:
		Lives = 0
		GameOver()
	else:
		LoadNext()
