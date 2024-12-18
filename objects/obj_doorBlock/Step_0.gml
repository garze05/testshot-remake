// Truekey
if instance_exists(obj_player) && isTruekey == true
{
	if obj_player.interact && global.trueKey && place_meeting(x, y+3, obj_player)
	{
		with (obj_dontdareopeningme) {
			image_speed = 0.5
		}
	}
}

	
//if instance_exists(obj_player)
//{
//	if !instance_exists(obj_enemyParent)
//	{
//		with (obj_dontdareopeningme) {
//			image_speed = 0.5
//		}
//	}
	
// Check if animation is complete for both doors and then stop it and destroy blocking instance
with (obj_dontdareopeningme) {
	if image_index >= image_number - 1 {
	    image_speed = 0;
		if other.isTruekey
		{
		    instance_destroy();
		}
	}
}
