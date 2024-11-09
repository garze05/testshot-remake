// Little hack to not change the sprite's xscale directly, but just draw it (to avoid bugs with the collision mask)
event_inherited()
draw_sprite_ext( sprite_index, image_index, x, y, image_xscale * face, image_yscale, image_angle, image_blend, image_alpha)