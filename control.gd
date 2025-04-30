extends Control

var player = null
var items = [
	{"name": "Speed Boost", "cost": 50},
	{"name": "Extra Turn", "cost": 100},
	{"name": "Shield", "cost": 75},
]

func _ready():
	update_shop()

func set_player(p):
	player = p

func update_shop():
	var item_list = $ItemList
	item_list.clear()
	for item in items:
		item_list.add_item("%s - %d pts" % [item.name, item.cost])

func _on_BuyButton_pressed():
	var selected = $ItemList.get_selected_items()
	if selected.size() == 0:
		return
	var item = items[selected[0]]
	if player.Money >= item.cost:
		player.Money -= item.cost
		# Here you would add logic to "give" the item to the player
		print("Purchased:", item.name)
		queue_free()  # Close the shop
	else:
		print("Not enough money!")

func _on_CloseButton_pressed():
	queue_free()
