extends Node

signal battle_ended(result: String)

var player_hp: int = 100
var enemy_hp: int = 50

func player_attack(damage: int) -> void:
	enemy_hp -= damage
	if enemy_hp <= 0:
		battle_ended.emit("victory")

func enemy_attack(damage: int) -> void:
	player_hp -= damage
	if player_hp <= 0:
		battle_ended.emit("defeat")
