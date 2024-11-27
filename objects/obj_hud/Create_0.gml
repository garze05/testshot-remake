// Make sure this shows up on top
depth = -15000

// Keep track of player's health
playerHp = 0
playerMaxHp = 0

// Keep track of player's running
playerRunTimer = 0
//playerCooldownTimer = 0
//playerRecoveryTimer = 0
playerMaxRunDuration = 0

currentView = global.camera

alphaSpd = 0.1

healthBarAlpha = 1
staminaBarAlpha = 0

// Enemy Management
// We use these to know if we already killed the necessary enemies to get the next level door key
// And to control if player is killing them all and change the game's behavior
	global.enemyRoomMin = 3 // By default 3, how many enemies we need to kill regardless
	global.enemyKillCount = 0 // How many enemies have we killed on this room
	global.enemyRoomTotal = 0 // Total number of enemies in a level, we check this to see if player is killing everything