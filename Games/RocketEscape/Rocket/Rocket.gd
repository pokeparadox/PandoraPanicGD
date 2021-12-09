extends RigidBody2D
signal FuelLevelChanged

const MaxThrust = 10.0
const Acceleration = 0.05
const Rotation = 0.01
const MaxRotation = 45
const fuelUsageRate = 0.1

var padLanding : bool = false
var groundLanding : bool = false

var lastAngle = 0
var currentThrust = 1
var firstTouch = true
var fuel = 100

func _physics_process(delta):
	if Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_accept"):
		ActivateThrusters()
	else:
		DisableThrusters()

	var angle = abs(rotation_degrees)

	if angle < MaxRotation:
		lastAngle = global_rotation_degrees
		if Input.is_action_pressed("ui_left"):
			rotate(-Rotation)
		elif Input.is_action_pressed("ui_right"):
			rotate(Rotation)
	else:
		global_rotation_degrees = lastAngle

func ActivateThrusters():
	if fuel > 0:
		fuel = fuel - fuelUsageRate
		firstTouch = false
	else:
		DisableThrusters()
		return

	SetThrusters(true)
	emit_signal("FuelLevelChanged", fuel)
	if currentThrust < MaxThrust:
		currentThrust = currentThrust+Acceleration
	var rot = global_rotation
	var vel = Vector2(currentThrust * sin(rot), -currentThrust * cos(rot))
	var prevVel = self.get_linear_velocity()
	self.set_linear_velocity(vel + prevVel)

func DisableThrusters():
	SetThrusters(false)
	currentThrust = 1

func SetThrusters(val):
	for i in get_tree().get_nodes_in_group("Thrusters"):
		i.set_emitting(val)


func _on_Rocket_body_entered(body: Node) -> void:
	if not firstTouch:
		firstTouch = true
	if firstTouch:
		var hit = $StreamPlayer
		if not hit.playing:
			hit.play()


func _on_StreamPlayer_finished() -> void:
	if fuel <= 0:
		if groundLanding:
			Score.GameLose()
		elif padLanding:
			#close cal;
			pass
	if padLanding and firstTouch:
		Score.GameWin()

func _on_Ground_GroundHit(hit: bool):
	groundLanding = hit


func _on_Platform_PlatformHit(hit) -> void:
	padLanding = hit
