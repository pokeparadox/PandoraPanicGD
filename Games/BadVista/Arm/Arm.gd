extends Node2D

export var power = 0.0

func _ready():
	set_process(true)
	var player = self.get_node("Player")
	player.play("Throw")

func Throw():
	var player = self.get_node("Player")
	player.stop(true)

	#var ang = get_node(".").get_rotd()
	var xVel = -power*3
	var yVel = -power*2
	var logo = get_node("WinLogo/KinematicBody2D")
	logo.set_linear_velocity(Vector2(xVel, yVel))
	logo.set_mode(0)

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		Throw()
