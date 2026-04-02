extends Control

@onready var battle_system: Node = $BattleSystem
@onready var player_hp_label: Label = $VBoxContainer/PlayerPanel/PlayerHP
@onready var enemy_hp_label: Label = $VBoxContainer/EnemyPanel/EnemyHP
@onready var status_label: Label = $VBoxContainer/StatusLabel
@onready var attack_button: Button = $VBoxContainer/ActionPanel/AttackButton
@onready var heal_button: Button = $VBoxContainer/ActionPanel/HealButton
@onready var flee_button: Button = $VBoxContainer/ActionPanel/FleeButton

var player_data: Dictionary = {
	"name": "Hero",
	"hp": 100,
	"max_hp": 100,
	"attack": 15,
	"defense": 5
}

var enemy_data: Dictionary = {
	"name": "Cave Slime",
	"hp": 30,
	"max_hp": 30,
	"attack": 8,
	"defense": 2
}

func _ready() -> void:
	battle_system.battle_started.connect(_on_battle_started)
	battle_system.damage_dealt.connect(_on_damage_dealt)
	battle_system.status_message.connect(_on_status_message)
	battle_system.battle_ended.connect(_on_battle_ended)
	battle_system.turn_started.connect(_on_turn_started)

	attack_button.pressed.connect(_on_attack_pressed)
	heal_button.pressed.connect(_on_heal_pressed)
	flee_button.pressed.connect(_on_flee_pressed)

	battle_system.start_battle(player_data, enemy_data)

func _on_battle_started(p_data: Dictionary, e_data: Dictionary) -> void:
	player_data = p_data
	enemy_data = e_data
	_update_hp_display()

func _on_damage_dealt(target: String, amount: int, remaining_hp: int) -> void:
	_update_hp_display()

func _on_status_message(text: String) -> void:
	status_label.text = text

func _on_turn_started(is_player_turn: bool) -> void:
	var interactive = is_player_turn
	attack_button.disabled = not interactive
	heal_button.disabled = not interactive
	flee_button.disabled = not interactive

func _on_battle_ended(result: String) -> void:
	status_label.text = "Battle ended: " + result
	attack_button.disabled = true
	heal_button.disabled = true
	flee_button.disabled = true
	if result == "victory":
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/overworld.tscn")
	elif result == "defeat":
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_attack_pressed() -> void:
	battle_system.player_action("attack")

func _on_heal_pressed() -> void:
	battle_system.player_action("heal")

func _on_flee_pressed() -> void:
	battle_system.player_action("flee")

func _update_hp_display() -> void:
	player_hp_label.text = "HP: %d/%d" % [player_data.hp, player_data.max_hp]
	enemy_hp_label.text = "HP: %d/%d" % [enemy_data.hp, enemy_data.max_hp]