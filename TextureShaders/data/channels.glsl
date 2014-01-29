#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform vec2 rbias;
uniform vec2 gbias;
uniform vec2 bbias;
uniform vec2 rmult;
uniform vec2 gmult;
uniform vec2 bmult;

void main(void) {	
	vec2 pr = rmult * vertTexCoord.st + rbias;
	vec2 pg = gmult * vertTexCoord.st + gbias;
	vec2 pb = bmult * vertTexCoord.st + bbias;

	float r = texture2D(texture, pr).r;
	float g = texture2D(texture, pg).g;
	float b = texture2D(texture, pb).b;
  	gl_FragColor = vec4(r, g, b, 1.0);
}

