#define PROCESSING_COLOR_SHADER

uniform float time;
uniform vec2 resolution;
uniform vec2 colorMult;
uniform float coeffx;
uniform float coeffy;
uniform float coeffz;


void main( void ) {

	vec2 position = gl_FragCoord.xy / resolution.xy;

	float color = 0.0;
	color += sin( position.x * cos( time / 15.0 ) * 10.0 )  +  cos( position.y * cos( time / 15.0 ) * coeffx );
	color += sin( position.y * sin( time / 10.0 ) * coeffz )  +  cos( position.x * sin( time / 25.0 ) * coeffy );
	color += sin( position.x * sin( time / 50.0 ) * coeffx )  +  sin( position.y * sin( time / 35.0 ) * coeffz );

	color *= sin( time / 10.0 ) * 0.5;

	float r = color;
	float g = color * colorMult.y;
	float b = sin( color + time / 2.0 ) * colorMult.x;
	
	gl_FragColor = vec4(r, g, b, 1.0 );

}