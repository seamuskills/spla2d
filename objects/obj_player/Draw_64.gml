/// @description Insert description here
// You can write your code in this editor
draw_healthbar(1,48-(((ogink/100)*43)),14,48-(((ink/100)*43)),delay_recharged,c_black,c_gray,c_gray,3,false,false)
draw_rectangle_color(1,48-(((ink/100)*43)),14,46,color,color,color,color,false)
draw_sprite(spr_ink_tank,0,0,0)
draw_sprite_ext(spr_lives,lc,room_width,0,2,2,0,color,1)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_text(0,500,"score: " + string(obj_optionshandler.sc))