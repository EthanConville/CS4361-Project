extends Node2D

@onready var player_1 : Sprite2D = $Player
@export var game_spaces : Array[Node]
var place : int = 0
var number_of_spaces : int
@onready var dice := $Dice
@onready var timer := $Timer

func _ready() -> void:
	number_of_spaces = game_spaces.size()


func _on_dice_dice_has_rolled(roll: Variant) -> void:
	print(roll)
	while(roll != 0):
		await(move(place))
		place += 1
		roll -= 1
		#piece has stopped moving
		if roll == 0:
			pass

func move(place) -> void: 
		var tween = create_tween()
		tween.tween_property(player_1, "position", game_spaces[place].position, 1)
		timer.start()
		await timer.timeout
