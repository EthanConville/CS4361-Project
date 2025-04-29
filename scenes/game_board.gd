extends Node2D

@onready var player_1 : Sprite2D = $Player
@export var game_spaces : Array[Node]

@onready var volcano: AnimatedSprite2D = get_node("Volcano")
@onready var candy_cane_palace: AnimatedSprite2D = get_node("Candy Cane Palace")
@onready var chocolate_lake: AnimatedSprite2D = get_node("Chocolate Lake")
@onready var cotton_candy_cottage: AnimatedSprite2D = get_node("Cotton Candy Cottage")

var place : int = 1
var number_of_spaces : int
@onready var dice := $Dice
@onready var timer := $Timer

func _ready() -> void:
	if is_instance_valid(volcano) and volcano.sprite_frames.get_animation_names().size() > 0:
		volcano.play("default")
		
	if is_instance_valid(candy_cane_palace) and candy_cane_palace.sprite_frames.get_animation_names().size() > 0:
		candy_cane_palace.play("default")

	if is_instance_valid(chocolate_lake) and chocolate_lake.sprite_frames.get_animation_names().size() > 0:
		chocolate_lake.play("default")
		
	if is_instance_valid(cotton_candy_cottage) and cotton_candy_cottage.sprite_frames.get_animation_names().size() > 0:
		cotton_candy_cottage.play("default")
	
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
