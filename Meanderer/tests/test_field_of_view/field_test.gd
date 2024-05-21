extends Node2D
@onready var field_of_view = $FieldOfView


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#field_of_view.rotation_degrees+=delta*80
	pass


func _on_field_of_view_target_detected():
	print("target found") # Replace with function body.


func _on_field_of_view_target_lost():
	print("target lost")
