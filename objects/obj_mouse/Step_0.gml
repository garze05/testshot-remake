x = input_cursor_x();
y = input_cursor_y();

//defualt check

if (place_meeting(x, y, obj_enemyParent)) {
	image_blend = c_red;
} 
else {
	image_blend = c_white;
}

// Make the aimCroshair invicible after a certain time of inactivity
// Idk if I should keep this
/*
if (xprevious == x and !obj_player.shot) {
	invisible_Timer--;
	
	if (invisible_Timer <= 0) {
		image_alpha -= 0.05;
	}
} 
else {
	image_alpha = 1;
	invisible_Timer = invisible_Time;
}
*/