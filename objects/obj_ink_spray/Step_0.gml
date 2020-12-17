vsp += obj_player.grav /2

x += hsp;
y += vsp;
if place_meeting(x+hsp,y+vsp,obj_wall){
	wall = instance_place(x+hsp,y+vsp,obj_wall)
	if wall.object_index != obj_grate{
		if wall.inkable = true{
		if (y-5) < (wall.y - 7){
			if wall.up_color != image_blend{
				with wall{
					if not place_meeting(x,y-1,obj_wall){
						sc_addscore(10)
					}
				}
			}
			wall.up = true
			wall.up_color = image_blend
		}
		if (y+3) > (wall.y + 8){
			wall.down = true
			wall.down_color = image_blend
		}
		if (x-5) > wall.x{
			wall.right = true
			wall.right_color = image_blend
		}
		if (x+3) < wall.x{
			wall.left = true
			wall.left_color = image_blend
		}
		}
		if wall.object_index = obj_glass{
			effect_create_below(ef_smoke,x,y,0.5,image_blend)
		}
		instance_destroy()
	}
}
var _list = ds_list_create();
var _num = collision_line_list(x, y, x, y+(4*16), obj_wall, false, true, _list, false);
if _num > 0
    {
    for (var i = 0; i < _num; ++i;)
        {
			with _list[| i]{
				if not place_meeting(x,y-1,obj_wall) and not place_meeting(x,y-1,obj_water) and object_index = obj_wall{
					up = true
					wall = _list[| i]
					if wall.up_color != other.image_blend{
						with wall{
							sc_addscore(10)
						}
					}
					up_color = obj_player.color
				}
			}
        }
    }
ds_list_destroy(_list);
if damage > 3.5{
	damage -= 0.016129032258065 * ogdamage
}
//something=(floor(damage/ogdamage*100)) / 90