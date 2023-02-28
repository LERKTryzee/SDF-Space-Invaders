extends Control

export(int) var countdownMax
var currentTimer




func _ready():
	currentTimer = countdownMax

	while (currentTimer > 0):
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("Game Over")
	get_tree().change_scene("res://Failure-screen/Failure.tscn")
