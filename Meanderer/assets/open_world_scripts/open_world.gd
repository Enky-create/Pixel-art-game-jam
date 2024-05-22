extends Node2D

const CHUNK_SIZE = Vector2(256, 256)
const LOAD_RADIUS = 3  # радиус в чанках, в котором чанки будут загружаться

@export var chunk_data: ChunkData
var loaded_chunks: Dictionary = {}

func _process(delta):
	var player_pos = get_node("PathToYourPlayerNode").global_position
	var current_chunk = Vector2(
		int(player_pos.x / CHUNK_SIZE.x),
		int(player_pos.y / CHUNK_SIZE.y)
	)

	for x in range(current_chunk.x - LOAD_RADIUS, current_chunk.x + LOAD_RADIUS + 1):
		for y in range(current_chunk.y - LOAD_RADIUS, current_chunk.y + LOAD_RADIUS + 1):
			var chunk_pos = Vector2(x, y)
			if not loaded_chunks.has(chunk_pos):
				load_chunk(chunk_pos)

	for chunk_pos in loaded_chunks.keys():
		if chunk_pos.distance_to(current_chunk) > LOAD_RADIUS:
			unload_chunk(chunk_pos)

func load_chunk(chunk_pos: Vector2):
	var chunk_scene = chunk_data.get_chunk(chunk_pos.x, chunk_pos.y)
	if chunk_scene:
		var chunk = chunk_scene.instantiate() as Chunk
		chunk.position = chunk_pos * CHUNK_SIZE
		add_child(chunk)
		loaded_chunks[chunk_pos] = chunk

func unload_chunk(chunk_pos: Vector2):
	if loaded_chunks.has(chunk_pos):
		var chunk = loaded_chunks[chunk_pos]
		chunk.queue_free()
		loaded_chunks.erase(chunk_pos)
