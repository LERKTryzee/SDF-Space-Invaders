extends Node

export (int) var health = 1



func reduceHealth():
	health -= 1
	if health == 0:
		GlobalVariables.Player = null
		get_tree().change_scene("res://Failure-screen/Failure.tscn")



