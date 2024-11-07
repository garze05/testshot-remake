get_damaged( obj_damageEnemy )

if hp <= 0 && image_alpha > 0
{ 

	image_alpha -= 0.1
	if image_alpha <= 0 {
		instance_destroy() 
	}
	
}