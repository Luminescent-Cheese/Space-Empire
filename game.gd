extends Node2D
var ship = preload("res://ship.tscn")
@onready var planetStorage = $planets
@onready var ships := {}
var shipsInPlay = 0
@onready var planetShips :={}
var moveShips = [" "," "]
var shipsToMove = []
func _ready() -> void:
	#connects signals from planets
	for grandchild in planetStorage.get_children():
		grandchild.buildShip.connect(_on_planet_build_ship)
		grandchild.moveShip.connect(_on_planet_move_ship)
		planetShips[grandchild.name] = []

func _on_planet_build_ship(name) -> void:
	var spawnShip = ship.instantiate()
	spawnShip.name = "ship"+str(shipsInPlay)
	ships[spawnShip.name] = [planetStorage.planets[name]]
	spawnShip.home = ships[spawnShip.name][0]
	shipsInPlay += 1
	add_child(spawnShip)
	ships[spawnShip.name].append(spawnShip)
	planetShips[name].append(spawnShip.name)

func _on_planet_move_ship(name) -> void:
	#Gets the ships on a planet to move them to another
	#Gets list of all ship names that need to move
	if moveShips[0] == " ":
		moveShips[0] = name
		for i in range(planetShips[name].size()):
			shipsToMove.append((planetShips[name])[i])
		print(moveShips)
	else:
		#Checks to see if same planet was selected twice (cancels if yes)
		moveShips[1] = name
		if moveShips[0] == moveShips[1]:
			moveShips = [" ", " "]
			shipsToMove = []
		else:
			#otherwise tells ships to move to new planet
			for i in range(shipsToMove.size()):
				ships[shipsToMove[i]][0] = planetStorage.planets[name]
				(ships[shipsToMove[i]])[1].home = ships[shipsToMove[i]][0]
				planetShips[name].append(shipsToMove[i])
				planetShips[moveShips[0]].erase(shipsToMove[i])
			moveShips = [" ", " "]
			shipsToMove = []
