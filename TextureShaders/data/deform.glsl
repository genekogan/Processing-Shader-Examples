#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float time;
uniform vec2 mouse;
uniform float turns;

void main(void) {
  vec2 p = -1.0 + 2.0 * vertTexCoord.st;
  vec2 m = -1.0 + 2.0 * mouse.xy;

  float a1 = abs(atan(p.y - m.y, p.x - m.x));
  float r1 = sqrt(dot(p - m, p - m));
  float a2 = abs(atan(p.y + m.y, p.x + m.x));
  float r2 = sqrt(dot(p + m, p + m));

  vec2 uv;
  uv.x = time + (r1 - r2) * 0.25;
  uv.y = sin(turns * (a1 - a2));

  float w = r1 * r2 * 0.5;
  vec3 col = texture2D(texture, 0.5 - 0.495 * uv).xyz;
  gl_FragColor = vec4(col / (0.01 + w), 1.0);
}