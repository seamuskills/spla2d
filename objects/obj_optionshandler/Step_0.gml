/// @description Insert description here
// You can write your code in this editor
if not pause{
	if not instances_active{
		instance_activate_all()
		with btn_menu{
			instance_destroy()
		}
		with btn_quit{
			if room != menu{
				instance_destroy()
			}
		}
		instances_active = true
	}
	if hc{
		lc = 1
	}else{
		lc = 5
	}
	if instance_exists(obj_player){
		if obj_player.lc = -1{
			obj_player.lc = lc
		}
	}
	if room != menu{
		if room > lu{
			lu = room
		}
	}
}else{
	if instances_active = true{
		instance_create_layer(obj_camera.x,obj_camera.y-32,layer,btn_menu)
		instance_create_layer(obj_camera.x,obj_camera.y+32,layer,btn_quit)
		instance_deactivate_all(true)
		instance_activate_object(btn_menu)
		instance_activate_object(btn_quit)
		instances_active = false
	}
}
if room = menu and sc != 0{
	sc = 0
}
if gp and gamepad_button_check_released(0,gp_start){
	if room != menu{
		pause = !pause
	}
}