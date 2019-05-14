extends Node

var Position = Vector2(0,0)

func _ready():
	pass

func GetPosition():
	var TMP = Position
	if(Position.x < 2):
		Position.x += 1
	else:
		Position.x = 0
		if(Position.y < 2):
			Position.y += 1
	return TMP