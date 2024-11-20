// Player Info
playerName = global.name

// Input
	left = 0
	right = 0
	up = 0
	down = 0
	runKey = 0
	shot = 0
	swapKey = 0
	interact = 0

// Movement
	moveDir = 0 //360
	wlkSpd = 0.8

    // Running (this isnt the best system, but its what i came up with for now. Would like to look a tutorial later)
    // stamina mechanic  
        canRun = false
        running = false
        runNum = 150
        runTimer = runNum
        runCooldown = 50
        runCooldownTimer = runCooldown
    runSpd = wlkSpd + 0.3

	moveSpd = wlkSpd
	xspd = 0
	yspd = 0



// Damage and Health Setup
	get_damaged_create(3, true)
    hurt = false

// Sprite Control
	centerYOffset = -4
	centerY = y + centerYOffset

	armOffsetDist = 8 // Number of pixels the weapon should be separated from the player
	aimDir = 0

	face = 3 // Default direction of the player (Right)

	spriteWalk[0] = spr_playerSideWalk // Right, the [2] is left but we flip the sprite
	spriteWalk[1] = spr_playerUpWalk // Up
	spriteWalk[2] = spriteWalk[0] // Left, same as right
	spriteWalk[3] = spr_playerDownWalk // Down

	spriteIdle[0] = spr_playerSideIdle
	spriteIdle[1] = spr_playerUpIdle
	spriteIdle[2] = spriteIdle[0] // Left, Same as right
	spriteIdle[3] = spr_playerDownIdle

	mask_index = spr_playerDownIdle
	state = "idle" // This is just to control which animation to use, that's why I don't use it for shooting, and instead use the "isShooting" variable
	
// Weapon Info
	shootTimer = 0
	weaponImageFrame = 0
	isShooting = false
	
	// Add weapons to player inventory
	array_push( global.PlayerWeapons, global.Weapons.normalBow ) // "array_push" Add value to the end of an array easily (kind of like stacks). You can add n amount of things after each comma
	array_push( global.PlayerWeapons, global.Weapons.fastBow )
	
	selectedWeapon = 0
	weapon = global.PlayerWeapons[selectedWeapon]
