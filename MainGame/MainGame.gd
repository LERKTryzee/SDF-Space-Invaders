extends Control

export(int) var countdownMax
var currentTimer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("Game Over")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
