// Take damage
get_damaged(obj_damageEnemy)
	
// Death
	if hp <= 0
	{
		// add to the total ammount of enemies killed
		global.enemyKillCount++
		global.enemyRoomTotal--
		instance_destroy()
	}