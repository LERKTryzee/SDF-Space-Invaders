extends KinematicBody2D

var movement_speed = 200
var bulletSource = preload("res://Bullet/Bullet.tscn")
export (int) var health = 3

func _ready():
	set_process(true)
	set_physics_process(true)
	GlobalVariables.Player = self

func _process(delta):
	if GlobalVariables.automaticFiring:
		if Input.is_action_pressed("fire"):
			var bulletInstance = bulletSource.instance()
			bulletInstance.position = Vector2(position.x, position.y-20)
			get_tree().get_root().add_child(bulletInstance)
	else:
		if Input.is_action_just_pressed("fire"):
			var bulletInstance = bulletSource.instance()
			bulletInstance.position = Vector2(position.x, position.y-20)
			get_tree().get_root().add_child(bulletInstance)
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		if position.x > 10:
			move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		if position.x < 1230:
			move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_down"):
		if position.y > 10:
			move_and_collide(Vector2(0, movement_speed * delta))
	if Input.is_action_pressed("ui_up"):
		if position.y <1230:
			move_and_collide(Vector2(0, -movement_speed * delta))

func reduceHealth():
	health -= 1
	if health == 0:
		GlobalVariables.Player = null
		get_tree().change_scene("res://Failure-screen/Failure.tscn")
