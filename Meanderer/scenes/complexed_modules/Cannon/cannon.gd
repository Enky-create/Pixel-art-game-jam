extends Node2D
class_name Cannon
@onready var markers:Node = $Markers
@onready var time_between_shots:Timer = $"Time Between shots"
@onready var reload_timer:Timer = $ReloadTimer
@export var cannon_resource:CannonResource
var _cached_markers:Array[Transform2D] = []
var can_shoot:bool=true
var is_reloading:bool=false
var current_ammo:int
@onready var max_ammo:int = cannon_resource.ammo_capacity

signal shoot()

func _ready():
	if markers.get_children().size()!=0:
		_get_all_transforms()
func shot():
	pass
func _get_all_transforms():
	_cached_markers.clear()
	for marker:Marker2D in markers.get_children():
		_cached_markers.push_back(marker.get_global_transform())
	return _cached_markers
