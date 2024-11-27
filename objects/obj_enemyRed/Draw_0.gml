// Little hack to not change the sprite's xscale directly, but just draw it (to avoid bugs with the collision mask)
event_inherited()
draw_shadow()
draw_sprite_ext( sprite_index, image_index, x, y, image_xscale * face, image_yscale, image_angle, image_blend, image_alpha)

// Draw HP
var _healthPercent = hp / maxHp
var _hpImage = _healthPercent * (sprite_get_number(spr_enemyHealthBar) - 1)
draw_sprite(spr_enemyHealthBar, _hpImage, x, y-sprite_height - 2)

var _escapingText = Text("default_enemies_escaping")

if state == 2
{
	t+=0.5
	draw_text_scribble(x,y,"[fa_center][rainbow][wobble][scale,0.5] " + _escapingText,t)
}