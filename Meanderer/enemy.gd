extends Entity
class_name SimpleMob
var is_target_seen:bool=false
@export var speed:float=600
@export var acceleration = 2
var target:Entity=null
func move(_direction:Vector2,_delta):
	velocity=speed * _delta * _direction
	move_and_slide()

func accelerate():
	pass
func action():
	pass
func interact():
	pass
func get_damage(damage:float):
	health-=damage


func _on_field_of_view_target_detected(target):
	if target != null and target is Entity:
		pass
