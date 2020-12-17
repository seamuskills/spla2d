/// @description Insert description here
// You can write your code in this editor
zoomed = false
camera = camera_create()
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)
var pm = matrix_build_projection_ortho(512,256,-10000,100000)
camera_set_view_mat(camera,vm)
camera_set_proj_mat(camera,pm)

view_camera[0] = camera

fallow = obj_player
xTo = fallow.x
yTo = fallow.y