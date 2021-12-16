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
var direction = FACE_UP
var lastDirection = direction
var lastPos
var isDead = false
var IsDying = false
var health = 3

func _process(delta):
	# Return false to denote losing minigame
	if isDead:
		return false

	if direction != UNKNOWN:
		lastDirection = direction
	lastPos = global_position
	direction = UNKNOWN

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
				direction = FACE_UPLEFT
			elif xDir == FACE_RIGHT:
				direction = FACE_UPRIGHT
		elif yDir == FACE_DOWN:
			if xDir == FACE_LEFT:
				direction = FACE_DOWNLEFT
			elif xDir == FACE_RIGHT:
				direction = FACE_DOWNRIGHT
	else:
		if xDir != UNKNOWN:
			direction = xDir
		elif yDir != UNKNOWN:
			direction = yDir

	if IsDying:
		Die()
	# If the direction matches we are holding and so should start walking
	elif isAttacking:
		Attack(direction)
	elif direction == lastDirection:
		Walking(direction, delta)
	else:
		Standing(direction)

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

func Attack(direction):
	HideAllPoses()
	if direction == UNKNOWN && lastDirection != UNKNOWN:
		direction = lastDirection

	var player = get_node("AnimationPlayer")
	var currentAnim = player.get_current_animation()

	if direction == FACE_UP || direction == FACE_UPLEFT || direction == FACE_UPRIGHT:
		if !player.is_playing() && currentAnim == "SwordUp" || currentAnim != "SwordUp":
			player.play("SwordUp")
		get_node(ATTACKANIM + "SwordUp").show()
	elif direction == FACE_DOWN || direction == FACE_DOWNLEFT || direction== FACE_DOWNRIGHT:
		if !player.is_playing() && currentAnim == "SwordDown" || currentAnim != "SwordDown":
			player.play("SwordDown")
		get_node(ATTACKANIM + "SwordDown").show()
	elif direction == FACE_LEFT:
		if !player.is_playing() && currentAnim == "SwordLeft" || currentAnim != "SwordLeft":
			player.play("SwordLeft")
		get_node(ATTACKANIM + "SwordLeft").show()
	elif direction == FACE_RIGHT:
		if !player.is_playing() && currentAnim == "SwordRight" || currentAnim != "SwordRight":
			player.play("SwordRight")
		get_node(ATTACKANIM + "SwordRight").show()

func Walking(direction, dt):
	HideAllPoses()
	var delta = Vector2(0,0)

	var player = get_node("AnimationPlayer")
	var currentAnim = player.get_current_animation()

	if direction == FACE_UP:
		delta.y = -ACCELERATION
		if !player.is_playing() && currentAnim == "WalkUp" || currentAnim != "WalkUp":
			player.play("WalkUp")
		get_node(HEROANIM + "WalkingUp").show()
	elif direction == FACE_UPLEFT:
		delta.y = -ACCELERATION
		delta.x = -ACCELERATION
		if !player.is_playing() && currentAnim == "WalkUp" || currentAnim != "WalkUp":
			player.play("WalkUp")
		get_node(HEROANIM + "WalkingUp").show()
	elif direction == FACE_UPRIGHT:
		delta.y = -ACCELERATION
		delta.x = ACCELERATION
		if !player.is_playing() && currentAnim == "WalkUp" || currentAnim != "WalkUp":
			player.play("WalkUp")
		get_node(HEROANIM + "WalkingUp").show()
	elif direction == FACE_DOWN:
		delta.y = ACCELERATION
		if !player.is_playing() && currentAnim == "WalkDown" || currentAnim != "WalkDown":
			player.play("WalkDown")
		get_node(HEROANIM + "WalkingDown").show()
	elif direction == FACE_DOWNLEFT:
		delta.y = ACCELERATION
		delta.x = -ACCELERATION
		if !player.is_playing() && currentAnim == "WalkDown" || currentAnim != "WalkDown":
			player.play("WalkDown")
		get_node(HEROANIM + "WalkingDown").show()
	elif direction == FACE_DOWNRIGHT:
		delta.y = ACCELERATION
		delta.x = ACCELERATION
		if !player.is_playing() && currentAnim == "WalkDown" || currentAnim != "WalkDown":
			player.play("WalkDown")
		get_node(HEROANIM + "WalkingDown").show()
	elif direction == FACE_LEFT:
		delta.x = -ACCELERATION
		if !player.is_playing() && currentAnim == "WalkLeft" || currentAnim != "WalkLeft":
			player.play("WalkLeft")
		get_node(HEROANIM + "WalkingLeft").show()
	elif direction == FACE_RIGHT:
		delta.x = ACCELERATION
		if !player.is_playing() && currentAnim == "WalkRight" || currentAnim != "WalkRight":
			player.play("WalkRight")
		get_node(HEROANIM + "WalkingRight").show()

	var pos = position
	pos = pos + delta

	if pos == pos + delta:
		Standing(direction)

	var collision = move_and_collide(delta * dt * 10)
	if collision and collision.collider:
		HideAllPoses()
		get_node(HEROSTATIC + "Hit").show()
		health = health - 1
		if health < 0:
			IsDying = true
	else:
		get_node(HEROSTATIC + "Hit").hide()

func Standing(direction):
	HideAllPoses()

	if direction == UNKNOWN && lastDirection != UNKNOWN:
		direction = lastDirection

	if direction == FACE_UP || direction == FACE_UPLEFT || direction == FACE_UPRIGHT:
		get_node(HEROSTATIC + "StandingUp").show()
	elif direction == FACE_DOWN || direction == FACE_DOWNLEFT || direction == FACE_DOWNRIGHT:
		get_node(HEROSTATIC + "StandingDown").show()
	elif direction == FACE_LEFT:
		get_node(HEROSTATIC + "StandingLeft").show()
	elif direction == FACE_RIGHT:
		get_node(HEROSTATIC + "StandingRight").show()
