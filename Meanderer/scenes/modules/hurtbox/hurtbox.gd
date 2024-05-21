extends Area2D
class_name Hurtbox
@onready var parent=get_parent()
func _ready():
	Bulletfactory.connect("area_entered",_on_area_entered)
func _on_area_entered(enemy_area: Object, bullets_custom_data: Resource, bullet_global_position: Vector2):
	if(bullets_custom_data is DamageResource and enemy_area is Hurtbox):
		enemy_area.do_damage(bullets_custom_data.damage)
func do_damage(damage:float):
	if("get_damage" in parent):
		parent.get_damage(damage)
