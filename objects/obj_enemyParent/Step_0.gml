// Take damage
get_damaged(obj_damageEnemy)
	
// Death
	if hp <= 0
	{
		// add to the total ammount of enemies killed
		global.enemyKillCount++
		global.enemyRoomTotal--
		
		// determine if we should drop an item
		// to drop other items
		var _chance = irandom(100)
		
		//if _chance < 30
		//{
		
		//}
		
		
		// the last necessary enemy drops the key
		if global.enemyKillCount == global.enemyRoomMin
		{
			instance_create_depth( x, y, depth, obj_doorKey)
		}
		
		instance_destroy()
	}