global.trueKey = true
global.showDebugInfo = false
// Dibujar Arma Player
function draw_weapon()
{
	
	// Separar arma del player
	var _xOffset = lengthdir_x(armOffsetDist, aimDir)
	var _yOffset = lengthdir_y(armOffsetDist, aimDir)

	// Voltear arma
	var _weaponYscale = 1
	if aimDir > 90 && aimDir < 270 { _weaponYscale = -1 } // Si estamos viendo a la izquierda
	
	var frame = isShooting ? weaponImageFrame : 0;
	draw_sprite_ext( weapon.sprite, frame, x + _xOffset, centerY + _yOffset, 1, _weaponYscale, aimDir, c_white, 1 )
}

// Calculo de daño
	// Create event
	function get_damaged_create( _hp = 1, _iFrames = false)
	{
		hp = _hp;
		
		if _iFrames == true
		{
			iFrameTimer = 0
			iFrameNumber = 90 // 1 segundo y medio
		}
		if _iFrames == false
		{
			// Crear la lista de daño
			damageList = ds_list_create()
		}
	}
	
	// Cleanup event
	function get_damaged_cleanup()
	{
		// No lo necesitamos si estamos usando Frames de Invencibilidad "iFrames == true"
		// Eliminar la lista de daño para liberar memoria
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
			
			exit // No me ejecute nada de lo de abajo hasta que iFrames sea false y iFrameTimer haya terminado
		}
		// Asegurarse de que el estado del player vuelva a la normalidad
		if _iFrames == true
		{
			image_blend = c_white
			image_alpha = 1
		}
		
		// Recibir daño
		// Planear las cosas antes de, hacen las cosas
		// 1000 y una veces + facil como Game Designer

		if place_meeting( x, y, _damageObj ) 
		{	/*
					Muy similar a "place_meeting", devuelve true o false, 
					pero tambien guarda la instancia que colisiono el objeto.
					En este caso, sabemos la bala o cosa exacta que le hizo daño al enemigo:
					//var _inst = instance_place( x, y, obj_damageEnemy )
				*/

				//Getting a list of the damage instances
					var _instList = ds_list_create()
				// Pero con esta, guardamos una LISTA de las instancias con las que colisionó.
					instance_place_list( x, y, _damageObj, _instList, false )
				// Obtener el tamaño de la lista
					var _listSize = ds_list_size(_instList)
		
				// Ciclar por la lista
					var _hitConfirm = false
					for ( var i = 0; i < _listSize; i++) 
					{
						/* 
						Este codigo es para poder hacer balas que atraviesen el enemy,
						sin tener el problema de que le haga daño cada frame, si no solo 1 vez
						*/
				
						// Obtener un objeto de daño de la lista
							var _inst = ds_list_find_value( _instList, i)
						
						// Verificar si "_inst" YA esta en la lista de daño
							if _iFrames == true || ds_list_find_index( damageList, _inst ) == -1 // No se encontro? Osea -1?
							{
								// Añadir la nueva instancia de daño a la lista de daño
								if _iFrames == false
								{
									ds_list_add( damageList, _inst )
								}
						
								// Take damage de esa instancia en especifico
									//show_message(_inst)
									hp -= _inst.damage
									_hitConfirm = true
								// Decirle a la instancia de daño que se destruya
									_inst.hitConfirm = true
							}
					}
					
					// Setear iFrames si nos hicieron daño
					if _iFrames == true && _hitConfirm == true
					{
						iFrameTimer = iFrameNumber
					}
		
				// Liberar la memoria (IMPORTANTE)
					ds_list_destroy(_instList)
			}

		// Limpiar la lista de daño de objetos que no existen ya o no se estan tocando
			if _iFrames == false 
			{
				var _damageListSize = ds_list_size( damageList )
				for ( var i = 0; i < _damageListSize; i++ ) 
				{
					// Si ya no estamos tocando la instancia de daño, eliminela de la lista Y ponga el ciclo atras 1 posicion
					var _inst = ds_list_find_value( damageList, i )
					if !instance_exists( _inst ) || !place_meeting( x, y, _inst )
					{
						ds_list_delete( damageList, i )
						i-- // Para no saltarse entradas de la lista de daño si se elimina alguna
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