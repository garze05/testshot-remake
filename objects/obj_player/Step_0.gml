// Get Input
left = keyboard_check(ord( "A" ))
right = keyboard_check(ord( "D" ))
up = keyboard_check(ord( "W" ))
down = keyboard_check(ord( "S" ))
	
run = keyboard_check( vk_shift )
shot = mouse_check_button( mb_left )
swapKey = mouse_wheel_down() or mouse_wheel_up()
interact = keyboard_check_pressed(ord( "E" ))

if shot && weapon.auto == false { mouse_clear(shot) } // !! Esto no sirve en mac, solo se que sirve en Windows

moveSpd = run ? runSpd : wlkSpd; // Alternar velocidad entre caminar y correr

// Movimiento Player
#region
	// Obtener direccion
	var _xaxis =  right - left
	var _yaxis = down - up
	moveDir = point_direction(0, 0, _xaxis, _yaxis)
	
	var _spd = 0
	
	var _axis = point_distance(0, 0, _xaxis, _yaxis)
	_axis = clamp (_axis, 0, 1) // Normalizar, evitar ir mas rapido en diagonales
	_spd = moveSpd * _axis
	
	// Obtener las velocidades de x y y (para solo movernos cuando presionamos las teclas)
	// Ej. Si presiono arriba, mi direccion es 90 grados (osea -1 en el axis y) y mi spd es -1, ya sabemos que nuestra velocidad y es -1
	xspd = lengthdir_x(_spd, moveDir)
	yspd = lengthdir_y(_spd, moveDir)
	
	// place_meeting es una prediccion, si yo le añadiera a mi x/y la velocidad en este momento, estoy colisionando contra obj_wall?
	if place_meeting(x + xspd, y, obj_wall){
		xspd = 0
	}
	if place_meeting(x, y + yspd, obj_wall) {
		yspd = 0
	}
	
	// Si nos estamos moviendo
	if xspd != 0 or yspd != 0 {
		estado = "walk"
	} else { estado = "idle" }
	
	// Mover jugador
	x += xspd
	y += yspd
	// Profundidad de dibujado
	depth = -bbox_bottom; // Entre mas abajo, mas cerca de la camara, y viceversa
#endregion

// Tomar daño
get_damaged( obj_damagePlayer, true )

// Sprite Control
#region	
	// Player Aiming
		centerY = y + centerYOffset
		aimDir = point_direction(x, centerY, mouse_x, mouse_y)
	
	// Asegurarse que el player este viendo a la direccion correcta
		face = round( aimDir / 90 ) // Entre 90 porque estamos usando 4 direcciones rectas, si fueran 8 seria entre 45
		if face == 4 { face = 0 }
	// Setear estados
		// Control de animación del arma
		if isShooting {
		    weaponImageFrame += 0.5; // Ajusta la velocidad de la animación si es necesario
		    if weaponImageFrame >= sprite_get_number( weapon.sprite ) {
		        weaponImageFrame = 0;
				isShooting = false
		    }
		}
	
	var _spriteToUse = sprite_index
	
	// Setear Sprite final, animaciones con el estado
	if estado == "idle" {
		_spriteToUse = spriteIdle
	} else {
		_spriteToUse = spriteWalk
	}
	image_speed = moveSpd
	sprite_index = _spriteToUse[face]
#endregion

// Weapon Swapping
#region
var _playerWeapons = global.PlayerWeapons // Hacemos una variable local de la global pq es mas eficiente para GameMaker trabajar con variables locales
	// Cycle through weapons
	if swapKey
	{
		// Cambiar la seleccion y ciclar(Importante)
		selectedWeapon++
		if selectedWeapon >= array_length(_playerWeapons) { selectedWeapon = 0 }
		
		// Setear nueva arma
		weapon = _playerWeapons[selectedWeapon]
	}
#endregion

// Disparar Arma
#region
	// Si estamos en media transicion no podemos disparar
	if !global.midTransition
	{
		if shootTimer > 0 { shootTimer -- }

		if shot && shootTimer <= 0 && !isShooting
		{
			weaponImageFrame = 0 // Reinicia el cuadro de la animación
			isShooting = true
		
			// Reiniciar Timer
			shootTimer = weapon.cooldown
			var _xOffset = lengthdir_x( weapon.length + armOffsetDist, aimDir )
			var _yOffset = lengthdir_y( weapon.length + armOffsetDist, aimDir )
		
			// Actual shooting
				// Creando la bala
				var _bulletInstance = instance_create_depth( x + _xOffset , centerY + _yOffset, depth+100, weapon.bulletObj)
		
				// Cambiar direccion de la bala
				with (_bulletInstance) // Con "with" vamos dentro de la instancia, este codigo se escribe como si fueramos la bala
				{ 
					dir = other.aimDir //"other" salimos de la instancia actual de "with" y volvemos a la original, en este caso player
			
				}
		}
	}
#endregion