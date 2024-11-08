global.midTransition = false
global.roomTarget = -1

// Create the sequence in the room
function TransitionPlaceSequence( _type )
{
	if layer_exists( "transition" ) { layer_destroy( "transition" ) }
	var _layer = layer_create(-16000, "transition") // -16000 is the maximum depth up
	var _seq = layer_sequence_create(_layer, 0, 0, _type)
	layer_sequence_speedscale(_seq, 4) // So that this doesn't last forever
}

// Called when you want to transition from one room to another, using in/out sequences
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

// Called at a moment at the end of the "Out" transition sequence
function TransitionChangeRoom()
{
	room_goto( global.roomTarget )
}	

// Called at the moment at the end of the "In" transition sequence
function TransitionFinished()
{
	layer_sequence_destroy( self.elementID )
	global.midTransition = false
}