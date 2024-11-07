if instance_exists(obj_player)
{
	if place_meeting(x,y,obj_player)
	{
		collected = true
	}
}

if collected
{
	image_alpha -= 0.1
	if image_alpha <= 0
	{
		instance_destroy()
	}
}

