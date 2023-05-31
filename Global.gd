extends Node

var bulletInstanceCount = 0
var enemyBulletInstanceCount = 0
var automaticFiring = false
var max_lives = 3
var lives = max_lives


var scoringInformation = {
	"currentScore": 0,
	"currentPlayer": "User",
	"highScore": 0,
	"highScorePlayersName" : "Winner"
}
var saveFile = "user://save.dat"
var Player
