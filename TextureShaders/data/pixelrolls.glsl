#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float time;
uniform vec2 pixels;
uniform float rollRate;
uniform float rollAmount;

void main(void) {
  	vec2 p = vertTexCoord.st;
	p.x -= mod(p.x, 1.0 / pixels.x);
	p.y -= mod(p.y, 1.0 / pixels.y);
	p.y = mod(p.y + rollAmount * sin(rollRate * time * p.x + p.x), 1.0);
  	gl_FragColor = vec4(texture2D(texture, p).rgb, 1.0);
}

