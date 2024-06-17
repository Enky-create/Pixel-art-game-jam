extends Entity
class_name Slime
var is_target_seen:bool=false
@onready var hitbox_spawn = $Marker2D
@export var speed:float=600
@export var acceleration = 2
@export var hitbox:PackedScene
var target:Entity=null
func move(_direction:Vector2,_delta):
	velocity=speed * _delta * _direction
	move_and_slide()
func _process(delta):
	if(health<0):
		queue_free()

func accelerate():
	pass
func action():
	var hitbox:Hitbox = Hitbox.new()
	pass
func interact():
	pass
func get_damage(damage:float):
	health-=damage


func _on_field_of_view_target_detected(target):
	if target != null and target is Entity:
		self.target = target
