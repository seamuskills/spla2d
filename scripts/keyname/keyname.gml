// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keyname(str){
	keynames = ["space","shift","alt","alt","control","control","tab","enter","delete"]
	keycodes = [vk_space,vk_shift,vk_lalt,vk_ralt,vk_lcontrol,vk_rcontrol,vk_tab,vk_enter,vk_delete]
	if string_lettersdigits(str) = str{return str}
	else{
		for (i=array_length(keynames);i>0;i--){
			if str = chr(keycodes[i-1]){
				return keynames[i-1]
				break
			}
		}
		return "unkown key"
	}
}