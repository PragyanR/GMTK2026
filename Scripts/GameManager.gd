# This script is an autoload, that can be accessed from any other script!

extends Node2D

var bodies = preload("res://Scenes/Prefabs/bodies.tscn")
var score : int = 0

# Adds 1 to score variable
func add_score():
	score += 1

# Loads next level
func load_next_level(next_scene : PackedScene):
	get_tree().change_scene_to_packed(next_scene)
	
func spawn_body(Pos: Vector2):
	push_warning("in")
	var body1 = bodies.instantiate()
	add_child.call_deferred(body1)
	body1.linear_velocity = Vector2.ZERO
	body1.global_position = Pos + Vector2(0, -20)
	
