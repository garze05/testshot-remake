global.midTransition = false
global.roomTarget = -1

// Crea la secuencia en la room
function TransitionPlaceSequence( _type )
{
	if layer_exists( "transition" ) { layer_destroy( "transition" ) }
	var _layer = layer_create(-16000, "transition") // -16000 es la depth maxima para arriba
	var _seq = layer_sequence_create(_layer, 0, 0, _type)
	layer_sequence_speedscale(_seq, 4) // Para que no dure una eternidad
}

// Se llama cuando se quiere transicionar de una room a otra, usando secuencias de in/out
function TransitionStart( _roomTarget, _typeOut, _typeIn )
{
	if !global.midTransition
	{
		global.midTransition = true
		global.roomTarget = _roomTarget
		TransitionPlaceSequence( _typeOut )
		layer_set_target_room( _roomTarget )
		TransitionPlaceSequence( _typeIn )
		layer_reset_target_room()
		return true
	}
	else return false
}

// Se llama en un momento al final de la secuencia de transicion "Out"
function TransitionChangeRoom()
{
	room_goto( global.roomTarget )
}	

// Se llama al momento al final de la secuencia de transicion "In"
function TransitionFinished()
{
	layer_sequence_destroy( self.elementID )
	global.midTransition = false
}