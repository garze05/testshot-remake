// @description Usamos End Step porque es el mismo frame luego de que el player ya se movio y el juego lo esta renderizando

// Obtener el ancho y alto de la camara
var _camW = camera_get_view_width( view_camera[0] )
var _camH = camera_get_view_height( view_camera[0] )
var _camSmooth = 0.1 // Valor de suavizado del movimiento de la cam

// Adonde tiene que apuntar nuestra camara
var _targetX
var _targetY
var _camAimTreshold = 3
// Distancia desde el player hasta el mouse


// Verificar si aun existe el player
if instance_exists( obj_player )
{
	// distancia entre el jugador y el mouse
	// Direccion del aim del player
	// Entre 6, porque si. Literal. Numero magico de mierda
		len = (point_distance(obj_player.x, obj_player.centerY, mouse_x, mouse_y) / 6)
		var _offsetDir = obj_player.aimDir

	// Primero centramos la cam al player
		_targetX = (obj_player.x - _camW / 2)
		_targetY = (obj_player.centerY - _camH / 2)
	
	// Luego añadimos el offset con respecto al mouse, a partir de un treshold
	if (len > _camAimTreshold)
	{
	    _targetX += lengthdir_x(len, _offsetDir)
	    _targetY += lengthdir_y(len, _offsetDir)
	}
}

// Opcional, para que la camara no se salga del ancho y alto del room
	_targetX = clamp( _targetX, 0, room_width - _camW)
	_targetY = clamp( _targetY, 0, room_height - _camH)

	var _camX = camera_get_view_x( view_camera[0] )
	var _camY = camera_get_view_y( view_camera[0] )
	
	// Seteo final del movimiento de la cam
	_camX = lerp(_camX, _targetX, _camSmooth)
	_camY = lerp(_camY, _targetY, _camSmooth)



// Set the camera position
camera_set_view_pos( view_camera[0], _camX, _camY )

// Despues de cierta distancia en pixeles del jugador con respecto al mouse en los bordes,
// La camara con un pequenno treshold e igual usando lerp va a irse un poco mas alla
// De ese lado, moviendose para permitir ver mas