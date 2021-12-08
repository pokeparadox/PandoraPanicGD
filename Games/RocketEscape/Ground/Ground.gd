extends Area2D

signal GroundHit(hit)

func _on_Ground_body_entered(body: Node) -> void:
	# call the GroundHit signal
	emit_signal("GroundHit", true)

func _on_Ground_body_exited(body: Node) -> void:
	emit_signal("GroundHit", false)
