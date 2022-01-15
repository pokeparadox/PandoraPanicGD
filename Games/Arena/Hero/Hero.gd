extends KinematicBody2D
const ACCELERATION = 8
const UNKNOWN = -1
const FACE_UP = 0
const FACE_LEFT = 1
const FACE_RIGHT = 2
const FACE_DOWN = 3
const FACE_UPLEFT = 4
const FACE_UPRIGHT = 5
const FACE_DOWNLEFT = 6
const FACE_DOWNRIGHT = 7
const HEROSTATIC = "CollisionShape2D/Static/"
const HEROANIM = "CollisionShape2D/Animated/"
const ATTACKANIM = "CollisionShape2D/Attack/"
var isAttacking = false
var heading = FACE_UP
var lastHeading = heading
var lastPos
var isDead = false
var IsDying = false
var health = 3

func _process(delta):
	# Return false to denote losing minigame
	if isDead:
		return false

	if heading != UNKNOWN:
		lastHeading = heading
	lastPos = global_position
	heading = UNKNOWN

	var xDir = UNKNOWN
	var yDir = UNKNOWN
	if Input.is_action_pressed("ui_up"):
		yDir = FACE_UP
	elif Input.is_action_pressed("ui_down"):
		yDir = FACE_DOWN
	if Input.is_action_pressed("ui_left"):
		xDir = FACE_LEFT
	elif Input.is_action_pressed("ui_right"):
		xDir = FACE_RIGHT

	if Input.is_action_pressed("ui_accept"):
		isAttacking = true

	if xDir != UNKNOWN && yDir != UNKNOWN:
		if yDir == FACE_UP:
			if xDir == FACE_LEFT:
				heading = FACE_UPLEFT
			elif xDir == FACE_RIGHT:
				heading = FACE_UPRIGHT
		elif yDir == FACE_DOWN:
			if xDir == FACE_LEFT:
				heading = FACE_DOWNLEFT
			elif xDir == FACE_RIGHT:
				heading = FACE_DOWNRIGHT
	else:
		if xDir != UNKNOWN:
			heading = xDir
		elif yDir != UNKNOWN:
			heading = yDir

	if IsDying:
		Die()
	# If the direction matches we are holding and so should start walking
	elif isAttacking:
		Attack(heading)
	elif heading == lastHeading:
		Walking(heading, delta)
	else:
		Standing(heading)

func Die():
	HideAllPoses()
	var deathAnim = get_node("CollisionShape2D/Death/DeathAnim")
	get_node("CollisionShape2D/Static").hide()
	deathAnim.show()
	deathAnim.play()
	Score.GameLose()

func HideAllPoses():
	get_node(HEROSTATIC + "StandingUp").hide()
	get_node(HEROSTATIC + "StandingDown").hide()
	get_node(HEROSTATIC + "StandingLeft").hide()
	get_node(HEROSTATIC + "StandingRight").hide()
	get_node(HEROANIM + "WalkingUp").hide()
	get_node(HEROANIM + "WalkingDown").hide()
	get_node(HEROANIM + "WalkingLeft").hide()
	get_node(HEROANIM + "WalkingRight").hide()
	get_node(ATTACKANIM + "SwordUp").hide()
	get_node(ATTACKANIM + "SwordDown").hide()
	get_node(ATTACKANIM + "SwordLeft").hide()
	get_node(ATTACKANIM + "SwordRight").hide()

func EndAttack():
	isAttacking = false

func Attack(heading):
	HideAllPoses()
	if heading == UNKNOWN && lastHeading != UNKNOWN:
		heading = lastHeading

	var player = get_node("AnimationPlayer")
	var currentAnim = player.get_current_animation()

	if heading == FACE_UP || heading == FACE_UPLEFT || heading == FACE_UPRIGHT:
		if !player.is_playing() && currentAnim == "SwordUp" || currentAnim != "SwordUp":
			player.play("SwordUp")
		get_node(ATTACKANIM + "SwordUp").show()
	elif heading == FACE_DOWN || heading == FACE_DOWNLEFT || heading== FACE_DOWNRIGHT:
		if !player.is_playing() && currentAnim == "SwordDown" || currentAnim != "SwordDown":
			player.play("SwordDown")
		get_node(ATTACKANIM + "SwordDown").show()
	elif heading == FACE_LEFT:
		if !player.is_playing() && currentAnim == "SwordLeft" || currentAnim != "SwordLeft":
			player.play("SwordLeft")
		get_node(ATTACKANIM + "SwordLeft").show()
	elif heading == FACE_RIGHT:
		if !player.is_playing() && currentAnim == "SwordRight" || currentAnim != "SwordRight":
			player.play("SwordRight")
		get_node(ATTACKANIM + "SwordRight").show()

func Walking(heading, dt):
	HideAllPoses()
	var delta = Vector2(0,0)

	var player = get_node("AnimationPlayer")
	var currentAnim = player.get_current_animation()

	if heading == FACE_UP:
		delta.y = -ACCELERATION
		if !player.is_playing() && currentAnim == "WalkUp" || currentAnim != "WalkUp":
			player.play("WalkUp")
		get_node(HEROANIM + "WalkingUp").show()
	elif heading == FACE_UPLEFT:
		delta.y = -ACCELERATION
		delta.x = -ACCELERATION
		if !player.is_playing() && currentAnim == "WalkUp" || currentAnim != "WalkUp":
			player.play("WalkUp")
		get_node(HEROANIM + "WalkingUp").show()
	elif heading == FACE_UPRIGHT:
		delta.y = -ACCELERATION
		delta.x = ACCELERATION
		if !player.is_playing() && currentAnim == "WalkUp" || currentAnim != "WalkUp":
			player.play("WalkUp")
		get_node(HEROANIM + "WalkingUp").show()
	elif heading == FACE_DOWN:
		delta.y = ACCELERATION
		if !player.is_playing() && currentAnim == "WalkDown" || currentAnim != "WalkDown":
			player.play("WalkDown")
		get_node(HEROANIM + "WalkingDown").show()
	elif heading == FACE_DOWNLEFT:
		delta.y = ACCELERATION
		delta.x = -ACCELERATION
		if !player.is_playing() && currentAnim == "WalkDown" || currentAnim != "WalkDown":
			player.play("WalkDown")
		get_node(HEROANIM + "WalkingDown").show()
	elif heading == FACE_DOWNRIGHT:
		delta.y = ACCELERATION
		delta.x = ACCELERATION
		if !player.is_playing() && currentAnim == "WalkDown" || currentAnim != "WalkDown":
			player.play("WalkDown")
		get_node(HEROANIM + "WalkingDown").show()
	elif heading == FACE_LEFT:
		delta.x = -ACCELERATION
		if !player.is_playing() && currentAnim == "WalkLeft" || currentAnim != "WalkLeft":
			player.play("WalkLeft")
		get_node(HEROANIM + "WalkingLeft").show()
	elif heading == FACE_RIGHT:
		delta.x = ACCELERATION
		if !player.is_playing() && currentAnim == "WalkRight" || currentAnim != "WalkRight":
			player.play("WalkRight")
		get_node(HEROANIM + "WalkingRight").show()

	var pos = position
	pos = pos + delta

	if pos == pos + delta:
		Standing(heading)

	var collision = move_and_collide(delta * dt * 10)
	if collision and collision.collider:
		HideAllPoses()
		get_node(HEROSTATIC + "Hit").show()
		health = health - 1
		if health < 0:
			IsDying = true
	else:
		get_node(HEROSTATIC + "Hit").hide()

func Standing(heading):
	HideAllPoses()

	if heading == UNKNOWN && lastHeading != UNKNOWN:
		heading = lastHeading

	if heading == FACE_UP || heading == FACE_UPLEFT || heading == FACE_UPRIGHT:
		get_node(HEROSTATIC + "StandingUp").show()
	elif heading == FACE_DOWN || heading == FACE_DOWNLEFT || heading == FACE_DOWNRIGHT:
		get_node(HEROSTATIC + "StandingDown").show()
	elif heading == FACE_LEFT:
		get_node(HEROSTATIC + "StandingLeft").show()
	elif heading == FACE_RIGHT:
		get_node(HEROSTATIC + "StandingRight").show()
