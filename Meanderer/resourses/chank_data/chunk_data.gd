extends Resource
class_name ChunkData

@export var chunk_map: Dictionary = {}

func get_chunk(x: int, y: int) -> PackedScene:
	var key = Vector2(x, y)
	if chunk_map.has(key):
		return chunk_map[key]
	return null
