extends Node2D

@onready var player_1 : Sprite2D = $Player
@export var game_spaces : Array[Node]

@onready var volcano: AnimatedSprite2D = get_node("Volcano")
@onready var candy_cane_palace: AnimatedSprite2D = get_node("Candy Cane Palace")
@onready var chocolate_lake: AnimatedSprite2D = get_node("Chocolate Lake")
@onready var cotton_candy_cottage: AnimatedSprite2D = get_node("Cotton Candy Cottage")

var place : int = 1
var number_of_spaces : int
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
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_click") and place <= (number_of_spaces - 1):
		var tween = create_tween()
		tween.tween_property(player_1, "position", game_spaces[place].position, 1)
		place += 1
	elif place >= number_of_spaces:
		print("Player won game")
		
