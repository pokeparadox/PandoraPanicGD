extends Node

class_name CreditItem

enum CreditType {Game, Music, Graphics, Sound, Thanks}

var Active : bool = false setget , getActive
export var Author : String = ""
export var Item : String = ""
export var Type := CreditType.Game

func getActive() -> bool:
	return Author != "" and Item != ""

func toString() -> String:
	return Author + " - " + Item
