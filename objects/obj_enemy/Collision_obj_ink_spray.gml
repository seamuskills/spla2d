/// @description Insert description here
// You can write your code in this editor
hp -= other.damage
if other.damage > 7{
	audio_play_sound(sfx_hit,0,false)
}
with other{
	instance_destroy()
}