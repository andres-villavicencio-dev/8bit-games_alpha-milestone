extends Node2D

@onready var dungeon: Node2D = $Dungeon
@onready var game_manager: Node = get_node("/root/GameManager")

var current_room: int = 0

func _ready() -> void:
	dungeon.battle_triggered.connect(_on_battle_triggered)

func _on_battle_triggered(enemy_data: Dictionary) -> void:
	game_manager.start_encounter(enemy_data)
