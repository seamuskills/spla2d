vsp += obj_player.grav /2

x += hsp;
y += vsp;
if place_meeting(x+hsp,y+vsp,obj_wall){
	wall = instance_place(x+hsp,y+vsp,obj_wall)
	if wall.object_index != obj_grate{
		if (y-5) < (wall.y - 7){
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
				if not place_meeting(x,y-1,obj_wall){
					up = true
					up_color = c_purple
				}
			}
        }
    }
ds_list_destroy(_list);
if damage > 3.5{
	damage -= 0.016129032258065 * ogdamage
}