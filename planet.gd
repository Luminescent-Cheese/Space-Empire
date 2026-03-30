extends Node2D
signal buildShip
signal moveShip

func _on_summon_ship_pressed() -> void:
	buildShip.emit(self.name)

func _on_button_pressed() -> void:
	#moving ships
	moveShip.emit(self.name)
