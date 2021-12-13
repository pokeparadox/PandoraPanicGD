extends Node2D

class_name MiniGame

export var GameName := "MyGame"
export var GameDescription := ""
export var GameAuthor := ""

func _winGame():
	Score.GameWin()

func _loseGame():
	Score.GameLose()
