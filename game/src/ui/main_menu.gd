extends Control

@onready var start_button: Button = $VBoxContainer/StartButton
@onready var quit_button: Button = $VBoxContainer/QuitButton

signal start_game()

func _ready() -> void:
	start_button.pressed.connect(_on_start_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)

func _on_start_button_pressed() -> void:
	start_game.emit()
	get_tree().change_scene_to_file("res://scenes/overworld.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()