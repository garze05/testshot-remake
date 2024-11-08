// template constructor for weapons
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