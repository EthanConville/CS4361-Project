extends Node2D

@export var game_spaces : Array[tile]


@onready var volcano: AnimatedSprite2D = get_node("Volcano")
@onready var candy_cane_palace: AnimatedSprite2D = get_node("Candy Cane Palace")
@onready var chocolate_lake: AnimatedSprite2D = get_node("Chocolate Lake")
@onready var cotton_candy_cottage: AnimatedSprite2D = get_node("Cotton Candy Cottage")

@export var players : Array[Character]
var place : int = 1
#control whose durrent it is
var current_player = 0;
var number_of_spaces : int
var dice_rolled : bool = false

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
	dice_rolled = true
	#update player position
	players[current_player].current_tile += roll
	while(roll != 0):
		await(move(place))
		place += 1
		roll -= 1
		#piece has stopped moving
		if roll == 0:
			TileAction()

func move(place) -> void:
		players[current_player].play("walk")
		var tween = create_tween()
		tween.tween_property(players[current_player], "position", game_spaces[place].position, 1)
		timer.start()
		await timer.timeout
		players[current_player].stop()

func TileAction() -> void:
	var remainder: int = players[current_player].current_tile % 6
	#tile colors
	match remainder:
		#red tiles
		0:
			timer.start()
			await timer.timeout
			#move back 3 tiles
			for i in range(2):
				await(move(place))
				place -= 1
			
		#purple tiles
		1:
			pass
		#yellow tiles
		2:
			pass
		#blue tiles
		3:
			pass
		
		#green tiles
		4:
			#move forward 3 tiles
			for i in range(2):
				await(move(place))
				place += 1
			
		#orange tiles
		5:
			pass
	#change turns 
	dice_rolled = false
