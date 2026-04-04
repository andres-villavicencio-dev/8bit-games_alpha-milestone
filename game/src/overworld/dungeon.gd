# Dungeon: The Darkstone Cavern (alpha demo — 1 dungeon)
class_name DungeonData
extends Resource

const DUNGEON_ID = "darkstone_cavern"
const DUNGEON_NAME = "Darkstone Cavern"

# Room layout (0=floor, 1=wall, E=enemy spawn, B=boss, X=exit, S=start)
static func get_rooms() -> Array[Dictionary]:
	return [
		{
			"id": "entrance",
			"name": "Cavern Entrance",
			"description": "Dripping stalactites hang overhead. The air smells of earth and dread.",
			"connections": {"north": "main_hall"},
			"enemy_spawn": null,
			"is_start": true
		},
		{
			"id": "main_hall",
			"name": "Main Hall",
			"description": "Torches flicker along crumbling stone walls.",
			"connections": {"south": "entrance", "north": "inner_chamber", "east": "side_passage"},
			"enemy_spawn": "slime"
		},
		{
			"id": "side_passage",
			"name": "Side Passage",
			"description": "Bones litter the floor. Something lurks ahead.",
			"connections": {"west": "main_hall"},
			"enemy_spawn": "skeleton"
		},
		{
			"id": "inner_chamber",
			"name": "Inner Chamber",
			"description": "The temperature drops. A cold blue light emanates from the depths.",
			"connections": {"south": "main_hall", "north": "boss_chamber"},
			"enemy_spawn": "slime"
		},
		{
			"id": "boss_chamber",
			"name": "The Dark Throne",
			"description": "A massive armored figure sits motionless on a throne of bones.",
			"connections": {"south": "inner_chamber", "north": "exit"},
			"enemy_spawn": "dark_knight",
			"is_boss": true
		},
		{
			"id": "exit",
			"name": "Cavern Exit",
			"description": "Daylight streams through a crack in the rock. Freedom.",
			"connections": {"south": "boss_chamber"},
			"enemy_spawn": null,
			"is_exit": true
		}
	]
