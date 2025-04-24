extends Node2D

@onready var player_1 : AnimatedSprite2D = $Player1
@onready var spot_two : Marker2D = $SpotTwo
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($Player1, "position", spot_two.Position, 1)
