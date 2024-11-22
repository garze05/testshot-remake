// template constructor for weapons
/// @desc Weapon Creation struct
/// @param {Asset.GMSprite} _sprite Sprite for the weapon
/// @param {Real} _weaponLenght Where this weapon would shoot its bullets from. Offset in pixels
/// @param {Asset.GMObject} _bulletObj Which object would be used for the bullets of this weapon
/// @param {Real} _cooldown How much time in frames until this weapon can shoot again
/// @param {bool} [_automatic]=false Controls wherever this weapon shoot is automatic or single bullet
function create_weapon( _sprite, _weaponLenght, _bulletObj, _cooldown, _automatic = false) constructor
{
	sprite = _sprite;
	length = _weaponLenght;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	auto = _automatic;
}

// Player's weapons inventory
global.PlayerWeapons = array_create(0)

// Weapons list
global.Weapons = {
	revolver : new create_weapon(
		spr_gun,
		sprite_get_bbox_right( spr_gun ) - sprite_get_xoffset( spr_gun ), 
		obj_bullet,
		20,
		true
	),
	normalBow : new create_weapon(
		spr_bowNormal, 
		sprite_get_bbox_right( spr_bowNormal ) - sprite_get_xoffset( spr_bowNormal ), 
		obj_bulletArrow, 
		15,
		false
	),

	fastBow : new create_weapon(
		spr_bowFast, 
		sprite_get_bbox_right( spr_bowFast ) - sprite_get_xoffset( spr_bowFast ), 
		obj_fireBulletArrow, 
		9,
		true
	)
}