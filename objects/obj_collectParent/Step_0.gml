if instance_exists(obj_player)
{
	if place_meeting(x,y,obj_player)
	{
		collected = true
	}
}

if collected
{
	if instance_exists(objCollected)
	{
		instance_destroy(objCollected) // Not final
	}
	
	image_alpha -= 0.1
	if image_alpha <= 0
	{
		instance_destroy()
	}
}

