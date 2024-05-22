class_name SavedGame
extends Resource

## Path to the level that was loaded when the game was saved
@export var level_path:String
## Position of the player
@export var ship_position:Vector2
## Health of the player
@export var ship_health:float
@export var ship_scene_path:String

## Saved data for all dynamic parts of the level
@export var saved_data:Array[SavedData] = []
