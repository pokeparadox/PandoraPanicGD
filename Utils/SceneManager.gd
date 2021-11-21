extends Node

#The currently active scene
var currentScene = null
var currentScenePath = ""

# Dictionary of available scenes
var scenes = {}

func _ready():
	#On load set the current scene to the last scene available
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)

	# Load scenes from Games folder into the scene dictionary
	var gamesDir = Directory.new()
	gamesDir.open("res://Games/")
	gamesDir.list_dir_begin()
	var currPath : String = gamesDir.get_next()
	var i : int = 0
	while currPath != "":
		if not gamesDir.current_is_dir() and currPath.ends_with("tscn"):
			scenes[i] = currPath
			i += 1
		currPath = gamesDir.get_next()

func BuildScenePath(sceneName : String) -> String:
	return "res://Games/" + sceneName

func GetCurrentSceneId() -> int:
	for i in range(0, len(scenes)):
		if BuildScenePath(scenes[i]) == currentScenePath:
			return i
	return 0

func LoadRandomGameScene():
	# TODO avoid loading current scene.
	var maxScenes = len(scenes) - 1
	var randomScene : String = scenes[Random.NextIntRange(0, maxScenes)]
	LoadGameScene(randomScene)

func LoadGameScene(sceneName):
	SetScene(BuildScenePath(sceneName))

func LoadNextGameScene():
	var currentSceneId : int = GetCurrentSceneId()
	# Get next scene id and wrap around if needed
	var nextSceneId = currentSceneId + 1
	if nextSceneId >= len(scenes):
		nextSceneId = 0
	LoadGameScene(scenes[nextSceneId])

func SetScene(scenePath : String):
	currentScene.queue_free()
	var s = ResourceLoader.load(scenePath)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)
	currentScenePath = scenePath
