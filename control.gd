extends Control

var player = null
var abilities = [
	{"name": "Move Forward", "cost": 200},
	{"name": "Extra Turn", "cost": 1000},
	{"name": "Move Enemy backward", "cost":500},
]

func _ready():
	# Set up buttons
	$VBoxContainer/Forward.text = abilities[0].name + " - " + str(abilities[0].cost) + " pts"
	$VBoxContainer/Backward.text = abilities[1].name + " - " + str(abilities[1].cost) + " pts"
	$VBoxContainer/Extra.text = abilities[2].name + " - " + str(abilities[2].cost) + " pts"

	# Connect button signals
	$VBoxContainer/Forward.connect("pressed", self, "_on_SpeedBoostButton_pressed")
	$VBoxContainer/Extra.connect("pressed", self, "_on_ExtraTurnButton_pressed")
	$VBoxContainer/Backward.connect("pressed", self, "_on_ShieldButton_pressed")
	$VBoxContainer/CloseButton.connect("pressed", self, "_on_CloseButton_pressed")

func set_player(p):
	player = p

# Each button press will call the corresponding function

func _on_SpeedBoostButton_pressed():
	if player.Money >= abilities[0].cost:
		player.Money -= abilities[0].cost
		# Apply the Speed Boost ability to the player (e.g., increase movement speed)
		print("Speed Boost purchased!")
		queue_free()  # Close the shop
	else:
		print("Not enough money for Speed Boost!")

func _on_ExtraTurnButton_pressed():
	if player.Money >= abilities[1].cost:
		player.Money -= abilities[1].cost
		# Apply the Extra Turn ability (e.g., give the player another turn)
		print("Extra Turn purchased!")
		queue_free()  # Close the shop
	else:
		print("Not enough money for Extra Turn!")

func _on_ShieldButton_pressed():
	if player.Money >= abilities[2].cost:
		player.Money -= abilities[2].cost
		# Apply the Shield ability (e.g., reduce damage taken)
		print("Shield purchased!")
		queue_free()  # Close the shop
	else:
		print("Not enough money for Shield!")

func _on_CloseButton_pressed():
	queue_free()  # Close the shop without making a purchase
