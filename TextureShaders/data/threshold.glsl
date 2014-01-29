#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float threshold;

void main(void)
{
	vec3 col = texture2D(texture, vertTexCoord.st).rgb;
	float bright = 0.33333 * (col.r + col.g + col.b);
	float b = mix(0.0, 1.0, step(threshold, bright));
    gl_FragColor = vec4(vec3(b), 1.0);
}
