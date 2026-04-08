extends Control

@onready var battle_system: Node = $BattleSystem
@onready var player_hp_label: Label = $VBoxContainer/PlayerPanel/PlayerInfo/PlayerHP
@onready var player_hp_bar: ProgressBar = $VBoxContainer/PlayerPanel/PlayerInfo/PlayerHPBar
@onready var player_name_label: Label = $VBoxContainer/PlayerPanel/PlayerInfo/PlayerName
@onready var player_stats_label: Label = $VBoxContainer/PlayerPanel/PlayerInfo/PlayerStats
@onready var enemy_hp_label: Label = $VBoxContainer/EnemyPanel/EnemyInfo/EnemyHP
@onready var enemy_hp_bar: ProgressBar = $VBoxContainer/EnemyPanel/EnemyInfo/EnemyHPBar
@onready var enemy_name_label: Label = $VBoxContainer/EnemyPanel/EnemyInfo/EnemyName
@onready var status_label: Label = $VBoxContainer/StatusLabel
@onready var battle_log: RichTextLabel = $VBoxContainer/BattleLog
@onready var attack_button: Button = $VBoxContainer/ActionPanel/AttackButton
@onready var heal_button: Button = $VBoxContainer/ActionPanel/HealButton
@onready var flee_button: Button = $VBoxContainer/ActionPanel/FleeButton

const MAX_LOG_LINES: int = 5

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
	_load_battle_data()
	battle_system.battle_started.connect(_on_battle_started)
	battle_system.damage_dealt.connect(_on_damage_dealt)
	battle_system.status_message.connect(_on_status_message)
	battle_system.battle_ended.connect(_on_battle_ended)
	battle_system.turn_started.connect(_on_turn_started)

	attack_button.pressed.connect(_on_attack_pressed)
	heal_button.pressed.connect(_on_heal_pressed)
	flee_button.pressed.connect(_on_flee_pressed)

	battle_system.start_battle(player_data, enemy_data)
	_on_turn_started(true)

func _load_battle_data() -> void:
	var game_manager = get_node("/root/GameManager")
	if game_manager.pending_enemy.size() > 0:
		enemy_data = game_manager.pending_enemy.duplicate()
		game_manager.pending_enemy = {}

func _on_battle_started(p_data: Dictionary, e_data: Dictionary) -> void:
	player_data = p_data
	enemy_data = e_data
	_update_hp_display()
	_update_name_display()
	_clear_battle_log()
	_add_battle_log("A wild %s appeared!" % enemy_data.name)

func _on_damage_dealt(target: String, amount: int, remaining_hp: int) -> void:
	_update_hp_display()
	var target_name = "enemy" if target == "enemy" else player_data.name
	_add_battle_log("%s takes %d damage! (%d HP left)" % [target_name, amount, remaining_hp])

func _on_status_message(text: String) -> void:
	status_label.text = text
	_add_battle_log(text)

func _on_turn_started(is_player_turn: bool) -> void:
	var interactive = is_player_turn
	attack_button.disabled = not interactive
	heal_button.disabled = not interactive
	flee_button.disabled = not interactive

func _on_battle_ended(result: String) -> void:
	var game_manager = get_node("/root/GameManager")
	var is_boss = enemy_data.get("is_boss", false)
	
	match result:
		"victory":
			status_label.text = "Victory!"
			_add_battle_log("Victory! %s defeated %s!" % [player_data.name, enemy_data.name])
			var room_id = enemy_data.get("room_id", "")
			if room_id != "":
				game_manager.mark_room_cleared(room_id)
			if is_boss:
				game_manager.mark_boss_defeated_global()
			attack_button.disabled = true
			heal_button.disabled = true
			flee_button.disabled = true
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/overworld.tscn")
		"defeat":
			status_label.text = "Defeat..."
			_add_battle_log("Defeat... %s was knocked out." % player_data.name)
			attack_button.disabled = true
			heal_button.disabled = true
			flee_button.disabled = true
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		"fled":
			status_label.text = "Escaped!"
			_add_battle_log("Got away safely!")
			attack_button.disabled = true
			heal_button.disabled = true
			flee_button.disabled = true
			await get_tree().create_timer(1.5).timeout
			get_tree().change_scene_to_file("res://scenes/overworld.tscn")

func _on_attack_pressed() -> void:
	battle_system.player_action("attack")

func _on_heal_pressed() -> void:
	battle_system.player_action("heal")

func _on_flee_pressed() -> void:
	battle_system.player_action("flee")

func _update_hp_display() -> void:
	player_hp_label.text = "HP: %d/%d" % [player_data.hp, player_data.max_hp]
	enemy_hp_label.text = "HP: %d/%d" % [enemy_data.hp, enemy_data.max_hp]
	
	var player_hp_ratio = float(player_data.hp) / float(player_data.max_hp) if player_data.max_hp > 0 else 0.0
	var enemy_hp_ratio = float(enemy_data.hp) / float(enemy_data.max_hp) if enemy_data.max_hp > 0 else 0.0
	
	player_hp_bar.value = player_hp_ratio * 100
	enemy_hp_bar.value = enemy_hp_ratio * 100

func _update_name_display() -> void:
	player_name_label.text = player_data.name
	enemy_name_label.text = enemy_data.name
	player_stats_label.text = "ATK: %d  DEF: %d" % [player_data.attack, player_data.defense]

func _add_battle_log(message: String) -> void:
	var current_text = battle_log.text
	if current_text.length() > 0:
		current_text += "\n"
	current_text += message
	
	var lines = current_text.split("\n")
	if lines.size() > MAX_LOG_LINES:
		lines = lines.slice(lines.size() - MAX_LOG_LINES)
		current_text = "\n".join(lines)
	
	battle_log.text = current_text

func _clear_battle_log() -> void:
	battle_log.text = ""