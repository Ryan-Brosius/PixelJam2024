extends TileMap

const TILE_SIZE = 16
const CHUNK_SIZE = 64
const CHUNKS_AROUND = [Vector2(0,0),  Vector2(1,0),  Vector2(0,1),
					   Vector2(-1,0), Vector2(0,-1), Vector2(-1,-1),
					   Vector2(1,-1), Vector2(-1,1), Vector2(1,1)]

@onready var player = $"../Player"
var player_pos = Vector2.ZERO

func _process(delta):
	player_pos = player.position
	
	load_chunk()
	
#loads the chunk
#Should change a few things later, but good for now(?)
func load_chunk():
	var tc = local_to_map(player_pos)
	var chunk_pos = Vector2(floor(tc.x / CHUNK_SIZE) * CHUNK_SIZE - CHUNK_SIZE/2, floor(tc.y / CHUNK_SIZE) * CHUNK_SIZE - CHUNK_SIZE/2)
	for chunk in CHUNKS_AROUND:
		var tile = chunk_pos + chunk * CHUNK_SIZE
		if get_cell_alternative_tile(0, tile) == -1:
			
			for x in range(CHUNK_SIZE):
				for y in range(CHUNK_SIZE):
					var set_tile = tile + Vector2(x, y)
					set_cell(0, set_tile, 0, Vector2(0,0))
