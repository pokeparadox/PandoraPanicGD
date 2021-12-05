extends RigidBody2D
signal FuelLevelChanged

const MaxThrust = 10.0
const Acceleration = 0.05
const Rotation = 0.01
const MaxRotation = 45
const fuelUsageRate = 0.1

var lastAngle = 0
var currentThrust = 1
var firstTouch = false
var fuel = 100

# Physics Updates
func _physics_process(delta):
	if Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_accept"):
		ActivateThrusters()
	else:
		DisableThrusters()

	var angle = abs(rotation_degrees)

	if angle < MaxRotation:
		lastAngle = rotation_degrees
		if Input.is_action_pressed("ui_left"):
			rotate(-Rotation)
		elif Input.is_action_pressed("ui_right"):
			rotate(Rotation)
	else:
		rotation_degrees = lastAngle

# Visual Updates
func _process(delta):
	var hit = get_node("StreamPlayer")
	var colliding = !get_colliding_bodies().empty()
	if firstTouch && colliding && !hit.is_playing():
		hit.play()
		firstTouch = false
	elif !colliding:
		firstTouch= true

func ActivateThrusters():
	if fuel > 0:
		fuel = fuel - fuelUsageRate
	else:
		DisableThrusters()
		return

	SetThrusters(true)
	emit_signal("FuelLevelChanged", fuel)
	if currentThrust < MaxThrust:
		currentThrust = currentThrust+Acceleration
	var rot = rotation_degrees
	var vel = Vector2(-currentThrust * sin(rot), -currentThrust * cos(rot))
	var prevVel = self.get_linear_velocity()
	self.set_linear_velocity(vel + prevVel)

func DisableThrusters():
	SetThrusters(false)
	currentThrust = 1

func SetThrusters(val):
	for i in get_tree().get_nodes_in_group("Thrusters"):
		i.set_emitting(val)
