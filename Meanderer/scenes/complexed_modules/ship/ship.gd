extends Entity
class_name Ship
@export var move_resource:ShipMoveResource
@onready var current_speed:float = move_resource.min_speed
func move(direction:Vector2,delta):
	if(direction != Vector2.ZERO):
		current_speed=move_toward(current_speed, move_resource.max_speed,move_resource.acceleration)
		print("current speed is "+str(current_speed))
		if(direction.x>0):
			rotation_degrees+=move_resource.rotation_speed*delta
		if(direction.x<0):
			rotation_degrees-=move_resource.rotation_speed*delta
		
		print(direction)
		velocity=Vector2(0,direction.y).rotated(deg_to_rad(rotation_degrees))*current_speed*delta
	else:
		velocity=velocity.move_toward(Vector2.ZERO, move_resource.fritction)
		print("velocity: " +str(velocity))
		current_speed=move_resource.min_speed
		#current_speed=move_toward(current_speed, 0,move_resource.fritction)
		print("current speed is "+str(current_speed))
	#velocity=Vector2(0,direction.y).rotated(deg_to_rad(rotation_degrees))*current_speed*delta 
	call_deferred("move_and_slide")
