extends Node

signal dialogue_started(speaker: String)
signal dialogue_ended
signal line_shown(text: String, speaker: String, portrait: String)
signal choice_presented(choices: Array)

var current_dialogue: Array = []
var current_index: int = 0
var is_active: bool = false

func start_dialogue(lines: Array) -> void:
	if is_active:
		return
	current_dialogue = lines
	current_index = 0
	is_active = true
	var first_speaker = lines[0].get("speaker", "") if lines.size() > 0 else ""
	dialogue_started.emit(first_speaker)
	_show_current()

func advance(choice_index: int = -1) -> void:
	if not is_active:
		return

	var current = current_dialogue[current_index]

	# Handle branching choices
	if current.has("choices") and choice_index >= 0:
		var choices = current["choices"]
		if choice_index < choices.size():
			var chosen = choices[choice_index]
			if chosen.has("next"):
				_jump_to(chosen["next"])
				return

	current_index += 1
	if current_index >= current_dialogue.size():
		_end()
	else:
		_show_current()

func _show_current() -> void:
	var entry = current_dialogue[current_index]
	line_shown.emit(
		entry.get("text", ""),
		entry.get("speaker", ""),
		entry.get("portrait", "")
	)
	if entry.has("choices"):
		choice_presented.emit(entry["choices"])

func _jump_to(label: String) -> void:
	for i in current_dialogue.size():
		if current_dialogue[i].get("label") == label:
			current_index = i
			_show_current()
			return
	_end()

func _end() -> void:
	is_active = false
	dialogue_ended.emit()
