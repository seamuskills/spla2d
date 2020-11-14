///@param argument0 value
function sc_addscore(argument0) {

	obj_optionshandler.sc+= argument0
	text = instance_create_layer(x,y,layer,obj_scoretext)
	text.sc = argument0


}
