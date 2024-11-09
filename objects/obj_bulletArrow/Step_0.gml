// Get movement components

xspd = lengthdir_x( spd, dir )
yspd = lengthdir_y( spd, dir )

// Movement
x += xspd
y += yspd

// Cleanup
	// Hit Confirm Destroy
	if hitConfirm == true && throughEnemy == false { destroy = true }
	
	// Destroy
	if destroy == true {
		// Here we will code the destruction VFX of any object that uses the destroy and hitConfirm system
		instance_destroy()
	}
	
	// Unlike the player, we will check if we collide AFTER we have moved
	// This is why we put the code after the moving bit
	if place_meeting( x, y, obj_solidWall ) 
	{ 
		destroy = true 
	}
	
	// Bullet out of range
	// xstart and ystart are the initial x and y positions when creating the instance in the room
	if point_distance( xstart, ystart, x , y) > maxDist {
		destroy = true
	}

// Final image_yscale setup
image_yscale = dir > 90 && dir < 270 ? -1 : 1 