extends Node2D
class_name Cannon
@onready var markers:Node = $Markers
@onready var time_between_shots:Timer = $"Time Between shots"
@onready var reload_timer:Timer = $ReloadTimer
@export var cannon_resource:CannonResource
var _cached_markers:Array[Transform2D] = []
var can_shoot:bool=true
var is_reloading:bool=false
signal shoot()
func _ready():
	time_between_shots.wait_time=cannon_resource.time_between_shots
	reload_timer.wait_time = cannon_resource.reload_time
	for marker in markers.get_children():
		_cached_markers.append(marker)
func shot():
	shoot.emit()
	pass
