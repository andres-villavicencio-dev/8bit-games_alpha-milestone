extends Node

signal battle_started(player_data: Dictionary, enemy_data: Dictionary)
signal battle_ended(result: String)
signal turn_started(is_player_turn: bool)
signal damage_dealt(target: String, amount: int, remaining_hp: int)
signal status_message(text: String)

enum BattleState { INACTIVE, PLAYER_TURN, ENEMY_TURN, VICTORY, DEFEAT }

var state: BattleState = BattleState.INACTIVE
var player: Dictionary = {}
var enemy: Dictionary = {}

func start_battle(player_data: Dictionary, enemy_data: Dictionary) -> void:
	player = player_data.duplicate()
	enemy = enemy_data.duplicate()
	state = BattleState.PLAYER_TURN
	battle_started.emit(player, enemy)
	turn_started.emit(true)

func player_action(action: String) -> void:
	if state != BattleState.PLAYER_TURN:
		return

	match action:
		"attack":
			var dmg = _calc_damage(player.attack, enemy.defense)
			enemy.hp -= dmg
			damage_dealt.emit("enemy", dmg, enemy.hp)
			status_message.emit("%s attacks for %d damage!" % [player.name, dmg])
		"heal":
			var heal = randi_range(15, 25)
			player.hp = mini(player.hp + heal, player.max_hp)
			status_message.emit("%s heals %d HP!" % [player.name, heal])
		"flee":
			if randf() < 0.70:
				status_message.emit("Got away safely!")
				_end_battle("fled")
				return
			else:
				status_message.emit("Couldn't escape!")
				state = BattleState.ENEMY_TURN
				turn_started.emit(false)
				await get_tree().create_timer(1.0).timeout
				_enemy_turn()
				return

	if enemy.hp <= 0:
		_end_battle("victory")
	else:
		state = BattleState.ENEMY_TURN
		turn_started.emit(false)
		await get_tree().create_timer(1.0).timeout
		_enemy_turn()

func _enemy_turn() -> void:
	var dmg = _calc_damage(enemy.attack, player.defense)
	player.hp -= dmg
	damage_dealt.emit("player", dmg, player.hp)
	status_message.emit("%s attacks for %d damage!" % [enemy.name, dmg])

	if player.hp <= 0:
		_end_battle("defeat")
	else:
		state = BattleState.PLAYER_TURN
		turn_started.emit(true)

func _calc_damage(attack: int, defense: int) -> int:
	return maxi(1, attack - defense)

func _end_battle(result: String) -> void:
	state = BattleState.INACTIVE
	battle_ended.emit(result)
