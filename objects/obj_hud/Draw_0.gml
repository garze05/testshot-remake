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

// Draw HUD info
if global.isPlaying
{
    var _playerName = global.name
    // string_digits returns only digits contained in a string
	   var _level = Text("default_level_names") + ": " +  string_digits(room_get_name(room))
    
    // This would change because we are going to add enemies that arent counted on the level
	   var _enemiesLeft = Text("default_enemies_left") + ": " + string(instance_number(obj_enemyParent))
	
    draw_left()
    draw_text_transformed( _LeftX, _TopY, _level, 0.5, 0.5, 0)
    //draw_text_transformed( _topX, _topY, _playerName, 0.5, 0.5, 0)
    
    draw_right()
    draw_text_transformed( _RightX, _TopY ,_enemiesLeft, 0.5, 0.5, 0)
    
    // Healthbar
    if hudAlpha == 1 
    {
        draw_right()
        draw_set_font(fnt_mini)
        draw_text_transformed( _LeftX + sprite_get_width(spr_healthbar), _BottomY - sprite_get_height(spr_healthbar) - 1, string(playerHp) + "/" + string(playerMaxHp), 1, 1, 0 )
        draw_sprite(spr_healthbar, playerHp, _LeftX, _BottomY)
        draw_set_font(fnt_8bit)
    }
}
