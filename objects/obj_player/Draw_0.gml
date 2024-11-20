
var _showDebug = global.showDebugInfo

// Draw a basic shadow
draw_shadow()

// Draw weapon behind the player
if aimDir >= 0 && aimDir < 180 {
	draw_weapon()
}

// Little hack to not change the sprite's xscale directly, but just draw it (to avoid bugs with the collision mask)
var _flip = 1
if face == 2 { _flip = -1 } else { _flip = 1; }
draw_sprite_ext( sprite_index, image_index, x, y, _flip, image_yscale, image_angle, image_blend, image_alpha)

// Draw weapon in front of player
if aimDir >= 180 && aimDir < 360 // If we are looking in any direction other than up
{ 
	draw_weapon()
}

// Draw debug hp
if _showDebug {
	draw_text_scribble(x ,y, string(hp))
}

// By default this draw_mask function will only work with global.showDebugInfo set to true
draw_mask()

/*

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_transformed(x, y-sprite_height - 4, playerName, 0.4, 0.4, 0)

*/