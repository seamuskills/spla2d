/// @description Insert description here
// You can write your code in this editor
if position_meeting(x+17,y,obj_wall) or position_meeting(x+17,y,obj_water){
	right = false
}
if position_meeting(x-17,y,obj_wall) or position_meeting(x-17,y,obj_water){
	left = false
}
if position_meeting(x,y-17,obj_wall) or position_meeting(x,y-17,obj_water){
	up=false
}
if position_meeting(x,y+17,obj_wall) or position_meeting(x,y+17,obj_water){
	down=false
}