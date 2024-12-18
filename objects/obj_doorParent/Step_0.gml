// Know if I have to reproduce my opening anim
if instance_exists( obj_player ) && instance_exists(obj_doorKey)
{
	var _dist = point_distance(x,y,obj_player.x,obj_player.y)
	if _dist <= radius && obj_player.interact && obj_doorKey.collected
	{
		instance_destroy(doorBlock)
	}
}