// Maquina de estados
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

// Perseguir al player
// Pero primero aseguremonos que existimos, y no nos hemos muerto

	
	// Obteniendo las velocidades
		xspd = lengthdir_x( spd, dir )
		yspd = lengthdir_y( spd, dir )
		
		
	// Get the correct face
	if xspd > 0 { face = 1 }
	if xspd < 0 { face = -1 }
	
	// Colisiones
		if place_meeting( x + xspd, y, obj_wall) || place_meeting(x + xspd, y, obj_enemyParent){
			xspd = 0
		}
		if place_meeting( x, y + yspd, obj_wall) || place_meeting(x, y + yspd, obj_enemyParent) {
			yspd = 0
		}
	
	// Moverse
		x += xspd
		y += yspd
	// Setear Profundidad
	depth = -y

// Herencia del codigo de todos los enemigos
	// Getting damage and dying
	event_inherited();