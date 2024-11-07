// Input
	left = 0
	right = 0
	up = 0
	down = 0
	run = 0
	shot = 0
	swapKey = 0
	interact = 0

// Movimiento
	moveDir = 0 //360
	wlkSpd = 1
	runSpd = wlkSpd + 0.3
	moveSpd = wlkSpd
	xspd = 0
	yspd = 0

// Setupear Daño y Vida
	get_damaged_create(3, true)

// Sprite Control
	centerYOffset = -4
	centerY = y + centerYOffset

	armOffsetDist = 8 // Numero de pixeles donde el arma deberia estar separado del player
	aimDir = 0

	face = 3 // Direccion por defecto del player (A la derecha)
	
	spriteWalk[0] = spr_playerSideWalk // Derecha, el [2] es izquierda pero volteamos el sprite
	spriteWalk[1] = spr_playerUpWalk // Arriba
	spriteWalk[2] = spriteWalk[0] // Izquierda, igual que derecha
	spriteWalk[3] = spr_playerDownWalk // Abajo
	
	spriteIdle[0] = spr_playerSideIdle
	spriteIdle[1] = spr_playerUpIdle
	spriteIdle[2] = spriteIdle[0] // Izquierda, Igual que derecha
	spriteIdle[3] = spr_playerDownIdle

	mask_index = spr_playerDownIdle
	estado = "idle" // Esto es solo para controlar que animacion usar, por eso no lo uso para disparar, y en su lugar uso la variable "isShooting"
	
// Info del arma
	shootTimer = 0
	weaponImageFrame = 0
	isShooting = false
	
	// Añadir armas al inventario del player
	array_push( global.PlayerWeapons, global.Weapons.normalBow ) // "array_push" Agregar valor al final de un array facilmente (kinda like pilas). Se pueden agregar n cantidad de cosas despues de cada coma
	array_push( global.PlayerWeapons, global.Weapons.fastBow )
	
	selectedWeapon = 0
	weapon = global.PlayerWeapons[selectedWeapon]
	
