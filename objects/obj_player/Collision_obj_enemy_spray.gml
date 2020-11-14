/// @description Insert description here
// You can write your code in this editor
if not dead{
	hp -= 21
	//if other.damage > 7{
	//	audio_play_sound(sfx_hit,0,false)
	//}
	with other{
		instance_destroy()
	}
}