extends Node2D

class_name MiniGame

var CreditsIndex : int = 0
var Credits = {}
var Description := ""

func _ready() -> void:
	setupCredits()

func setupCredits() -> void:
	pass

func addCredit(type, author, itemName):
	var cred = CreditItem.new()
	cred.Author = author
	cred.Item = itemName
	cred.Type = type
	Credits[CreditsIndex] = cred
	CreditsIndex += 1

func _winGame():
	Score.GameWin()

func _loseGame():
	Score.GameLose()
