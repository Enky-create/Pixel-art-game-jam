extends CharacterBody2D
class_name Entity
signal health_changed(value:float)
@export var health:float= 1000:
	set(value):
		if(value<0):
			health=0
		health=value
		print(health)
		health_changed.emit(value)
func move(_direction:Vector2,_delta):
	pass
func accelerate():
	pass
func action():
	pass
func interact():
	pass
func get_damage(damage:float):
	health-=damage
