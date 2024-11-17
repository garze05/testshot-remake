// Initial configuration for the game
window_set_size(1280, 720)

		//audio_play_sound(snd_bgplaceholder, 0, 1)
		
// This would be false because at the start we are going to be on menus
	global.isPlaying = true
	
global.gameOver = false

// Sequence variables
transitionIn = sq_fadeIn
transitionOut = sq_fadeOut
transitionGameOver = sq_gameOver
gameOverSequenceEnded = false

//gamepad_force_focus()