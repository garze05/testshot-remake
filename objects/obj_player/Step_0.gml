// Get Input (Now we are using Inpu 8.0)
left = input_check("left")
right = input_check("right")
up = input_check("up")
down = input_check("down")
	
run = input_check("run")
shot = input_check("shoot")
swapKey = input_check_pressed("swap")
interact = input_check_pressed("action")

// Hack to make weapons 1 bullet click
if shot && weapon.auto == false { mouse_clear(shot) } // !! This does not work on mac for some reason

moveSpd = run ? runSpd : wlkSpd; // Alternate between running and walking spds

// Player Movement
#region
	// Get direction for the moving player
	var _xaxis =  right - left
	var _yaxis = down - up
	moveDir = point_direction(0, 0, _xaxis, _yaxis)
	
	var _spd = 0
	
	// Get general input direction (E.g. right = 1, left = -1)
	var _axis = point_distance(0, 0, _xaxis, _yaxis)
	
	_axis = clamp (_axis, 0, 1) // Normalizing, we dont wanna go faster in diagonals
	_spd = moveSpd * _axis 	// Get the general speed
	
	// Get the x and y velocities (to only move when we press the keys)
	xspd = lengthdir_x(_spd, moveDir)
	yspd = lengthdir_y(_spd, moveDir)
	
	// place_meeting is a prediction, if I added my x/y velocity right now, am I colliding with obj_wall?
	if place_meeting(x + xspd, y, obj_wall){
		xspd = 0
	}
	if place_meeting(x, y + yspd, obj_wall) {
		yspd = 0
	}
	
	// State machines for animations
		// If we are getting any input on the keyboard for movement
		if xspd != 0 or yspd != 0 {
			state = "walk"
		} else { state = "idle" }
	
	// Move player
	x += xspd
	y += yspd
	
	// Dynamic draw depth
	depth = -bbox_bottom; // The lower, the closer to the camera, and vice versa
#endregion

// Take damage
get_damaged( obj_damagePlayer, true )

// Sprite Control
#region	
	// Player Aiming
		centerY = y + centerYOffset
		//aimDir = point_direction(x, centerY, mouse_x, mouse_y)
			input_cursor_speed_set(3) // Would be part of the config
		aimDir = point_direction(x, centerY, input_cursor_x(), input_cursor_y())
	
	// Making sure the player is facing the right direction
		face = round( aimDir / 90 ) // Dividing by 90 because we are using 4 straight directions, if there were 8 it would be between 45
		if face == 4 { face = 0 }
	// States setup for weapon animations
		if isShooting {
			var _weaponAnimSpd = 0.5
		    weaponImageFrame += _weaponAnimSpd; // Adjust the speed of the animation if necessary
		    if weaponImageFrame >= sprite_get_number( weapon.sprite ) {
		        weaponImageFrame = 0;
				isShooting = false
		    }
		}
	
	var _spriteToUse = sprite_index
	
	// Final sprite setup, controlled by "state"
	if state == "idle" {
		_spriteToUse = spriteIdle
	} else {
		_spriteToUse = spriteWalk
	}
	
	image_speed = moveSpd
	sprite_index = _spriteToUse[face]
#endregion

// Weapon Swapping
#region
var _playerWeapons = global.PlayerWeapons // We make a local variable out of the global one because it is more efficient for GameMaker to work with local variables
	// Cycle through weapons
	if swapKey
	{
		// Change the selection and cycle (Important)
		selectedWeapon++
		if selectedWeapon >= array_length(_playerWeapons) { selectedWeapon = 0 }
		
		// Setup new weapon
		weapon = _playerWeapons[selectedWeapon]
	}
#endregion

// Shooting Weapon
#region
	// If we are in mid-transition between rooms we cannot shoot
	// This will probably be changed, is a little annoying
	if !global.midTransition
	{
		if shootTimer > 0 { shootTimer -- }

		if shot && shootTimer <= 0 && !isShooting
		{
			weaponImageFrame = 0 // Reset the animation frame
			isShooting = true
		
			// Restart Timer
			shootTimer = weapon.cooldown
			var _xOffset = lengthdir_x( weapon.length + armOffsetDist, aimDir )
			var _yOffset = lengthdir_y( weapon.length + armOffsetDist, aimDir )
		
			// Actual shooting
				// Creating the bullet
				var _bulletInstance = instance_create_depth( x + _xOffset , centerY + _yOffset, depth+100, weapon.bulletObj)
		
				// Change bullet direction
				with (_bulletInstance) // With "with" we go inside the instance, this code is written as if we were the bullet
				{ 
					dir = other.aimDir //"other" means we leave the current instance of "with" and return to the original, in this case obj_player
			
				}
		}
	}
#endregion

// death / game over
if hp <= 0
{
	TransitionPlaceSequence(sq_gameOver, 1, true)
	instance_destroy()
}