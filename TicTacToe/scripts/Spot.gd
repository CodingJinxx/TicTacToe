extends Area2D

var Selected = false
var Position = SpotManager.GetPosition()

func _ready():
	pass # Replace with function body.

func _on_Area2D_mouse_entered():
	if(!Selected):
		$Spot.region_rect = Rect2(StateManager.RectX, 0, 64, 64)
		$Spot.modulate = Color(1,1,1,0.3)

func _on_Area2D_mouse_exited():
	if(!Selected):
		$Spot.region_rect = Rect2(128, 0, 64, 64)
		$Spot.modulate = Color(1,1,1,1)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton && !Selected):
		if(event.button_index == BUTTON_LEFT):
			Selected = true
			$Spot.modulate = Color(1,1,1,1)
			$Spot.region_rect = Rect2(StateManager.RectX, 0, 64, 64)
			StateManager.UpdateTurn(Position)
	pass # Replace with function body.
