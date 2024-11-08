// @description We use End Step because it's the same frame after the player has already moved and the game is rendering it

// Get the width and height of the camera
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);
var _camSmooth = 0.1; // Smoothing value for the cam motion

// Where our camera should point
var _targetX;
var _targetY;
var _camAimThreshold = 3; // Distance from the player to the mouse

// Check if the player still exists
if (instance_exists(obj_player)) {
    // Distance between the player and the mouse
    // Direction of the player's aim
    // Divided by 6, just because. Literally. Magic number of shit
    var len = (point_distance(obj_player.x, obj_player.centerY, mouse_x, mouse_y) / 6);
    var _offsetDir = obj_player.aimDir;

    // First we center the cam to the player
    _targetX = (obj_player.x - _camW / 2);
    _targetY = (obj_player.centerY - _camH / 2);

    // Then we add the offset with respect to the mouse, from a threshold
    if (len > _camAimThreshold) {
        _targetX += lengthdir_x(len, _offsetDir);
        _targetY += lengthdir_y(len, _offsetDir);
    }
}

// Optional, so that the camera does not go outside the width and height of the room
_targetX = clamp(_targetX, 0, room_width - _camW);
_targetY = clamp(_targetY, 0, room_height - _camH);

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

// Final setting of the cam movement
_camX = lerp(_camX, _targetX, _camSmooth);
_camY = lerp(_camY, _targetY, _camSmooth);

// Set the final camera position
camera_set_view_pos(view_camera[0], _camX, _camY);