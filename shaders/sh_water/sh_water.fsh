//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;
uniform vec2 Texel;

const float Xspeed = 0.01;
const float Xfreq = 20.0;
const float Xsize = 5.0;

void main()
{
	float Xwave = cos(Time*Xspeed+v_vTexcoord.y*Xfreq)*(Xsize*Texel.x)* v_vTexcoord.y;
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord+Xwave);
}
