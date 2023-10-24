extends Camera2D

@export var tilemap: TileMap
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var mapInPixel = mapRect.size * tileSize
	limit_right = mapInPixel.x
	limit_bottom = mapInPixel.y
	
#	player = self.get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#		# Check if the player reference is valid.
#	if player:
#		# Update the camera's position to follow the player.
#		offset = get_viewport_rect().size / 2
#		set_offset(player.global_position - offset)
	pass
