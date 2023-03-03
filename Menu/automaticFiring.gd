extends CheckButton



func _ready():
	pass # Replace with function body.




func _on_automatic_firing_pressed():
	GlobalVariables.automaticFiring = pressed
	print("button pressed")
