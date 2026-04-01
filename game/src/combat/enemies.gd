# Enemy definitions for alpha dungeon
class_name EnemyData
extends Resource

static func get_all() -> Array[Dictionary]:
	return [slime(), skeleton(), dark_knight()]

static func slime() -> Dictionary:
	return {
		"id": "slime",
		"name": "Cave Slime",
		"hp": 18, "max_hp": 18,
		"attack": 5, "defense": 1,
		"xp": 10, "gold": 3,
		"sprite": "res://assets/sprites/enemies/slime.png",
		"intro_dialogue": "A slimy blob blocks your path!"
	}

static func skeleton() -> Dictionary:
	return {
		"id": "skeleton",
		"name": "Bone Archer",
		"hp": 30, "max_hp": 30,
		"attack": 8, "defense": 3,
		"xp": 25, "gold": 8,
		"sprite": "res://assets/sprites/enemies/skeleton.png",
		"intro_dialogue": "A rattling skeleton nocks an arrow!"
	}

static func dark_knight() -> Dictionary:
	return {
		"id": "dark_knight",
		"name": "Dark Knight",
		"hp": 55, "max_hp": 55,
		"attack": 14, "defense": 7,
		"xp": 80, "gold": 25,
		"sprite": "res://assets/sprites/enemies/dark_knight.png",
		"intro_dialogue": "The Dark Knight rises from the shadows... BOSS BATTLE!"
	}
