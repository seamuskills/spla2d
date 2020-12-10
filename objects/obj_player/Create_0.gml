/// @description Insert description here
// You can write your code in this editor
weapon = obj_optionshandler.wpn
btype = obj_optionshandler.bomb
if weapon = 1{
	charge = 0
	bull_created = 0
	targx = 0
	targy = 0
}
squid_jumping=false
hsp = 0
vsp = 0
walksp= 1.5
squid = false
grav = 0.25
in_ink = false
jump_force = -3
squid_jump=-5
var colors = [make_color_rgb(255,165,0),$00bbff,$00ffff,$3b9d40,$0da817,$c1ff88,$825600,$0000ff,$00ff00,$ee9bff,$aa00aa]
color = colors[obj_optionshandler.pcolor]
//purple 16750848
image_blend = color
fire_debounce = 0.2 * room_speed
canfire = true
ink = 100.0
hp=100
spawnpointx = x
spawnpointy = y
dead = false
sound_debuff = 0.30*room_speed
sound_cooldown = sound_debuff
lc = -1
recharge_delay = 1 * room_speed
rechargable = false
ogink = 0
delay_recharged = ogink
alarm[1]=10
instance_create_layer(x,y,layer,obj_cheatcodehandler)
part_system_depth(1,-101)
squashx=1
squashy=1