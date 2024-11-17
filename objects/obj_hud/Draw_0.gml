// Get cam coordinates
var _camX = camera_get_view_x( currentView )
var _camY = camera_get_view_y( currentView )
var _camW = camera_get_view_width( currentView )
var _camH = camera_get_view_height( currentView )

// Border from room
var _border = 5

// Draw the player's hp
if global.isPlaying
{
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _level = Text("default_level_names") + ": " +  string("1")
	var _enemiesLeft = Text("default_enemies_left") + ": " + string(instance_number(obj_enemyParent)) // This would change because we are going to add enemies that arent counted on the level
	draw_text_transformed( _camX +_camW/2, _camY+_border*2, _level, 0.5, 0.5, 0)
	//draw_set_halign(fa_right)
	//draw_text_transformed( _camX +_camW - _border, _camY+_border*2, _enemiesLeft, 0.5, 0.5, 0)
	draw_text_transformed( _camX +_camW/2, _camY+_border*4, _enemiesLeft, 0.5, 0.5, 0)

}

draw_sprite_ext(spr_healthbar, playerHp , _camX + _border, _camY + _border, image_xscale, image_yscale, image_angle, image_blend, hudAlpha)