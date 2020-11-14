function sc_plrhcollision() {
		if place_meeting(x+vsp,y,obj_wall){
			while not place_meeting(x+sign(hsp),y,obj_wall){
				x+=sign(hsp)
			}
		}
		if place_meeting(x+vsp,y,obj_wall){
			while not place_meeting(x+sign(hsp),y,obj_wall){
				x += sign(hsp)
			}
		}
		//swimming up walls right
		if hsp > 0{
			if instance_place(x+sign(hsp),y,obj_wall).left and instance_place(x+sign(hsp),y,obj_wall).left_color=color and squid{
				vsp = jump_force
				in_ink=1
				swimming = true
			}
		}
		//swimming up walls left
		if hsp < 0{
			if instance_place(x+sign(hsp),y,obj_wall).right and instance_place(x+sign(hsp),y,obj_wall).right_color=color and squid{
				vsp = jump_force
				in_ink=1
				swimming = true
			}
		}
		hsp = 0


}
