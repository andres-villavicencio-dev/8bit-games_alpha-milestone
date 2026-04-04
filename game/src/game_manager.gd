extends Node

enum GameState { OVERWORLD, BATTLE, DIALOGUE, MENU }

var current_state: GameState = GameState.OVERWORLD

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
	transition_to(GameState.BATTLE)
	# battle scene will call battle_system.start_battle() on _ready
