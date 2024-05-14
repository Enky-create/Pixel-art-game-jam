extends Resource
class_name DamageResource
enum DamageType{
	Fire,
	Cutting,
	Poison,
	Magic
}
@export var damage:float
@export var type:DamageType
