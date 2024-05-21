extends Node2D
class_name FieldOfView

signal target_detected(target)
signal target_lost(target)

@export var distance: float = 1500
@export var angle_degrees: float = 60
@export var num_rays: int = 2 
@export var exception:CollisionObject2D
@export var frequency_time:float=0.2
@export var group:String
@onready var target = get_tree().get_first_node_in_group(group)
@onready var frequency_timer:Timer = Timer.new()

var is_target_detected:bool=false
var rays:Array[RayCast2D]=[]
# Эта функция создает RayCast2D для конуса обзора
func setup_cone_of_vision():
	var angle_radians = deg_to_rad(angle_degrees)
	var step = angle_radians / (num_rays - 1)
	
	for i in range(num_rays):
		var ray = RayCast2D.new()
		var theta = -angle_radians / 2 + step * i
		ray.target_position  = Vector2(cos(theta), sin(theta)) * distance
		ray.enabled = true
		ray.add_exception(exception)  # Исключаем самого врага из проверки
		self.add_child(ray)
		rays.append(ray)

# Функция для обновления направления всех RayCast2D при вращении врага
func update_cone_direction():
	for ray in rays:
		ray.rotation = 0  # Мы всегда устанавливаем поворот лучей в 0, так как они уже повернуты корректно относительно врага

# Проверка наличия игрока в поле зрения врага
func is_target_in_cone_of_vision():
	for ray in rays:
		if ray.is_colliding():
			var collider = ray.get_collider()
			if ( target!=null and collider == target):
				return true
	return false

func _ready():
	frequency_timer.wait_time=frequency_time
	frequency_timer.autostart=true
	add_child(frequency_timer)
	frequency_timer.connect("timeout",_on_frequency_timer_timeout)
	setup_cone_of_vision()

func check_for_target():
	var target_in_vision_now = is_target_in_cone_of_vision()
	
	if target_in_vision_now and not is_target_detected:
		is_target_detected = true
		print(is_target_detected)
		target_detected.emit(target)
	elif not target_in_vision_now and is_target_detected:
		is_target_detected = false
		target_lost.emit(target)

func _on_frequency_timer_timeout():
	check_for_target()
