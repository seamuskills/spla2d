function sc_loadjson(argument0) {
	var filename = argument0

	var buffer = buffer_load(filename)
	var _string = buffer_read(buffer,buffer_string)
	buffer_delete(buffer)

	var json = json_decode(_string)
	return json


}
