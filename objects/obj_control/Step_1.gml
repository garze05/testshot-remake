var _currentRoom = room
var _targetRoom = room_next(_currentRoom)

// Game state control for Game Over
if global.gameOver && global.isPlaying
{
	
    // Get the sequence and tracks
    var _seq = sequence_get(transitionGameOver);
	var _tracks = _seq.tracks
	
	// Save the localized texts in variables. Between () we use the key reference to the localized text
	var _youDiedText = Text("default_gameover_title");
	var _pressShootToContinueText = Text("default_gameover_presstocontinue");

	for (var i = 0; i < array_length(_tracks); i++)
	{
		// Search for any text tracks
		if _tracks[i].type == seqtracktype_text
		{
			// Change the text to the corresponding translation
			// Make sure to rename the text tracks to the keys that we are using on the .csv file
			_tracks[i].keyframes[0].channels[0].text = Text(_tracks[i].name)
		}
	}
	TransitionPlaceSequence(transitionGameOver, 1, true)
	global.isPlaying = false
}
else if global.gameOver
{
	var _shootKey = global.shootKey
	if gameOverSequenceEnded && _shootKey
	{
		global.gameOver = false
		gameOverSequenceEnded = false
		global.isPlaying = true
		room_restart()
	}
}

// Code to open the doors to next level
// For now we just advance to next room when all enemies die
	if global.isPlaying
	{
		if !instance_exists(obj_enemyParent)
		{
			if _targetRoom > 0
			{
				TransitionStart( _targetRoom, transitionOut, transitionIn )
			}
		}
	}

// DebugTools
if keyboard_check_pressed( vk_tab )
{
	global.showDebugInfo = !global.showDebugInfo
	show_debug_overlay(global.showDebugInfo)
}

// To test levels
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


// TODO: Install Extension to fix drag window, ghost input bug