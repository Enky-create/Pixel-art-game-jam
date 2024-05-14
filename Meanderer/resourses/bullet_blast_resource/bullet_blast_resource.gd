extends Resource
class_name BulletBlastResource
@export_group("Texture Settings")
@export var textures:Array[Texture2D]
@export var texture_size:Vector2 = Vector2(32,32)
@export var texture_rotation_radians:float=0.0
@export var current_texture_index:int=0
@export var max_change_texture_time:float=0.3
@export var is_texture_rotation_permanent:bool=false
@export_group("Bullet Movement")
#@export var transforms:Array[Transform2D]
@export var block_rotation_radians:float = 0.0
@export var use_block_rotation_radians:bool=false
@export_group("Speed of each bullet")
@export var amount_to_generate:int
@export var speed_min: float 
@export var speed_max: float
@export var max_speed_min: float
@export var max_speed_max: float
@export var acceleration_min: float
@export var acceleration_max: float
@export_group("Rotation of each bullet")
@export var all_bullet_rotation_data: Array[BulletRotationData]
@export var rotate_only_textures:bool = false
@export_group("Collision")
@export var collision_layer:Array[int]
@export var collision_mask:Array[int]
@export var collision_shape_size:Vector2 = Vector2(5,5)
@export var collision_shape_offset:Vector2
@export var monitorable:bool=false
@export var bullets_custom_data:DamageResource
@export var max_life_time:float = 2.0
func create_block_bullet_data()->BlockBulletsData2D:
	var data = BlockBulletsData2D.new()
	data.textures = textures
	data.texture_size = texture_size
	data.texture_rotation_radians=texture_rotation_radians
	data.current_texture_index=current_texture_index
	data.max_change_texture_time=max_change_texture_time
	data.is_texture_rotation_permanent = is_texture_rotation_permanent
	data.block_rotation_radians= block_rotation_radians
	data.use_block_rotation_radians=use_block_rotation_radians
	data.all_bullet_speed_data = BulletSpeedData.generate_random_data(amount_to_generate,speed_min,speed_max, max_speed_min,max_speed_max,acceleration_min,acceleration_max)
	data.all_bullet_rotation_data = all_bullet_rotation_data
	data.rotate_only_textures=rotate_only_textures
	data.collision_layer=BlockBulletsData2D.calculate_bitmask(collision_layer)
	data.collision_mask=BlockBulletsData2D.calculate_bitmask(collision_mask)
	data.collision_shape_size=collision_shape_size
	data.collision_shape_offset=collision_shape_offset
	data.monitorable=monitorable
	data.bullets_custom_data = bullets_custom_data
	data.max_life_time=max_life_time
	return data
