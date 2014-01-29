// Electrocardiogram Effect
// Imported from http://www.geeks3d.com/20111223/shader-library-electrocardiogram-effect-glsl/

#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 resolution;
uniform float time;
uniform float complexity;
uniform float rings;

float viewAngle = 0.0;//0.040*sin(0.1*time);
float speed = -1.0;
float rate = .50;
float baseamp = 0.10;

void main(void)
{
  vec2 p = -1.0 + 2.0 * (gl_FragCoord.xy / resolution.xy);
  vec2 op = p;
  p = vec2(distance(p, vec2(0, 0)), sin(0.40*time+atan(p.x, p.y) * complexity));
  float x = speed * viewAngle * time + rate * p.x;
  float base = (0.1 + 3.0*tan(x*0.7 + time)) * (2.37 + 2.5*sin(x*rings + time));
  float z = fract(0.05*x);
  z = max(z, 100.0-z);
  z = pow(z, 50.0);
  float pulse = exp(-1000000.0 * z);
  vec4 ecg_color = vec4(0.3, 1.0, 0.4, 1.0);
  vec4 c = pow(1.0-abs(p.y-(baseamp*base+pulse-0.5)), 4.0) * ecg_color;
  vec3 d = 1.0-vec3(c.r, c.r, c.r);
  gl_FragColor = vec4(d, 1.0);
}