extends RichTextLabel

var default_text1 = "Player 1: "
var default_text2 = "Player 2: "
var default_text3 = "Player 3: "
var default_text4 = "Player 4: "

func _process(delta: float) -> void:
	var main = get_node("/root/Game")  # Since 'Game' is the root node
	if main and main.players:
		var text = str(
			default_text1, main.players[0].Money, "\n",
			default_text2, main.players[1].Money, "\n",
			default_text3, main.players[2].Money, "\n",
			default_text4, main.players[3].Money
		)
		self.text = text
