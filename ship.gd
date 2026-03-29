extends CharacterBody2D

@export var home:Vector2
@onready var rng = RandomNumberGenerator.new()
var orbitdegree = 0
var orbitSpeed
var orbitDistance

func _ready() -> void:
	global_position = home
	orbitSpeed = rng.randf_range(.005,.02)
	orbitDistance = rng.randi_range(250,350)
	
func _physics_process(delta: float) -> void:
	_orbit(orbitDistance,orbitdegree)
	orbitdegree -= orbitSpeed
	rotation = orbitdegree

func _orbit(distance,degree) -> void:
	global_position = Vector2(home.x + distance*cos(degree),home.y + distance*sin(degree))
