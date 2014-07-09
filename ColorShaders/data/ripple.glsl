#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform float time;
uniform vec2 ctr;
uniform sampler2D texture;

void main(void)
{
  float maxRad = 0.16;

  vec2 p = vertTexCoord.st;

  float distFromCtr = distance(p, ctr);  
  float outerBoundary = maxRad * time;
  
  float maxAmp;
  if (time < 0.1) {
    maxAmp = time/0.1;
  } else {
	maxAmp = -log(time*50.0);
  }
  maxAmp *= 0.05;

  float amp0 = maxAmp * max(0.0, sin(1.57*distFromCtr/outerBoundary) / (0.1+10.0*distance(distFromCtr, outerBoundary)));

  amp0 *= step(distFromCtr, outerBoundary);

  vec2 uv = p + p * amp0 * sin(distFromCtr*180.0 + 3.14157*time);
  
  vec3 col = texture2D(texture,uv).xyz;

  gl_FragColor = vec4(col, 1.0);
}