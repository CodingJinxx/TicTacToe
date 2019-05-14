extends Node2D

var Turn = 0
var PlayerTurn = false
var RectX = 0
var Player = AudioStreamPlayer.new()
var Winner = 0
var Board = {}

func _ready():
	self.add_child(Player)
	Player.stream = load("res://Click.ogg")
	InitBoard()
	pass # Replace with function body.

func UpdateTurn(var Position):
	Player.play()
	Turn += 1
	Board[Position] = 2 if PlayerTurn else 1
	PlayerTurn = !PlayerTurn
	if(PlayerTurn):
		RectX = 64
	else: RectX = 0
	Winner = CheckWinner()
	if(Winner != 0):
		get_tree().change_scene("res://scenes/Result.tscn")
	if(Turn >= 9):
		get_tree().change_scene("res://scenes/Result.tscn")

func InitBoard():
	Board[Vector2(0,0)] = 0
	Board[Vector2(0,1)] = 0
	Board[Vector2(0,2)] = 0
	Board[Vector2(1,0)] = 0
	Board[Vector2(1,1)] = 0
	Board[Vector2(1,2)] = 0
	Board[Vector2(2,0)] = 0
	Board[Vector2(2,1)] = 0
	Board[Vector2(2,2)] = 0

func CheckWinner():
	var Winner = 0
	Winner = CheckHorizontal()
	if(Winner == 0):
		Winner = CheckVertical()
		if(Winner == 0):
			Winner = CheckDiagonal()
	return Winner

func _checkDiagonalRight():
	if(Board[Vector2(0,0)] == 0): return 0
	var Winner = Board[Vector2(0, 0)]
	for i in range(3):
		if(Winner != Board[Vector2(i, i)]):
			Winner = 0
			break
	return Winner

func _checkDiagonalLeft():
	if(Board[Vector2(2,0)] == 0): return 0
	var Winner = Board[Vector2(2,0)]
	var j = 2
	for i in range(3):
		if(Winner != Board[Vector2(j,i)]):
			Winner = 0
			break
		j -= 1
	return Winner

func CheckDiagonal():
	var Winner
	Winner = _checkDiagonalRight()
	if(Winner == 0):
		Winner = _checkDiagonalLeft()
	return Winner

func CheckVertical():
	var Winner
	for i in range(3):
		Winner = Board[Vector2(0, i)]
		if(Board[Vector2(1, i)] == Winner && Board[Vector2(2, i)] == Winner):
			return Winner
	return 0

func CheckHorizontal():
	var Winner
	for i in range(3):
		Winner = Board[Vector2(i,0)]
		if(Board[Vector2(i, 1)] == Winner && Board[Vector2(i, 2)] == Winner):
			return Winner
	return 0