extends CanvasLayer

@onready var inventory_grid:InventoryGrid = $InventoryGrid

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory_grid.create_and_add_item("gasoline")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
