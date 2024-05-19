extends TileMap

const TILE_SIZE = 16
const CHUNK_SIZE = 32
const CHUNKS_AROUND = [Vector2(0,0),  Vector2(1,0),  Vector2(0,1),
					   Vector2(-1,0), Vector2(0,-1), Vector2(-1,-1),
					   Vector2(1,-1), Vector2(-1,1), Vector2(1,1)]
var rng = RandomNumberGenerator.new()
var rendered_chunks = {}
@onready var player = $"../Player"
var player_pos = Vector2.ZERO

func _process(delta):
	player_pos = player.position
	
	if local_to_map(player_pos).x % CHUNK_SIZE == 0 or local_to_map(player_pos).y % CHUNK_SIZE == 0:
		load_chunk()
	
#loads the chunk
#Should change a few things later, but good for now(?)
func load_chunk():
	var tc = local_to_map(player_pos)
	var chunk_pos = Vector2(floor(tc.x / CHUNK_SIZE) * CHUNK_SIZE - CHUNK_SIZE/2, floor(tc.y / CHUNK_SIZE) * CHUNK_SIZE - CHUNK_SIZE/2)
	for chunk in CHUNKS_AROUND:
		var tile = chunk_pos + chunk * CHUNK_SIZE
		
		if tile in rendered_chunks:
			continue
		rendered_chunks[tile] = 1
		
		if get_cell_alternative_tile(0, tile) == -1:
			for x in range(CHUNK_SIZE):
				for y in range(CHUNK_SIZE):
					var set_tile = tile + Vector2(x, y)
					if rng.randf() > 0.8:
						set_cell(0, set_tile, 0, Vector2(rng.randi_range(0,3),rng.randi_range(0,3)))
					else:
						set_cell(0, set_tile, 0, Vector2(0,0))
