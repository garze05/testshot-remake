// Dibujar el arma por debajo del player

	// Animacion

draw_shadow()

if aimDir >= 0 && aimDir < 180 {
	draw_weapon()
}



// Little hack para no cambiar el xscale del sprite directamente, pero solo dibujarlo (para evitar bugs con la collision mask)
var _flip = 1
if face == 2 { _flip = -1 } else { _flip = 1;}
draw_sprite_ext( sprite_index, image_index, x, y, _flip, image_yscale, image_angle, image_blend, image_alpha)

// Dibujar el arma encima del player
if aimDir >= 180 && aimDir < 360 // Si estamos viendo a cualquier direccion que no sea arriba
{ 
	draw_weapon()
}

// Dibujar HP
//draw_text(x ,y, string(hp))

draw_mask()
