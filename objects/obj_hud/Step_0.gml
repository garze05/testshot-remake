// Get the player's hp info
if instance_exists(obj_player)
{
	playerHp = obj_player.hp
	playerMaxHp = obj_player.maxHp
	playerRunTimer = obj_player.runTimer
	playerMaxRunDuration = obj_player.runDuration
} else
{
	playerHp = 0
}

show_debug_message(global.enemyRoomTotal)