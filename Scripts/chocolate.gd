extends Area2D
#@onready var death_particles = $DeathParticles
#@onready var spawn_point = %SpawnPoint

signal player_died(death_position: Vector2)


@export var amplitude := 4
@export var frequency := 5

var time_passed = 0
var initial_position := Vector2.ZERO

#hovering animation
func _ready():
	initial_position = position

func _process(delta):
	chocolate_hover(delta) 

func chocolate_hover(delta):
	time_passed += delta
	var new_y = initial_position.y + amplitude * sin(frequency * time_passed)
	position.y = new_y
	
	
func _on_body_entered(body):
	if body.is_in_group("Player"):
		await get_tree().create_timer(1.0).timeout
		visible = false
