
extends KinematicBody2D

# Constants
const UNKNOWN = -1
const FACE_UP = 0
const FACE_LEFT = 1
const FACE_RIGHT = 2
const FACE_DOWN = 3

const SPEED = 4

const STANDING = "Standing/"
const WALKING = "Walking/"

# member variables:
var isDead = false
var lastPos
var direction = FACE_DOWN
var lastDirection = direction

var isWalking = false
var randCheckCount = randi() % 32 + 1

var collision

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	if(direction != UNKNOWN):
		lastDirection = direction
	lastPos = position
	Think()

	if(isWalking):
		Walking(direction,delta)
	else:
		Standing(direction)

func HideAllPoses():
	get_node(STANDING + "Up").hide()
	get_node(STANDING + "Down").hide()
	get_node(STANDING + "Left").hide()
	get_node(STANDING + "Right").hide()
	get_node(WALKING + "Up").hide()
	get_node(WALKING + "Down").hide()
	get_node(WALKING + "Left").hide()
	get_node(WALKING + "Right").hide()

func Walking(direction,delta):
	HideAllPoses()
	var player = get_node("AnimationPlayer")
	var currentAnim = player.get_current_animation()
	var walkVec = Vector2(0,0)
	if(direction == FACE_UP):
		get_node(WALKING + "Up").show()
		if((!player.is_playing() && currentAnim == "WalkUp") || currentAnim != "WalkUp"):
			player.play("WalkUp")
		walkVec.y = -SPEED
	elif(direction == FACE_LEFT):
		get_node(WALKING + "Left").show()
		if((!player.is_playing() && currentAnim == "WalkLeft") || currentAnim != "WalkLeft"):
			player.play("WalkLeft")
		walkVec.x = -SPEED
	elif(direction == FACE_RIGHT):
		get_node(WALKING + "Right").show()
		if((!player.is_playing() && currentAnim == "WalkRight") || currentAnim != "WalkRight"):
			player.play("WalkRight")
		walkVec.x = SPEED
	elif(direction == FACE_DOWN):
		get_node(WALKING + "Down").show()
		if((!player.is_playing() && currentAnim == "WalkDown") || currentAnim != "WalkDown"):
			player.play("WalkDown")
		walkVec.y = SPEED

	lastPos = position
	collision = move_and_collide(walkVec * delta * 10)

func Standing(direction):
	HideAllPoses()
	if(direction == FACE_UP):
		get_node(STANDING + "Up").show()
	elif(direction == FACE_LEFT):
		get_node(STANDING + "Left").show()
	elif(direction == FACE_RIGHT):
		get_node(STANDING + "Right").show()
	elif(direction == FACE_DOWN):
		get_node(STANDING + "Down").show()

func GetRandomDirection():
	var dir =  randi() % 4
	while (IsOppositeDirection(dir,direction)):
		dir =  randi() % 4
	return dir

func GetOppositeDirection(dir):
	if(dir == FACE_DOWN):
		return FACE_UP
	elif(dir == FACE_UP):
		return FACE_DOWN
	elif(dir == FACE_LEFT):
		return FACE_RIGHT
	elif(dir == FACE_RIGHT):
		return FACE_LEFT

func IsOppositeDirection(dir, oldDir):
	return (dir == GetOppositeDirection(oldDir))

func Think():
	if(!isDead):
		if(!get_node("AnimationPlayer").is_playing()):
			if(randCheckCount == 0):
				direction =  GetRandomDirection()
				var oldWalking = isWalking
				var isStanding = randi() % 3 + 1
				if(isStanding == 1 && oldWalking == true):
					direction = lastDirection
					isWalking = false
				else:
					isWalking = true
				randCheckCount = randCheckCount + 1
			elif (randCheckCount >= 64):
				randCheckCount = 0
			else:
				randCheckCount = randCheckCount + 1

	if(collision):
		direction = GetOppositeDirection(direction)


