# PandoraPanicGD
PandoraPanic! Recreated and improved upon using Godot. PandoraPanic! was created originally for the OpenPandora handheld by members of the OpenPandora community.
This is the same game ported to Godot.

## Building
- Download the latest version of Godot from [here](https://godotengine.org/downloads/).
- Download the latest code or clone the repository from here.
- Import the project into Godot.
- Build the project.

## Contributing a mini-game
- By using the principle of each mini game being self contained as a scene, it is possible to create a mini game that can be used in the game.
- Mini games are stored in the **res://Games/** folder.
- Each mini game will have it's scene file "MyGame.tscn" and a subfolder with the same name, containing all of the mini games scripts, scenes, images and sounds, etc.
- Each mini game should have a win case and a lose case and call the correct API call as needed.
- Scoring and next mini game selection is handled by the framework.
- Ensure that your mini game has a comment with it's name and description and a comment for who the author is to be correctly credited. (I want to formalise this in the code but for now, this is enough.)
- Push your changes onto the repo or send me a zip of your mini game.

## Available API Calls
- **Score.GameWin()** - Called when the player wins the minigame.
- **Score.GameLose()** - Called when the player loses the minigame.
- Cheevos   ...    - TBD


