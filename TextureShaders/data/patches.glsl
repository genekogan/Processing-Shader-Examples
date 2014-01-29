#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float time;
uniform float row;
uniform float col;

void main(void) {
	vec2 p1 = vec2(vertTexCoord.x, row);
	vec2 p2 = vec2(col, vertTexCoord.y);
	
	float r = texture2D(texture, p1).r * texture2D(texture, p2).r;
	float g = texture2D(texture, p1).g * texture2D(texture, p2).g;
	float b = texture2D(texture, p1).b * texture2D(texture, p2).b;

  	gl_FragColor = vec4(r, g, b, 1.0);
}

