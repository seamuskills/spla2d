/// @description Insert description here
// You can write your code in this editor
moved = 0
menu_x = x
menu_y = y

audio_play_sound(mus_menu,1,true)

colors = [ $00a5ff,$00bbff,$00ffff,$3b9d40,$0da817,$c1ff88,$825600,$0000ff,$00ff00,$ee9bff,$aa00aa]
color_names = ["orange","marigold","yellow","green","neon green","mint","cobalt","deep red","pure green","floral","lightning purple"]

col_selected = 0

button_h = 32

//buttons
page = 0
button = [["New Game","Select Level","Continue","Options","controls","credits","Quit"],["Color","Motion Blur","Weapon","Bomb","Hard Core Mode: "+string(obj_optionshandler.hc),"FeedBack","Back"],["jump: "+obj_optionshandler.mctrl[0],"left: "+obj_optionshandler.mctrl[1],"right: "+obj_optionshandler.mctrl[2],"bomb","zoom out","controller","Back"],["Back","Super_IronMan-logo design","@pengali2 (@blue ink#5418)-sprite design","special thanks: Louis Inkweaver (ALk2106)"],[]]
buttons = array_length(button[page])

for (i=obj_optionshandler.lu-1;i>-1;i--){
	button[4][i] = "level " + string(i+1)
}
button[4][obj_optionshandler.lu] = "Back"
weapon_names = ["shooter","charger","roller"]
keychange = undefined
bomb = 0
bomb_names = ["splat bomb","suction bomb","burst bomb"]

weapon = 0

menu_index = 0
last_selected = 0