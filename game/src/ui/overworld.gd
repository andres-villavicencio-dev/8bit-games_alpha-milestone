extends Node2D

@onready var player_scene: PackedScene = preload("res://src/characters/player.tscn")
@onready var dungeon: Node2D = $Dungeon

var current_room: int = 0

func _ready() -> void:
	spawn_player()

func spawn_player() -> void:
	var player = player_scene.instantiate()
	add_child(player)
	player.position = Vector2(160, 90)

func _on_door_entered(enemy_data: Dictionary) -> void:
	get_tree().change_scene_to_file("res://scenes/battle.tscn")