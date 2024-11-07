// Little hack para no cambiar el xscale del sprite directamente, pero solo dibujarlo (para evitar bugs con la collision mask)
event_inherited()
draw_self()
//draw_sprite_ext( sprite_index, image_index, x, y, face, image_yscale, image_angle, image_blend, image_alpha)