#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform vec2 pixels;

void main(void)
{
  	vec2 p = vertTexCoord.st;

	p.x -= mod(p.x, 1.0 / pixels.x);
	p.y -= mod(p.y, 1.0 / pixels.y);
    
	vec3 col = texture2D(texture, p).rgb;
	gl_FragColor = vec4(col, 1.0);
}
