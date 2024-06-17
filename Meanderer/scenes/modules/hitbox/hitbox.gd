extends Area2D
class_name Hitbox
@export var damage:float
var is_enable:bool=false

func _on_body_entered(body):
	if(is_enable and body is Entity):
		body.get_damage(damage)
		queue_free()
