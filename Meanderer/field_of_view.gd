extends Node2D
class_name FieldOfView
var range: float = 1500
var angle_degrees: float = 60
var num_rays: int = 10  # количество лучей внутри конуса
@onready var player = get_tree().get_first_node_in_group("Player")
@export var exception:CollisionObject2D
# Эта функция создает RayCast2D для конуса обзора
func setup_cone_of_vision():
	var angle_radians = deg_to_rad(angle_degrees)
	var step = angle_radians / (num_rays - 1)
	
	for i in range(num_rays):
		var ray = RayCast2D.new()
		var theta = -angle_radians / 2 + step * i
		ray.target_position  = Vector2(cos(theta), sin(theta)) * range
		ray.enabled = true
		ray.add_exception(exception)  # Исключаем самого врага из проверки
		self.add_child(ray)

# Функция для обновления направления всех RayCast2D при вращении врага
func update_cone_direction():
	for ray in get_children():
		if ray is RayCast2D:
			ray.rotation = 0  # Мы всегда устанавливаем поворот лучей в 0, так как они уже повернуты корректно относительно врага

# Проверка наличия игрока в поле зрения врага
func is_player_in_cone_of_vision(player):
	for ray in get_children():
		if ray is RayCast2D and ray.is_colliding():
			var collider = ray.get_collider()
			if collider == player:
				return true
	return false

func _ready():
	setup_cone_of_vision()

func _physics_process(delta):
	update_cone_direction()  # Можно вызывать, если конус должен следить за вращением объекта
	
	# Предполагается, что player является существующей переменной или можно получить доступ к игроку другим способом
	if is_player_in_cone_of_vision(player):
		print("Player detected!")
