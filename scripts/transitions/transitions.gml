global.midTransition = false
global.roomTarget = -1

// Create the sequence in the room
function TransitionPlaceSequence( _type, _speed = 4, _stickToCam = false)
{
	var _x = camera_get_view_x(view_camera[0])
	var _y = camera_get_view_y(view_camera[0])
	if layer_exists( "transition" ) { layer_destroy( "transition" ) }
	var _layer = layer_create(-16000, "transition") // -16000 is the maximum depth up
	if !_stickToCam { _x = 0; _y = 0 } // For Sequences that we just want to cover the entire screen, if not when the player moves the sequence will not with the camera. It would be good to look at other solutions
	var _seq = layer_sequence_create(_layer, _x, _y, _type)
	layer_sequence_speedscale(_seq, _speed)

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