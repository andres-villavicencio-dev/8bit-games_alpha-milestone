extends Node

signal dialogue_started
signal dialogue_ended
signal line_advanced(text: String, speaker: String)

var current_dialogue: Array = []
var current_index: int = 0

func start_dialogue(lines: Array) -> void:
	current_dialogue = lines
	current_index = 0
	dialogue_started.emit()
	show_line()

func advance() -> void:
	current_index += 1
	if current_index >= current_dialogue.size():
		dialogue_ended.emit()
	else:
		show_line()

func show_line() -> void:
	var entry = current_dialogue[current_index]
	line_advanced.emit(entry.get("text", ""), entry.get("speaker", ""))
