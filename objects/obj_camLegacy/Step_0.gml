if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x)/25;
y += (yTo - y)/25;

camera_set_view_pos(
	view_camera[0],
	floor(x-(camWidth*0.5)),
	floor(y-(camHeight*0.5))
	);
	
