extends Node2D
class_name Chunk
var width:int
var height:int
var tile_size:int=16
@export var chunk_size: float = 41
var noise: FastNoiseLite = null
@onready var visible_on_screen_enabler_2d = $VisibleOnScreenEnabler2D

@onready var visible_objects = $visible

var chunk_x: int 
var chunk_y: int 

var should_remove := false
@export var water_scene:PackedScene
var water:TileMap

func _ready():
	var size:float = chunk_size*tile_size
	visible_on_screen_enabler_2d.rect= Rect2(0.0,0.0,size,size)
	water = water_scene.instantiate()
	visible_objects.visible=false
	visible_objects.add_child(water)
	global_position.x = chunk_x
	global_position.y = chunk_y




func _on_visible_on_screen_enabler_2d_screen_entered():
	visible_objects.visible=true # Replace with function body.


func _on_visible_on_screen_enabler_2d_screen_exited():
	visible_objects.visible=false # Replace with function body.
