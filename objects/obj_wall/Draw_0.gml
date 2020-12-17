/// @description Insert description here
// You can write your code in this editor
draw_self()
if up{
	draw_sprite_ext(spr_ink,0,x,y,1,1,90,up_color,1)
}
if down{
	draw_sprite_ext(spr_ink,0,x,y,1,1,270,down_color,1)
}
if left{
	draw_sprite_ext(spr_ink,0,x,y,1,1,180,left_color,1)
}
if right{
	draw_sprite_ext(spr_ink,0,x,y,1,1,0,right_color,1)
}