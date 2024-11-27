// Get cam coordinates
var _camX = camera_get_view_x( currentView )
var _camY = camera_get_view_y( currentView )
var _camW = camera_get_view_width( currentView )
var _camH = camera_get_view_height( currentView )

// Distance in pixels from room to offset all HUD elements
var _border = 8

// Default coordinates for position in screen
var _LeftX = _camX + _border
var _RightX = _camX + _camW - _border
var _TopY = _camY + _border
var _BottomY = _camY + _camH - _border
var _middleX = _camX + _camW/2
var _middleY = _camY + _camH/2

// Dynamic texts localized or gathered from globals and game systems:
	// Life count indicator, appears in top of player
		var _healthInfoText = string(playerHp) + "/" + string(playerMaxHp)
	// Name of the player (unused for now)
		var _playerName = global.name
	// How many minimun enemies that we need to kill are left
		var _minEnemiesLeft = string(global.enemyRoomMin - global.enemyKillCount)
	// "Level" text localized
	// would change depending on player's actions, by default "default_level_names"
		var _level = Text("default_level_names")
	// "Enemies Left" text localized
	// would change depending on player's actions, by default "default_enemies_left"
		var _enemiesLeft = Text("default_enemies_left")

// If the player has killed more enemies than necessary
	if _minEnemiesLeft < 0
	{
		_minEnemiesLeft = "[c_red][pulse]"+ _minEnemiesLeft
		_enemiesLeft = "[c_red][pulse]" + _enemiesLeft
	}
	else
	{
		 _minEnemiesLeft = "[c_yellow]" + _minEnemiesLeft
	}


// Player Related HUD Items
if instance_exists(obj_player)
{
    // When player gets hit (there needs to be other way using the get_damage() function somehow, like with hitConfirm
    if obj_player.hurt
    {
        _healthInfoText = "[shake][scale,0.8][c_red]"+ _healthInfoText
        _playerName = "[shake][c_red]"+ _playerName
        draw_text_scribble( obj_player.x, obj_player.centerY, "[fnt_8bit][scale,1][fa_middle][fa_center]" + _healthInfoText )
    }
    
    //// Player stamina bar
    if (playerRunTimer < 1)
    {
        staminaBarAlpha-=alphaSpd
    }
    else {
        staminaBarAlpha+=alphaSpd
    }
    
    var _staminaPercent = playerRunTimer / playerMaxRunDuration
    _staminaPercent = clamp(_staminaPercent, 0, playerMaxRunDuration)
    var _staminaImage = _staminaPercent * (sprite_get_number(spr_staminaBar) - 1)
    draw_sprite_ext(spr_staminaBar, _staminaImage, obj_player.x, obj_player.y + sprite_get_bbox_bottom(spr_shadow), 1, 1, 0, c_white, staminaBarAlpha)
	//draw_text(obj_player.x,obj_player.y, _staminaImage)
}

// Draw HUD
if global.isPlaying
{
    // Feather disable once GM1041
																	// string_digits returns only digits contained in a string
    draw_text_scribble( _LeftX, _TopY, "[fa_left][fa_middle][scale,0.6]" + _level + "[c_yellow] " +  string_digits(room_get_name(room))) // This is how we get the lvl number
    // Feather disable once GM1041
    draw_text_scribble( _RightX, _TopY ,"[fa_right][fa_middle][scale,0.6]" + _enemiesLeft + ": " + _minEnemiesLeft)
}

// Healthbar
if hudAlpha == 1 
{
    draw_sprite_ext(spr_healthbar, playerHp, _LeftX, _BottomY, 1.1, 1.1, image_angle, image_blend, image_alpha)
}


