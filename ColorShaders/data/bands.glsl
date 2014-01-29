#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform float noiseFactor;
uniform vec2 resolution;
uniform float stripes;

// Gradient Noise (http://en.wikipedia.org/wiki/Gradient_noise)
// Created by inigo quilez - iq/2013
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
// Noise implementation from https://www.shadertoy.com/view/XdXGW8
vec2 hash( vec2 p )
{
	p = vec2( dot(p,vec2(127.1,311.7)),
			  dot(p,vec2(269.5,183.3)) );

	return -1.0 + 2.0*fract(sin(p)*43758.5453123);
}

float noise( in vec2 p )
{
    vec2 i = floor( p );
    vec2 f = fract( p );
	
	vec2 u = f*f*(3.0-2.0*f);

    return mix( mix( dot( hash( i + vec2(0.0,0.0) ), f - vec2(0.0,0.0) ), 
                     dot( hash( i + vec2(1.0,0.0) ), f - vec2(1.0,0.0) ), u.x),
                mix( dot( hash( i + vec2(0.0,1.0) ), f - vec2(0.0,1.0) ), 
                     dot( hash( i + vec2(1.0,1.0) ), f - vec2(1.0,1.0) ), u.x), u.y);
}


void main( void ) {
	vec2 position = ( gl_FragCoord.xy / resolution.xy );
	
	float stripeNumber = floor(position.x * stripes);
	float stripePosition = fract(position.x * stripes);

	float color = (noise(vec2(position.y * noiseFactor - 2.0*time, stripeNumber+noise(vec2(5.0*stripeNumber, time*0.1))*time*0.2)) + 1.0) / 2.0;	
	color = smoothstep(color, 0.2, 0.4);
	color -= 0.2*mod(color, 0.2*position.x*position.y);
	//color = (noise(vec2(position.y * 0.1 + time * 0.2 * fract(stripeNumber * 1.3), stripeNumber)) + 1.0) / 2.0;
	if (stripePosition < 0.3)
		color -=0.9;

	vec3 col = vec3(color);
	col.r = mod(col.g, position.x);
	col.g = mod(col.b, position.y);
	gl_FragColor = vec4(col, 1.0);

}
