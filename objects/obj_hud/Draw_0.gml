// Get cam coordinates
var _camX = camera_get_view_x( currentView )
var _camY = camera_get_view_y( currentView )
var _camW = camera_get_view_width( currentView )
var _camH = camera_get_view_height( currentView )

// Distance in pixels from room to offset all HUD elements
var _border = 8

var _LeftX = _camX + _border
var _RightX = _camX + _camW - _border
var _TopY = _camY + _border
var _BottomY = _camY + _camH - _border
var _middleX = _camX + _camW/2
var _middleY = _camY + _camH/2

var _healthInfoText = string(playerHp) + "/" + string(playerMaxHp)
var _playerName = global.name
// string_digits returns only digits contained in a string
var _level = Text("default_level_names") + "[c_yellow] " +  string_digits(room_get_name(room))
// This would change because we are going to add enemies that arent counted on the level
var _enemiesLeft = Text("default_enemies_left") + ": [c_yellow]" + string(instance_number(obj_enemyParent))

// Player Related HUD Items
if instance_exists(obj_player)
{
    // When player gets hit (there needs to be other way using the get_damage() function somehow, like with hitConfirm
    if obj_player.hurt
    {
        _healthInfoText = "[shake][scale,0.8][c_red]"+_healthInfoText
        _playerName = "[shake][c_red]"+_playerName
        draw_text_scribble(obj_player.x,obj_player.centerY,"[scale,1][fa_middle][fa_center]" + _healthInfoText)
    }
    
    // Player stamina bar
    if (obj_player.runTimer >= obj_player.runNum)
    {
        staminaBarAlpha-=alphaSpd
    }
    else {
        staminaBarAlpha+=alphaSpd
    }
    
    var _staminaPercent = obj_player.runTimer / obj_player.runNum
    _staminaPercent = clamp(_staminaPercent, 0, obj_player.runNum)
    var _staminaImage = _staminaPercent * (sprite_get_number(spr_staminaBar) - 1)
    draw_sprite_ext(spr_staminaBar, _staminaImage, obj_player.x, obj_player.y + sprite_get_bbox_bottom(spr_shadow), 1, 1, 0, c_white, staminaBarAlpha)
}

// Draw HUD
if global.isPlaying
{
    draw_left()
    // Feather disable once GM1041
    draw_text_scribble( _LeftX, _TopY, "[scale,0.5]" + _level)
    //draw_text_transformed( _topX, _topY, _playerName, 0.5, 0.5, 0)
    
    draw_right()
    // Feather disable once GM1041
    draw_text_scribble( _RightX, _TopY ,"[scale,0.5]" +_enemiesLeft)
}


// Healthbar
if hudAlpha == 1 
{
    draw_sprite_ext(spr_healthbar, playerHp, _LeftX, _BottomY, 1.1, 1.1, image_angle, image_blend, image_alpha)
}


