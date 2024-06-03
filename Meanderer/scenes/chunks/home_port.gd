extends Node2D

@onready var water = $Water
var player = null
var last_position = Vector2.ZERO
var last_time = 0.0

func _ready():
	# Попробуем найти игрока в группе "Player"
	player = get_tree().get_first_node_in_group("Player")
	if player == null:
		print("Player not found. Waiting for player to be added to the scene.")
		# Подписываемся на сигнал, чтобы узнать, когда игрок будет добавлен в сцену
		get_tree().connect("node_added", _on_node_added)
	else:
		# Инициализация времени, если игрок уже найден
		last_time = Time.get_ticks_msec() / 1000.0

func _process(delta):
	if player != null:
		var current_position = player.position
		var current_time = Time.get_ticks_msec() / 1000.0
		
		# Вычисляем скорость игрока
		var distance = current_position.distance_to(last_position)
		var time_diff = current_time - last_time
		var speed = distance / max(time_diff, 0.001) # чтобы избежать деления на ноль

		var shader_material = water.material
		shader_material.set("player_position", current_position)
		shader_material.set("player_speed", speed)

		last_position = current_position
		last_time = current_time
	else:
		print("Player is still null in _process")

func _on_node_added(node):
	if node.is_in_group("Player"):
		player = node
		get_tree().disconnect("node_added", _on_node_added)
		print("Player found and assigned in _on_node_added")
		# Инициализация времени, когда игрок добавлен
		last_time = Time.get_ticks_msec() / 1000.0
