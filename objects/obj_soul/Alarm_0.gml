/// @description Insert description here
// You can write your code in this editor
//image_xscale = 0.75
speed = 1
image_alpha -= 0.15
alarm[1] = 0.5 * room_speed
if image_alpha <= 0{
	if player = true{
		obj_player.dead = false
		obj_player.x=obj_player.spawnpointx
		obj_player.y=obj_player.spawnpointy
		obj_player.hp = 100
		obj_player.ink = 100
		obj_player.image_alpha = 1
		with obj_ink_spray{
			instance_destroy()
		}
		with obj_enemy_spray{
			instance_destroy()
		}
		with obj_splat_bomb{
			instance_destroy()
		}
		obj_optionshandler.sc = 0
		if obj_player.lc = 0{
			room_restart()
		}else{
			sc_loadgame()
		}
	}
	instance_destroy()
}
