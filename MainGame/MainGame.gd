extends Control

export(int) var countdownMax
var currentTimer





func _ready():
	currentTimer = countdownMax

	while (currentTimer > 0):
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("Game Over")
	get_tree().change_scene("res://Failure-screen/Failure.tscn")

func _process(delta):
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	print("enemy count:",get_tree().get_nodes_in_group("enemy").size())
	if get_tree().get_nodes_in_group("enemy").size() == 0:
		get_tree().change_scene("res://Win Screen/Win Screen.tscn")
