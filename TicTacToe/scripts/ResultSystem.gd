extends Node

func _ready():
	$Wins.show()
	$Player.show()
	$Tie.hide()
	if(StateManager.Winner == 0):
		tie()
	else:
		if(StateManager.Winner == 1):
			win(1)
		else:
			win(2)

func tie():
	$Wins.hide()
	$Player.hide()
	$Tie.show()

func win(var winner):
	if(winner == 1):
		$Player.texture = load("res://assets/P1.png")
	else:
		$Player.texture = load("res://assets/P2.png")	