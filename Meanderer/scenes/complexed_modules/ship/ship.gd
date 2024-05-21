extends Entity
class_name Ship
@export var move_resource:ShipMoveResource
@onready var current_speed:float = move_resource.min_speed
@onready var current_rotation_speed:float =move_resource.min_rotation_speed
var direction_move=Vector2.ZERO
func move(direction:Vector2,delta):
	if(direction != Vector2.ZERO):
		if(direction.y!=0):
			current_speed=move_toward(current_speed, move_resource.max_speed,move_resource.acceleration)
			direction_move=Vector2(0,direction.y)
		print("current speed is "+str(current_speed))
		var rotation_direction=0
		if(direction.x>0):
			rotation_direction=1
			current_rotation_speed=lerp(current_rotation_speed,move_resource.max_rotation_speed,move_resource.rotation_acceleration)
		if(direction.x<0):
			rotation_direction=-1
			current_rotation_speed=lerp(current_rotation_speed,move_resource.max_rotation_speed,move_resource.rotation_acceleration)
		rotation_degrees+=rotation_direction* current_rotation_speed *delta
		print(direction)
		
	else:
		#velocity=velocity.move_toward(Vector2.ZERO, move_resource.fritction)
		print("direction: " +str(direction_move))
		current_speed=lerp(current_speed, 0.0,move_resource.fritction)
		#current_speed=move_toward(current_speed, 0,move_resource.fritction)
		print("current speed is "+str(current_speed))
	velocity=direction_move.rotated(deg_to_rad(rotation_degrees))*current_speed*delta
	print(velocity)
	call_deferred("move_and_slide")
