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
	var getReady = preload("res://Title/GetReady.tscn").instance()
	getReady.SetupInit(Mode)

	Mode = mode
	Lives = 4
	CurrentScore = 0
	SceneManager.SetScene(getReady)

func Save(name : String = "") -> void:
	# Save the hi score with the player's name
	pass

func LoadNext(win : bool) -> void:
	var statusScreen = preload("res://StatusScreen/StatusScreen.tscn").instance()
	statusScreen.Setup(Mode, win)
	SceneManager.SetScene(statusScreen)

func GameWin() -> void:
	CurrentScore += 1
	LoadNext(true)

func GameOver():
	# TODO load gameover screen
	pass

func GameLose() -> void:
	Lives -= 1
	if Lives <= 0:
		Lives = 0
		GameOver()
	else:
		LoadNext(false)
