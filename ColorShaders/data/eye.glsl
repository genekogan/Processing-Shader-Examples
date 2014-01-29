#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
#endif


uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;

mat2 m = mat2( 0.8,  0.6, -0.6,  0.6 );

float hash( float n )
{
	return fract(sin(n)*43758.5453);
}

float noise( in vec2 x )
{
	vec2 p = floor(x);
	vec2 f = fract(x);
	f = f*f*(3.0-2.0*f);
	float n = p.x + p.y*57.0;
	float res = mix(mix( hash(n+  0.0), hash(n+  1.0),f.x), mix( hash(n+ 57.0), hash(n+ 58.0),f.x),f.y);
	return res;
}

float fbm( vec2 p )
{
	float f = 0.0;
	f += 0.50000*noise( p ); p = m*p*2.02;
	f += 0.25000*noise( p ); p = m*p*2.03;
	f += 0.12500*noise( p ); p = m*p*2.01;
	f += 0.06250*noise( p ); p = m*p*2.04;
	f += 0.03125*noise( p );
	return f/0.984375;
}

float length2( vec2 p )
{
	float ax = abs(p.x);
	float ay = abs(p.y);
	return pow( pow(ax,4.0) + pow(ay,4.0), 1.0/4.0 );
}

void main(void)
{    
	vec2 q = gl_FragCoord.xy / resolution.xy;
	vec2 p = -1.0 + 2.0 * q;
	vec2 m = -1.0 + 2.0 * mouse.xy / resolution.xy;
	m.y = -m.y;
	p.x *= (resolution.x/resolution.y);

	float rad_eye = 0.94;
	float rad_iris = 0.6 + 0.05 * sin(time);
	float rad_pupil = 0.4 + 0.03 * sin(0.5*time);
	
	vec2 ctr1 = 0.55 * m;
	vec2 ctr2 = 0.40 * m;
	vec2 ctr3 = 0.03 * m;
	
	float r1 = length(p-ctr1);
	float r2 = length(p-ctr2);
	float r3 = length(p-ctr3);

	// start with base color of iris
	vec3 col = vec3( 0.0, 0.3, 0.4 );
	
	// colors for iris/pupils
//	vec3 iris1, iris2; = vec3(0.2, 0.5, 0.4);
//	vec3 iris2 = vec3(0.9, 0.6, 0.2);
	vec3 iris1, iris2;
	
	iris1.x = 0.1 + 0.3*fbm(2.3*p + vec2(time*0.4, time*0.5));
	iris1.y = 0.3 + 0.4*fbm(4.3*p + vec2(time*0.1, time*0.2));
	iris1.z = 0.2 + 0.4*fbm(1.3*p + vec2(time*0.3, time*0.3));

	iris2.x = 0.8 + 0.2*fbm(1.7*p + vec2(time*0.2, time*0.3));
	iris2.y = 0.4 + 0.4*fbm(3.1*p + vec2(time*0.3, time*0.4));
	iris2.z = 0.0 + 0.4*fbm(2.3*p + vec2(time*0.1, time*0.2));
	
	
	// add some noise to iris
	float f = fbm( 5.0*(p-ctr2)+time );
	col = mix( col, iris1, f );
	
	// add yellow
	col = mix( col, iris2, smoothstep(0.6,0.2, (r1+r2)/2.0) );
    
	// add some white streaks to iris
	float a = atan( abs(p.y-ctr1.y), p.x-ctr1.x );
	a += 0.05*fbm( 10.0*p+time*0.5 );
	f = smoothstep( 0.3, 1.0, fbm( vec2(20.0*a,6.0*r2) ) );
	col = mix( col, vec3(0.8, 0.85, 0.93), f );
    

	// add light reflection to top right
	f = smoothstep( 0.4, 0.9, fbm( vec2(15.0*a,10.0*((r1+r3)/2.0)) ) );
	col *= 1.0-0.5*f;
	col *= 1.0-0.25*smoothstep( 0.6,0.8, r2 );
	
	// add pupil	
	col = mix(col, vec3(0.0, 0.0, 0.0), smoothstep(rad_pupil, rad_pupil - 0.25, r1) );
	
	// add light reflection to top right
	f = 1.0 - smoothstep( 0.0, 0.6, length2( mat2(0.6,0.8,-0.8,0.6)*(p-ctr1-vec2(0.35,0.4) )*vec2(1.0,2.0)) );
	col += vec3(1.0,0.9,0.9)*f*0.985;
	col *= vec3(0.8+0.2*cos(r2*a));

	col = mix(col, vec3(1.0, 1.0, 1.0), smoothstep(rad_iris , rad_iris + 0.09, r2) );
	col = mix(col, vec3(0.0, 0.0, 0.0), smoothstep(rad_eye  , rad_eye + 0.05, r3) );

	gl_FragColor = vec4(col,1.0);
}