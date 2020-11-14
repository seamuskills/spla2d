/// @description Insert description here
// You can write your code in this editor
xdif = x - other.x
if place_meeting(x+(xdif/10),y,obj_wall){
	while not place_meeting(x+sign(xdif),y,obj_wall){
		x+=sign(xdif)
	}
	xdif = 0
}
if xdif !=0{
	x+=(xdif/10)
}