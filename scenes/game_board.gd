extends Node2D

@onready var player_1 : Sprite2D = $Player
@export var game_spaces : Array[Node]
var place : int = 1
var number_of_spaces : int
@onready var dice := $Dice
@onready var timer := $Timer

func _ready() -> void:
	number_of_spaces = game_spaces.size()


func _on_dice_dice_has_rolled(roll: Variant) -> void:
	print(roll)
	while(roll != 0):
		var tween = create_tween()
		tween.tween_property(player_1, "position", game_spaces[place].position, 1)
		timer.start()
		await timer.timeout
		place += 1
		roll -= 1
