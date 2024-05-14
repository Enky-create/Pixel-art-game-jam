extends Node2D

@onready var simple_cannon = $SimpleCannon

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		print("interact")
		simple_cannon.shot()
