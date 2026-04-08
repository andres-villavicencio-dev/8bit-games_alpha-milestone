class_name Dungeon
extends Node2D

const DUNGEON_ID = "darkstone_cavern"
const DUNGEON_NAME = "Darkstone Cavern"

const ROOM_WIDTH = 320
const ROOM_HEIGHT = 240
const DOOR_WIDTH = 48
const DOOR_HEIGHT = 16

const DOOR_POSITIONS: Dictionary = {
	"north": Vector2(160, 0),
	"south": Vector2(160, 224),
	"east": Vector2(304, 112),
	"west": Vector2(16, 112)
}

enum RoomType { FLOOR, WALL, ENEMY, BOSS, EXIT, START }

var _rooms: Array[Dictionary]
var _room_map: Dictionary = {}
var _current_room_id: String = "entrance"
var _player_start_pos: Vector2 = Vector2(160, 180)
var _is_transitioning: bool = false
var _player: CharacterBody2D
var _boss_defeated_rooms: Array = []

signal room_changed(room_id: String)
signal room_transition_started(from_room: String, to_room: String, direction: String)
signal room_transition_completed(to_room: String)
signal battle_triggered(enemy_data: Dictionary)

func _ready() -> void:
	_rooms = _get_rooms_data()
	for room in _rooms:
		_room_map[room["id"]] = room
	room_transition_completed.connect(_on_room_transition_completed)
	_spawn_player()
	queue_redraw()

func _spawn_player() -> void:
	var player_scene = preload("res://src/overworld/player.tscn")
	_player = player_scene.instantiate()
	_player.position = _player_start_pos
	_player.set_process_input(true)
	add_child(_player)

func _on_room_transition_completed(to_room: String) -> void:
	_is_transitioning = false
	_player.set_process_input(true)
	
	var room = get_current_room()
	if room.get("enemy_spawn") != null:
		var game_manager = get_node("/root/GameManager")
		if room.get("is_boss", false) and game_manager.boss_defeated:
			return
		await get_tree().create_timer(0.5).timeout
		_trigger_battle(room)

func _trigger_battle(room: Dictionary) -> void:
	var enemy_type = room.get("enemy_spawn", "slime")
	var is_boss = room.get("is_boss", false)
	var enemy_data = _get_enemy_data(enemy_type, is_boss)
	battle_triggered.emit(enemy_data)

func _get_enemy_data(enemy_type: String, is_boss: bool = false) -> Dictionary:
	match enemy_type:
		"slime":
			return {
				"name": "Cave Slime",
				"hp": 30,
				"max_hp": 30,
				"attack": 8,
				"defense": 2,
				"is_boss": is_boss
			}
		"skeleton":
			return {
				"name": "Skeleton Warrior",
				"hp": 45,
				"max_hp": 45,
				"attack": 12,
				"defense": 4,
				"is_boss": is_boss
			}
		"dark_knight":
			return {
				"name": "Dark Knight",
				"hp": 80,
				"max_hp": 80,
				"attack": 18,
				"defense": 8,
				"is_boss": is_boss
			}
		_:
			return {
				"name": "Wild Monster",
				"hp": 25,
				"max_hp": 25,
				"attack": 10,
				"defense": 3,
				"is_boss": is_boss
			}

func get_player() -> CharacterBody2D:
	return _player

func get_current_room_id() -> String:
	return _current_room_id

func _get_rooms_data() -> Array[Dictionary]:
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

func get_current_room() -> Dictionary:
	return _room_map.get(_current_room_id, {})

func get_room_by_id(room_id: String) -> Dictionary:
	return _room_map.get(room_id, {})

func get_available_directions() -> Array[String]:
	var room = get_current_room()
	if room.is_empty():
		return []
	return room.get("connections", {}).keys()

func is_at_door(direction: String) -> bool:
	if not _player:
		return false
	var door_pos = DOOR_POSITIONS.get(direction)
	if not door_pos:
		return false
	var dist = (_player.position - door_pos).length()
	return dist < 20.0

func try_move(direction: String) -> bool:
	var room = get_current_room()
	var connections = room.get("connections", {})
	
	if not connections.has(direction):
		return false
	
	var from_room = _current_room_id
	var to_room = connections[direction]
	
	_is_transitioning = true
	_player.set_process_input(false)
	room_transition_started.emit(from_room, to_room, direction)
	_current_room_id = to_room
	room_changed.emit(_current_room_id)
	queue_redraw()
	
	await get_tree().create_timer(0.3).timeout
	_player.position = DOOR_POSITIONS[direction]
	room_transition_completed.emit(_current_room_id)
	return true

func _draw() -> void:
	var room = get_current_room()
	if room.is_empty():
		return
	
	var room_rect = Rect2(0, 0, ROOM_WIDTH, ROOM_HEIGHT)
	var bg_color = _get_room_color(room)
	draw_rect(room_rect, bg_color, true)
	
	var border_color = Color(0.2, 0.15, 0.1, 1.0)
	draw_rect(room_rect, border_color, false, 4.0)
	
	_draw_doors(room)
	_draw_room_details(room)

func _get_room_color(room: Dictionary) -> Color:
	if _boss_defeated_rooms.has(room.get("id", "")):
		return Color(0.1, 0.12, 0.1, 1.0)
	elif room.get("is_boss", false):
		return Color(0.15, 0.05, 0.1, 1.0)
	elif room.get("is_exit", false):
		return Color(0.1, 0.15, 0.1, 1.0)
	elif room.get("is_start", false):
		return Color(0.1, 0.1, 0.12, 1.0)
	elif room.get("enemy_spawn") != null:
		return Color(0.12, 0.1, 0.08, 1.0)
	else:
		return Color(0.1, 0.1, 0.1, 1.0)

func _draw_doors(room: Dictionary) -> void:
	var connections = room.get("connections", {})
	var door_color = Color(0.4, 0.35, 0.3, 1.0)
	
	if connections.has("north"):
		var door_rect = Rect2(
			ROOM_WIDTH / 2 - DOOR_WIDTH / 2,
			0,
			DOOR_WIDTH,
			DOOR_HEIGHT
		)
		draw_rect(door_rect, door_color, true)
	
	if connections.has("south"):
		var door_rect = Rect2(
			ROOM_WIDTH / 2 - DOOR_WIDTH / 2,
			ROOM_HEIGHT - DOOR_HEIGHT,
			DOOR_WIDTH,
			DOOR_HEIGHT
		)
		draw_rect(door_rect, door_color, true)
	
	if connections.has("east"):
		var door_rect = Rect2(
			ROOM_WIDTH - DOOR_HEIGHT,
			ROOM_HEIGHT / 2 - DOOR_WIDTH / 2,
			DOOR_HEIGHT,
			DOOR_WIDTH
		)
		draw_rect(door_rect, door_color, true)
	
	if connections.has("west"):
		var door_rect = Rect2(
			0,
			ROOM_HEIGHT / 2 - DOOR_WIDTH / 2,
			DOOR_HEIGHT,
			DOOR_WIDTH
		)
		draw_rect(door_rect, door_color, true)

func _draw_room_details(room: Dictionary) -> void:
	var detail_color = Color(0.3, 0.25, 0.2, 0.5)
	var room_id = room.get("id", "")
	
	if _boss_defeated_rooms.has(room_id):
		var throne_rect = Rect2(
			ROOM_WIDTH / 2 - 24,
			ROOM_HEIGHT / 2 - 32,
			48,
			48
		)
		draw_rect(throne_rect, Color(0.2, 0.2, 0.2, 0.8), true)
		draw_rect(throne_rect, Color(0.1, 0.1, 0.1, 1.0), false, 2.0)
	elif room.get("is_boss", false):
		var throne_rect = Rect2(
			ROOM_WIDTH / 2 - 24,
			ROOM_HEIGHT / 2 - 32,
			48,
			48
		)
		draw_rect(throne_rect, Color(0.5, 0.0, 0.0, 0.8), true)
		draw_rect(throne_rect, Color(0.3, 0.0, 0.0, 1.0), false, 2.0)
	elif room.get("enemy_spawn") != null:
		var enemy_marker = Rect2(
			ROOM_WIDTH / 2 - 8,
			ROOM_HEIGHT / 2 - 8,
			16,
			16
		)
		var enemy_color = Color(0.0, 0.5, 0.0, 0.6) if room.get("enemy_spawn") == "slime" else Color(0.8, 0.8, 0.8, 0.6)
		draw_rect(enemy_marker, enemy_color, true)
	elif room.get("is_exit", false):
		var exit_marker = Rect2(
			ROOM_WIDTH / 2 - 16,
			ROOM_HEIGHT / 2 - 24,
			32,
			48
		)
		draw_rect(exit_marker, Color(1.0, 1.0, 0.8, 0.4), true)
	
	for i in range(3):
		var stalactite_x = 50 + i * 100
		var stalactite_height = 15 + (i % 3) * 5
		var stalactite_rect = Rect2(
			stalactite_x,
			0,
			8,
			stalactite_height
		)
		draw_rect(stalactite_rect, detail_color, true)

func is_transitioning() -> bool:
	return _is_transitioning

func mark_boss_defeated() -> void:
	var room = get_current_room()
	if room.get("is_boss", false) and not _boss_defeated_rooms.has(_current_room_id):
		_boss_defeated_rooms.append(_current_room_id)
		queue_redraw()
