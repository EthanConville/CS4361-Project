extends RichTextLabel

var default_text1 = "Player 1: "
var default_text2 = "Player 2: "
var default_text3 = "Player 3: "
var default_text4 = "Player 4: "

func _process(delta: float) -> void:
	var main = get_node("/root/Game")  # Root node named 'Game'
	if main and main.players.size() >= 4:
		var text = default_text1 + str(main.players[0].Money) + "\n" + \
				   default_text2 + str(main.players[1].Money) + "\n" + \
				   default_text3 + str(main.players[2].Money) + "\n" + \
				   default_text4 + str(main.players[3].Money)
		self.text = text
