var _collisions = true
var _getDamage = true

// State machine
switch ( state )
{
	// Chasing the player
	case 0:
		if instance_exists(obj_player) {
			// Obtain player's direction
			dir = point_direction(x, y, obj_player.x, obj_player.y)
		}
		
		spd = chaseSpd
	break
	// Stopped
	case 1:
		if instance_exists(obj_player) {
			// Obtain player's direction
			dir = point_direction(x, y, obj_player.x, obj_player.y)
		}
		
		spd = 0
		
		// Stop animating, manually setting the image_index
		image_index = 0
	break
	
	// Escaping the player
	case 2:	
		if instance_exists(obj_player)
		{
			_collisions = false
			dir = -point_direction(x, y, obj_player.x, obj_player.y)
		}
		spd = chaseSpd*1.2
	break
}


// Change the state
if global.enemyKillCount >= global.enemyRoomMin
{
	state = 2
}


// Getting the speeds
	xspd = lengthdir_x( spd, dir )
	yspd = lengthdir_y( spd, dir )
		
		
// Get the correct face
	if dir > 90 && dir < 270
	{
		face = -1
	}
	else
	{
		face = 1
	}
	
// Collisions
	if _collisions == true
	{
		if place_meeting( x + xspd, y, obj_wall) || place_meeting(x + xspd, y, obj_enemyParent)
		{
			xspd = 0
		}
		if place_meeting( x, y + yspd, obj_wall) || place_meeting(x, y + yspd, obj_enemyParent) 
		{
			yspd = 0
		}
	}
	// Movement
		x += xspd
		y += yspd
		
	// Dynamic depth
	depth = -y

// Inheriting code from all enemies
// Getting damage and dying
if _getDamage == true {
	event_inherited();
}