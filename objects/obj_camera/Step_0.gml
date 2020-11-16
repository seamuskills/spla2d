/// @description Insert description here
// You can write your code in this editor
var zoom = keyboard_check(ord(obj_optionshandler.auxctrl[0]))
if zoom{
	if not zoomed{
		var pm = matrix_build_projection_ortho(1024,512,-10000,100000)
		zoomed = true
		camera_set_proj_mat(camera,pm)
	}
}else{
	if zoomed{
		var pm = matrix_build_projection_ortho(512,256,-10000,100000)
		zoomed = false
		camera_set_proj_mat(camera,pm)
	}
}

x += (xTo - x) / 15
y += (yTo - y) / 15

if fallow != noone{
	xTo = fallow.x
	yTo = fallow.y
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)
camera_set_view_mat(camera,vm)

