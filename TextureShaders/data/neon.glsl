#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform vec2 texOffset;
uniform float brt;
uniform int rad;

void main(void) {
  int i = 0;
  int j = 0;
  vec4 sum = vec4(0.0);
  
  for( i=-rad;i<rad;i++) {
    for( j=-rad;j<rad;j++) {
        sum += texture2D( texture, vertTexCoord.st + vec2(j,i)*texOffset.st)*brt;
    }
  }

  gl_FragColor = sum*sum+ vec4(texture2D( texture, vertTexCoord.st).rgb, 1.0);
}
