extends Node2D
var ship = preload("res://ship.tscn")
@onready var planetStorage = $planets
@onready var ships := {}
func _ready() -> void:
	#connects signals from planets
	for grandchild in planetStorage.get_children():
		grandchild.buildShip.connect(_on_planet_build_ship)
func _on_planet_build_ship(name) -> void:
	var spawnShip = ship.instantiate()
	ships[spawnShip.name] = planetStorage.planets[name]
	spawnShip.home = ships[spawnShip.name]
	add_child(spawnShip)
