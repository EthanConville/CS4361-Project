extends Control
@onready var start = $Start
@onready var help = $Help
@onready var bg = $background

func _ready():
	start.visible = false
	help.visible = false
	bg.play()
	$Move.play("move")
	await get_tree().create_timer(3.5).timeout
	start.visible = true
	help.visible = true
	


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/GameBoard.tscn")
	


func _on_help_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Help.tscn")
