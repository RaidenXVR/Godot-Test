extends Node2D

# Load the JSON file into a Dictionary
var json_map = load("res://map/market.json")

func _ready():
	if json_map:
		parse_map(json_map)

func parse_map(data):
	# Extract data from the JSON, create tiles, and add them to the TileMap
	var tilemap = TileMap.new()
	# Configure tilemap properties here (cell size, tileset, etc.)
	# e.g., tilemap.tile_set = preload("res://path/to/your/tileset.tres")

	# Loop through the JSON data to add tiles
	for y in range(data.map_size.y):
		for x in range(data.map_size.x):
			var tile_id = data.tiles[y][x] # Adjust this line to extract the tile data from your JSON

			if tile_id >= 0: # Check if tile_id is validW
				tilemap.set_cell( tile_id, Vector2(x,y))

	# Add the tilemap to the scene
	add_child(tilemap)
