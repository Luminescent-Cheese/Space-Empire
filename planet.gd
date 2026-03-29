extends Node2D
signal buildShip
func _on_button_pressed() -> void:
	buildShip.emit(self.name)
