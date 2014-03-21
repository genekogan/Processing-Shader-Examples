import processing.video.*;

String[] shaders = new String[] {
  "brcosa.glsl", "hue.glsl", "pixelate.glsl", "blur.glsl", 
  "channels.glsl", "threshold.glsl", "neon.glsl", "edges.glsl",
  "wrap.glsl", "deform.glsl", "pixelrolls.glsl", "patches.glsl", 
  "modcolor.glsl", "halftone.glsl", "halftone_cmyk.glsl", "invert.glsl", "bilateral_filter.glsl"};

PShader shade;
PImage img1, img2, img3;
Movie mov;

int idxSource = 0;
int idxShader = 0;

void setup() 
{
  size(640, 480, P2D);
  textSize(22);
  fill(0);

  // load sources
  img1 = loadImage("hummingbird.jpg");
  img2 = loadImage("fruit-stand.jpg");
  img3 = loadImage("paris.jpg");
  mov = new Movie(this, "train.mp4");

  setupShader();
}

void draw() 
{
  setShaderParameters();

  // turn on shader and display source
  shader(shade);
  if      (idxSource == 0)  image(img1, 0, 0, width, height);
  else if (idxSource == 1)  image(img2, 0, 0, width, height);
  else if (idxSource == 2)  image(img3, 0, 0, width, height);
  else if (idxSource == 3)  image(mov, 0, 0, width, height);

  // turn off shader before displaying filename
  resetShader();
  text(shaders[idxShader], 5, 20);
}

void setupShader() 
{
  shade = loadShader(shaders[idxShader]);

  // shader 3 works better on paused movie
  if (idxShader == 3) {
    mov.pause();
  } 
  else {
    mov.loop();
  }
}

void setShaderParameters() 
{
  // brcosa
  if (idxShader == 0) {
    shade.set("brightness", 1.0);
    shade.set("contrast", map(mouseX, 0, width, -5, 5));
    shade.set("saturation", map(mouseY, 0, height, -5, 5));
  }

  // hue
  else if (idxShader == 1) {
    shade.set("hue", map(mouseX, 0, width, 0, TWO_PI));
  } 

  // pixelate
  else if (idxShader == 2) {
    shade.set("pixels", 0.1 * mouseX, 0.1 * mouseY);
  } 

  // blur
  else if (idxShader == 3) {
    shade.set("sigma", map(mouseX, 0, width, 0, 10.0));
    shade.set("blurSize", (int) map(mouseY, 0, height, 0, 30.0));
    shade.set("texOffset", 1.0, 1.0);
  } 

  // channels
  else if (idxShader == 4) {
    shade.set("rbias", 0.0, 0.0);
    shade.set("gbias", map(mouseY, 0, height, -0.2, 0.2), 0.0);
    shade.set("bbias", 0.0, 0.0);
    shade.set("rmult", map(mouseX, 0, width, 0.8, 1.5), 1.0);
    shade.set("gmult", 1.0, 1.0);
    shade.set("bmult", 1.0, 1.0);
  } 
  
  // threshold
  else if (idxShader == 5) {
    shade.set("threshold", map(mouseX, 0, width, 0, 1));
  } 

  // neon
  else if (idxShader == 6) {
    shade.set("brt", map(mouseX, 0, width, 0, 0.5));
    shade.set("rad", (int) map(mouseY, 0, height, 0, 3));
  } 

  // edges (no parameters)
  else if (idxShader == 7) {
  }
    
  // wrap
  else if (idxShader == 8) {
    shade.set("radius", map(mouseX, 0, width, 0, 2));
    shade.set("radTwist", map(mouseY, 0, height, 1.0, 10));
  }

  // deform
  else if (idxShader == 9) {
    shade.set("time", (float) millis()/1000.0);
    shade.set("mouse", (float) mouseX/width, (float) mouseY/height);
    shade.set("turns", map(sin(0.01*frameCount), -1, 1, 2.0, 10.0));
  }

  // pixelRolls
  else if (idxShader == 10) {
    shade.set("time", (float) millis()/1000.0);
    shade.set("pixels", mouseX/5, 250.0);
    shade.set("rollRate", map(mouseY, 0, height, 0, 10.0));
    shade.set("rollAmount", 0.25);
  }

  // patches
  else if (idxShader == 11) {
    shade.set("row", map(mouseX, 0, width, 0, 1));
    shade.set("col", map(mouseY, 0, height, 0, 1));
  }

  // modcolor
  else if (idxShader == 12) {
    shade.set("modr", map(mouseX, 0, width, 0, 0.5));
    shade.set("modg", 0.3);
    shade.set("modb", map(mouseY, 0, height, 0, 0.5));
  }

  // halftone
  else if (idxShader == 13) {
    shade.set("pixelsPerRow", (int) map(mouseX, 0, width, 2, 100));
  }
  
  // halftone cmyk
  else if (idxShader == 14) {
    shade.set("density", map(mouseX, 0, width, 0, 1));
    shade.set("frequency", map(mouseY, 0, height, 0, 100));
  }

  // inversion (no parameters)
  else if (idxShader == 15) {
  }

  // bilateral filter (no parameters)
  else if (idxShader == 16) {
    shade.set("resolution", float(width), float(height));
    shade.set("sigma", 20*pow(map(mouseX, 0, width, 0, 1),2));
  }    
}

void keyPressed() {
  if      (keyCode==LEFT) {
    idxShader = (idxShader + shaders.length - 1) % shaders.length;
    setupShader();
  }    
  else if (keyCode==RIGHT) {
    idxShader = (idxShader + 1) % shaders.length;
    setupShader();
  }
  else if (keyCode==UP) {
    idxSource = (idxSource + 3) % 4;
  }
  else if (keyCode==DOWN) {
    idxSource = (idxSource + 1) % 4;
  }
}

void movieEvent(Movie m) {
  m.read();
}

