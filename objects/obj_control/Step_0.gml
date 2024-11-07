var _currentRoom = room
var _targetRoom = room_next(_currentRoom)

if global.isPlaying
{
	if !instance_exists(obj_enemyParent)
	{
		if _targetRoom > 0
		{
			TransitionStart( _targetRoom, sq_fadeOut, sq_fadeIn )
		}
	}
}

// DebugTools
if keyboard_check_pressed( vk_tab )
{
	global.showDebugInfo = !global.showDebugInfo
	show_debug_overlay(global.showDebugInfo)
}

// Para probar niveles
if global.showDebugInfo
{
	if keyboard_check_pressed( vk_enter )
	{
		if instance_exists(obj_enemyParent)
		{
			instance_destroy(obj_enemyParent)
		}
	}
}



// Solucionar bug de foco y input
/*
if (!window_has_focus()) {
    // Si la ventana no tiene el foco, reseteamos el estado de los inputs
	io_clear()
}