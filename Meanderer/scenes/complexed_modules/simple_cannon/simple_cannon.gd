extends Cannon
class_name SimpleCannon
@export var bullet_blast_resource:BulletBlastResource
func _ready():
	super._ready()
	time_between_shots.wait_time=cannon_resource.time_between_shots
	reload_timer.wait_time = cannon_resource.reload_time
func shot():
	super.shot()
	if(can_shoot and !is_reloading):
		shoot.emit()
		var data:BlockBulletsData2D = bullet_blast_resource.create_block_bullet_data()
		data.transforms=_get_all_transforms()
		data.block_rotation_radians=rotation
		data.all_bullet_speed_data = BulletSpeedData.generate_random_data(bullet_blast_resource.amount_to_generate,bullet_blast_resource.speed_min,bullet_blast_resource.speed_max,bullet_blast_resource.max_speed_min,bullet_blast_resource.max_speed_max,bullet_blast_resource.acceleration_min,bullet_blast_resource.acceleration_max)
		Bulletfactory.spawnBlockBullets2D(data)
		can_shoot=false
		time_between_shots.start()
		current_ammo-=1
		if(current_ammo<=0):
			is_reloading=true
			reload_timer.start()
	pass


func _on_time_between_shots_timeout():
	can_shoot=true # Replace with function body.


func _on_reload_timer_timeout():
	is_reloading=false 
	current_ammo=max_ammo# Replace with function body.
