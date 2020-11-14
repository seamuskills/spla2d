function sc_plrgroundcheck(argument0) {
	with argument0{
		var grounded = true
		squid_jumping=false
		if instance_place(x,y+1,obj_wall).up_color = color and instance_place(x,y+1,obj_wall).up = true{
			in_ink = 1
		}
		if instance_place(x,y+1,obj_wall).up = false{
			in_ink = 0
		}
		if instance_place(x,y+1,obj_wall).up = true and instance_place(x,y+1,obj_wall).up_color != color{
			in_ink=-1
		}
	}


}
