extends Node

enum GameState { OVERWORLD, BATTLE, DIALOGUE, MENU }

var current_state: GameState = GameState.OVERWORLD
var pending_enemy: Dictionary = {}
var boss_defeated: bool = false
var cleared_rooms: Dictionary = {}
var last_battle_room_id: String = ""

@onready var battle_system: Node = $BattleSystem
@onready var dialogue_manager: Node = $DialogueManager

func transition_to(new_state: GameState) -> void:
	current_state = new_state
	match new_state:
		GameState.OVERWORLD:
			get_tree().change_scene_to_file("res://scenes/overworld.tscn")
		GameState.BATTLE:
			get_tree().change_scene_to_file("res://scenes/battle.tscn")

func start_encounter(enemy_data: Dictionary) -> void:
	pending_enemy = enemy_data
	if enemy_data.has("room_id"):
		last_battle_room_id = enemy_data["room_id"]
	transition_to(GameState.BATTLE)

func mark_room_cleared(room_id: String) -> void:
	cleared_rooms[room_id] = true

func is_room_cleared(room_id: String) -> bool:
	return cleared_rooms.has(room_id)

func mark_boss_defeated_global() -> void:
	boss_defeated = true
