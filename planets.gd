extends Node2D
@export var planets := {}
func _ready() -> void:
	#gets planets and their positions
	for child in get_children():
		planets[child.name] = child.global_position
