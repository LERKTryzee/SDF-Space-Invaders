extends KinematicBody2D

var speed = 500
var bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)


func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, +speed*delta*0.4))
	if (collidedObject):
		#print("Enemy collide: ",collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:
			pass
			#collidedObject.get_collider().queue_free() #Don't kill the enemies.
		else:
				GlobalVariables.enemyBulletInstanceCount -= 1
				if "Player" in collidedObject.collider.name:
					collidedObject.collider.reduceHealth()
				if "Vault" in collidedObject.collider.name:
					collidedObject.collider.reduceHealth()
				queue_free()


