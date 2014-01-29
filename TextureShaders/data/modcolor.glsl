#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float modr;
uniform float modg;
uniform float modb;

void main(void)
{
    vec3 col = texture2D(texture, vertTexCoord.st).rgb;
	
	col.r -= mod(col.r, modr);
	col.g -= mod(col.g, modg);
	col.b -= mod(col.b, modb);

	gl_FragColor = vec4(col, 1.0);
}
