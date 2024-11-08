// State machine
switch ( state )
{
	case 0:
		if instance_exists(obj_player) {
			//Obtener direccion player
			dir = point_direction(x, y, obj_player.x, obj_player.y)
		}
		
		spd = chaseSpd
	break
	case 1:
		if instance_exists(obj_player) {
			//Obtener direccion player
			dir = point_direction(x, y, obj_player.x, obj_player.y)
		}
		
		spd = 0
	break
}

// Chasing the player
// But first let's make sure we exist, and we're not dead

// Getting the speeds
		xspd = lengthdir_x( spd, dir )
		yspd = lengthdir_y( spd, dir )
		
		
	// Get the correct face
	if xspd > 0 { face = 1 }
	if xspd < 0 { face = -1 }
	
	// Collisions
		if place_meeting( x + xspd, y, obj_wall) || place_meeting(x + xspd, y, obj_enemyParent){
			xspd = 0
		}
		if place_meeting( x, y + yspd, obj_wall) || place_meeting(x, y + yspd, obj_enemyParent) {
			yspd = 0
		}
	
	// Movement
		x += xspd
		y += yspd
		
	// Dynamic depth
	depth = -y

// Inheriting code from all enemies
// Getting damage and dying
	event_inherited();