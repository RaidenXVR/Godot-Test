extends Camera2D

@export var tilemap: TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var mapInPixel = mapRect.size * tileSize
	limit_right = mapInPixel.x
	limit_bottom = mapInPixel.y
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
