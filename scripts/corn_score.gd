extends RichTextLabel

func _process(delta: float) -> void:
	var main = get_node("/root/Game")  # Since 'Game' is the root node
	if main and main.players:
		var text = str(
			main.players[3].Money
		)
		self.text = text
