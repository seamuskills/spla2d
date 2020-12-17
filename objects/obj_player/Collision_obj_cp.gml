/// @description Insert description here
// You can write your code in this editor
if other.active = false{
	spawnpointx = other.x
	if squid{
		spawnpointy = y-16
	}
	if not squid{
		spawnpointy = y
	}
	other.active = true
	x = other.x
	sc_savegame()
	sc_loadgame()
}