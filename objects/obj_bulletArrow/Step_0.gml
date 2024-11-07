// Mover

xspd = lengthdir_x( spd, dir )
yspd = lengthdir_y( spd, dir )

x += xspd
y += yspd

// Cleanup
	// Hit Confirm Destroy
	if hitConfirm == true && throughEnemy == false { destroy = true }
	
	// Destroy
	if destroy == true {
		// Visual de destruccion
		instance_destroy()
	}
	
	// A diferencia del player, vamos a verificar si colisionamos DESPUES de habernos movido
	if place_meeting( x, y, obj_solidWall ) 
	{ 
		destroy = true 
	}
	
	// Bullet out of range
	// xstart y ystart son las posiciones x y y iniciales al crear la instancia en el room
	if point_distance( xstart, ystart, x , y) > maxDist {
		destroy = true
	}
	
image_yscale = dir > 90 && dir < 270 ? -1 : 1 