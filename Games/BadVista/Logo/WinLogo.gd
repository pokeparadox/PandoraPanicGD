extends Node2D

var bounces = 0

func _ready():
	bounces = 0

func _on_KinematicBody2D_body_enter( body ):
	checkBounces()

func _on_KinematicBody2D_body_enter_shape( body_id, body, body_shape, local_shape ):
	checkBounces()

func checkBounces():
	get_node("Ding").play()
	bounces = bounces + 1

	if bounces > 5:
		var col = get_node("KinematicBody2D")
		col.set_contact_monitor(false)
		col.set_process(false)
		set_pause_mode(PAUSE_MODE_STOP)
		bounces = 0
