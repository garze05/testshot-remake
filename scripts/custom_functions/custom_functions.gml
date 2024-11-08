global.trueKey = true
global.showDebugInfo = false

// Draw weapon player
function draw_weapon()
{
	
	// Separate weapon from player
		var _xOffset = lengthdir_x(armOffsetDist, aimDir)
		var _yOffset = lengthdir_y(armOffsetDist, aimDir)

	// Flip weapon
		var _weaponYscale = 1
	// If we are looking to the left
		if aimDir > 90 && aimDir < 270 { _weaponYscale = -1 } 
	
	var frame = isShooting ? weaponImageFrame : 0;
	draw_sprite_ext( weapon.sprite, frame, x + _xOffset, centerY + _yOffset, 1, _weaponYscale, aimDir, c_white, 1 )
}

// Damage calculation
// Create event
function get_damaged_create( _hp = 1, _iFrames = false)
{
	hp = _hp;
		
	if _iFrames == true
	{
		iFrameTimer = 0
		iFrameNumber = 90 // 1 second and a half
	}
	if _iFrames == false
	{
		// Create damage list to store what has done damage to us
		damageList = ds_list_create()
	}
}
	
// Cleanup event
function get_damaged_cleanup()
{
	// We don't need this if we're using Invincibility Frames "iFrames == true"
	
	// Remove the damage list to free up memory
	ds_list_destroy(damageList)
}
	
// Step event
function get_damaged( _damageObj, _iFrames = false) 
{
		
	// Special exit for iFrame timer
	if _iFrames == true && iFrameTimer > 0
	{
		iFrameTimer--
		if iFrameTimer % 4 == 0
		{
			if image_alpha == 1 {
				image_alpha = 0			
			} else {
				image_alpha = 1
			}
		}
		image_blend = c_red
			
		exit // I don't execute any of the below until iFrames is false and iFrameTimer has finished
	}
	// Ensure that the player's state returns to normal
	
	if _iFrames == true // This would need to change, so I can affect the player's image_blend or/and alpha (for black rooms for e.g)
	{
		image_blend = c_white 
		image_alpha = 1
	}
		
	// Take damage // Plan things before, do things // 1000 and one times easier as a Game Designer
	if place_meeting( x, y, _damageObj )
	{ 
		/*
		Very similar to "place_meeting", it returns true or false,
		but it also saves the instance that collided with the object.
		In this case, we know the exact bullet or thing that damaged the enemy:
			
		var _inst = instance_place( x, y, obj_damageEnemy )
		*/

		//Getting a list of the damage instances
		var _instList = ds_list_create()
		// But with this one, we save a LIST of the instances that collided with it.
		instance_place_list( x, y, _damageObj, _instList, false )
		// Get the size of the list
		var _listSize = ds_list_size(_instList)

		// Cycle through the list
		var _hitConfirm = false
		for ( var i = 0; i < _listSize; i++)
		{
			/*
			This code is to be able to make bullets that go through the enemy,
			without having the problem of damaging them every frame, but only once
			*/

			// Get a damage object from the list
			var _inst = ds_list_find_value( _instList, i)

			// Check if "_inst" is ALREADY in the damage list
			if _iFrames == true || ds_list_find_index( damageList, _inst ) == -1 // Not found? So -1?
			{
				
			// Add the new damage instance to the damage list
			if _iFrames == false
			{
				ds_list_add( damageList, _inst )
			}

			// Take damage from that specific instance 				//show_message(_inst)
				hp -= _inst.damage
				_hitConfirm = true
				
			// Tell the damage instance to destroy itself
				_inst.hitConfirm = true
			}
		}

		// Set iFrames if they did damage to us
		if _iFrames == true && _hitConfirm == true
		{
			iFrameTimer = iFrameNumber
		}

		// Free up memory (IMPORTANT)
		ds_list_destroy(_instList)
	}

	// Clear the damage list of objects that no longer exist or are not being touched
	if _iFrames == false
	{
		var _damageListSize = ds_list_size( damageList )
		for ( var i = 0; i < _damageListSize; i++ )
		{
			// If we are no longer touching the damage instance, remove it from the list AND move the loop back 1 position
			var _inst = ds_list_find_value( damageList, i )
			
			if !instance_exists( _inst ) || !place_meeting( x, y, _inst )
			{
				ds_list_delete( damageList, i )
				i-- // To not skip entries in the damage list if one is deleted
				_damageListSize--
			}
		}
	}
}

function draw_mask()
{
	if global.showDebugInfo { draw_rectangle_color(bbox_left,bbox_top,bbox_right-1,bbox_bottom-1,c_red,c_red,c_red,c_red,true) }
}

function draw_shadow()
{
	draw_sprite_ext(spr_shadow, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	
}