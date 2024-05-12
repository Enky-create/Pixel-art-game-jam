extends Node2D
class_name EntityController
@export var entity_scene:PackedScene
var entity:
	get:
		return entity
	set(value):
		entity = value
var entity_is_in_scene:bool=false
func _ready():
	entity=entity_scene.instantiate() as Entity
	entity.position+=Vector2(150,100)
	get_parent().add_child.call_deferred(entity)
	entity_is_in_scene=true

func _physics_process(delta):
	if(entity_is_in_scene):
		var input = Input.get_vector("move_left","move_right","move_up","move_down")
		print("input is "+str(input))
		entity.move(input,delta)
	
