#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float brightness;
uniform float contrast;
uniform float saturation;

void main() {
	vec3 texColor = texture2D(texture, vertTexCoord.st).rgb;

 	const vec3 LumCoeff = vec3(0.2125, 0.7154, 0.0721);
 	vec3 AvgLumin = vec3(0.5, 0.5, 0.5);
 	vec3 intensity = vec3(dot(texColor, LumCoeff));

	vec3 satColor = mix(intensity, texColor, saturation);
 	vec3 conColor = mix(AvgLumin, satColor, contrast);

  	gl_FragColor = vec4(brightness * conColor, 1.0);
}


