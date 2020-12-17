/// @description Insert description here
// You can write your code in this editor
if dead = false{ //make sure your not dead
// inputs and vars
var left = keyboard_check(ord(obj_optionshandler.mctrl[1]))
var right = keyboard_check(ord(obj_optionshandler.mctrl[2]))
var jump = keyboard_check(ord(obj_optionshandler.mctrl[0]))
var squidkey=keyboard_check(vk_shift)
swimming = false
var bomb = keyboard_check(ord(obj_optionshandler.auxctrl[1]))
if squidkey{
	image_yscale=0.5
	squid = true
}else{
	if not place_meeting(x,y-16,obj_wall) and squid{
		squid = false
		image_yscale=1
		image_alpha=1
		while place_meeting(x,y,obj_wall){
			y-= 1
		}
	}
}

if not jump{
	jump = keyboard_check(vk_space)
}
var move = right - left
//vertical grounding
if place_meeting(x,y+1,obj_wall) or (place_meeting(x,y+1,obj_grate) and not squid){
		var grounded = true
		squid_jumping=false
		if place_meeting(x,y+1,obj_grate){
			in_ink = 0
		}else{
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
}else{
	var grounded = false
}
if in_ink = 0 and not squid{
	hsp = approach(hsp, move * (walksp),0.2)
}else{
	if in_ink = 1 and squid{
		hsp = approach(hsp,move * (walksp*2),0.2)
	}else{
		if in_ink=1{
			hsp = approach(hsp,move*(walksp),0.2)
		}
	}
	if in_ink = 0{
		if not grounded and squid_jumping{
			hsp = approach(hsp,move * (walksp*2),0.4)
		}else{
			hsp = approach(hsp,move * (walksp/1.5),0.2)
		}
	}
}
if in_ink = -1{
	hsp = approach(hsp,move * (walksp/2),0.2)
	if hp>1{
		hp-=0.1
	}
}
//horisontal collisions
if place_meeting(x+hsp,y,obj_wall) or (place_meeting(x+hsp,y,obj_grate) and not squid){
	if place_meeting(x+hsp,y,obj_wall){
		while not place_meeting(x+sign(hsp),y,obj_wall){
			x += sign(hsp)
		}
		if hsp > 0 {
			if instance_place(x+sign(hsp),y,obj_wall).left and instance_place(x+sign(hsp),y,obj_wall).left_color = color and squid{
				if vsp > -walksp*2{vsp=-walksp*2}
			}
		}else{
			if instance_place(x+sign(hsp),y,obj_wall).right and instance_place(x+sign(hsp),y,obj_wall).right_color = color and squid{
				if vsp > -walksp*2{vsp=-walksp*2}
			}
		}
	}else{
		while not place_meeting(x+sign(hsp),y,obj_grate){
			x += sign(hsp)
		}
	}
	hsp = 0
}else{
	x += hsp
}

if not grounded{
	if not swimming{
		in_ink=0
	}
	vsp += grav
}

if jump and grounded{
	if in_ink != -1{
		if sound_cooldown = sound_debuff{
			audio_play_sound(sfx_jump,1,false)
			sound_cooldown = 0
			squashy = 1.5
		}
		if squid and in_ink=1{
			vsp = squid_jump
			squid_jumping=true
			squashy = 2
		}else{
			vsp = jump_force
		}
	}
}

if place_meeting(x,y+vsp,obj_wall) or (place_meeting(x,y+vsp,obj_grate) and not squid){
	while place_meeting(x,y,obj_grate){
		y -= 1
	}
	if place_meeting(x,y+vsp,obj_wall){
		while not place_meeting(x,y+sign(vsp),obj_wall){
			y += sign(vsp)
		}
	}
	if place_meeting(x,y+vsp,obj_grate){
		while (not place_meeting(x,y+sign(vsp),obj_grate) and not squid){
			y += sign(vsp)
		}
	}
	vsp = 0
}else{
	y+=vsp
}
if mouse_check_button(mb_left) and canfire and not squid{
	if weapon = 0 and ink > 10{
		audio_play_sound(sfx_shoot,0,false)
		spray = instance_create_layer(x,y,layer,obj_ink_spray)
		spray.image_blend = color
		alarm[0] = fire_debounce
		canfire = false
		if ogink < ink{
			ogink = ink
		}
		ink -= 10
		alarm[2] = recharge_delay
		rechargable = false
	}
	if weapon = 1{
		if charge != room_speed and ink >2.4{
			if charge = 0{
				ink -= 2.4
				audio_play_sound(sfx_charge,1,false)
			}else{
				ink -= 0.26
			}
			charge += 1
			if charge = room_speed{
				audio_play_sound(sfx_chargecomplete,1,false)
			}
		}
	}
}
if weapon = 1{
	displaytargx = x+lengthdir_x(16*(12*(charge/room_speed)),point_direction(x,y,mouse_x,mouse_y))
	displaytargy = y+lengthdir_y(16*(12*(charge/room_speed)),point_direction(x,y,mouse_x,mouse_y))
}
if (squid or mouse_check_button_released(mb_left)) and weapon = 1 and charge > 0{
	if (charge/room_speed) < 0.9{
		audio_play_sound(sfx_shoot,0,false)
	}else{
		audio_play_sound(sfx_fullshot,1,false)
	}
	if audio_is_playing(sfx_charge){
		audio_stop_sound(sfx_charge)
	}
	targx = x+lengthdir_x(16,point_direction(x,y,mouse_x,mouse_y))
	targy = y+lengthdir_y(16,point_direction(x,y,mouse_x,mouse_y))
	while bull_created < (12*(charge/room_speed)){
		// and not place_meeting(targx,targy,obj_wall)
		spray = instance_create_layer(targx,targy,layer,obj_ink_spray)
		spray.image_blend = color
		with spray{
			if place_meeting(obj_player.targx,obj_player.targy,obj_wall) and instance_place(obj_player.targx,obj_player.targy,obj_wall).object_index != obj_grate {
				if obj_player.x > x{
					instance_place(obj_player.targx,obj_player.targy,obj_wall).right = true
					instance_place(obj_player.targx,obj_player.targy,obj_wall).right_color = obj_player.color
				}
				if obj_player.x < x{
					instance_place(obj_player.targx,obj_player.targy,obj_wall).left = true
					instance_place(obj_player.targx,obj_player.targy,obj_wall).left_color = obj_player.color
				}
				obj_player.bull_created = 12
			}
			if place_meeting(obj_player.targx,obj_player.targy,obj_enemy){
				damage = (obj_player.charge/room_speed) *100 + 10
			}else{
				damage = 2
			}
		}
		spray.hsp = 0
		spray.vsp = 0
		bull_created += 1
		targx = x+lengthdir_x(16*bull_created,point_direction(x,y,mouse_x,mouse_y))
		targy = y+lengthdir_y(16*bull_created,point_direction(x,y,mouse_x,mouse_y))
	}
	bull_created = 0
	alarm[0] = 0.2 * room_speed
	canfire = false
	if ogink < ink{
		ogink = ink
	}
	alarm[2] = recharge_delay
	rechargable = false
	charge = 0
}
if btype != 2{
	if bomb and canfire and ink > 70 and not squid{
		audio_play_sound(sfx_shoot,0,false)
		if btype = 0{
			spray = instance_create_layer(x,y,layer,obj_splat_bomb)
		}
		if btype = 1{
			spray = instance_create_layer(x,y,layer,obj_suction_bomb)
		}
		spray.image_blend = color
		alarm[0] = fire_debounce
		canfire = false
		if ogink < ink{
			ogink = ink
		}
		ink -= 70
		alarm[2] = recharge_delay
		rechargable = false
	}
}else{
	if bomb and canfire and ink > 40 and not squid{
		audio_play_sound(sfx_shoot,0,false)
		spray = instance_create_layer(x,y,layer,obj_burst_bomb)
		spray.image_blend = color
		alarm[0] = fire_debounce
		canfire = false
		if ogink < ink{
			ogink = ink
		}
		ink -= 40
		alarm[2] = recharge_delay
		rechargable = false
	}
}
if not squid and ink < 100 and rechargable{
	ink += 0.05
}
if squid = true{
	if in_ink{
		image_alpha=0.25
		if ink < 100 and rechargable{
			ink+=1
		}
		if hp+1 < 100{
			hp++
		}
	}else{
		image_alpha=1
	}
}
if hp <= 0{
	audio_play_sound(sfx_explode,1,false)
	charge = 0
	var i
	for (i=0; i < (32*6); i+=6){
		bullet = instance_create_layer(x,y,layer,obj_enemy_spray)
		bullet.image_blend=c_purple
		bullet.hsp = lengthdir_x(3,i)
		bullet.vsp = lengthdir_y(3,i)
	}
	soul = instance_create_layer(x,y,layer,obj_soul)
	soul.image_blend = color
	soul.player = true
	dead = true
	lc -= 1
}
image_blend=merge_color(c_purple,color,hp/100)
if hp < 100 and in_ink >= 0{
	hp += 0.05
}
}else{
	image_alpha=0
}
if y > room_height{
	hp = 0
	if dead = false{
		effect_create_below(ef_smoke,x,y,1,color)
	}
}
if place_meeting(x,y,obj_water){
	hp -= 5
	if hp > 0{
		effect_create_below(ef_smoke,x,y,0.5,color)
	}
}
if sound_cooldown != sound_debuff{
	sound_cooldown++
}
if keyboard_check_pressed(ord("R")){
	show_message("A communication error has occurred")
	if dead = false{
		effect_create_below(ef_smoke,x,y,1,color)
	}
	hp = 0
}
delay_recharged = (alarm[2] / recharge_delay)*100

squashx = lerp(squashx,1,0.3)
squashy = lerp(squashy,1,0.3)