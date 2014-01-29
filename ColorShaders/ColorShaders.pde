String[] shaders = new String[]{ 
  "blobby.glsl", "drip.glsl", "electro.glsl", 
  "eye.glsl", "bands.glsl", "sinewave.glsl", "noisy.glsl", 
  "nebula.glsl", "landscape.glsl", "monjori.glsl" };

PShader shade;
int idxShader = 0;

void setup() 
{
  size(640, 480, P2D);
  textSize(22);
  fill(255);
  shade = loadShader(shaders[idxShader]);
}

void draw() 
{ 
  setShaderParameters();
  
  // turn on shader and display movie
  shader(shade);
  rect(0, 0, width, height);
  
  // turn off shader before displaying filename
  resetShader();
  text(shaders[idxShader], 5, 20);
}

void setShaderParameters() 
{
  shade.set("time", (float) millis()/1000.0);
  shade.set("resolution", float(width), float(height));
  
  // blobby
  if (idxShader == 0) {
    shade.set("depth", map(mouseY, 0, height, 0, 2));
    shade.set("rate", map(mouseX, 0, width, 0, 2));
  }
    
  // drip
  else if (idxShader == 1) {  
    shade.set("intense", 0.5);
    shade.set("speed", 0.9);
    shade.set("graininess", (float)mouseX/width, (float)mouseY/height);
  }
  
  // electro
  else if (idxShader == 2) {      
    shade.set("rings",  map(mouseY, 0, height, 5, 40));  
    shade.set("complexity", map(mouseX, 0, width, 1, 60));
  }

  // eye
  else if (idxShader == 3) {    
    shade.set("mouse", (float)mouseX, (float)mouseY); 
  }

  // bands
  else if (idxShader == 4) {
    shade.set("noiseFactor", map(mouseX, 0, width, 5, 100));
    shade.set("stripes", map(mouseY, 0, height, 0, 100));
  }

  // sinewaves
  else if (idxShader == 5) {
    shade.set("colorMult", 2.5, 1.2);
    shade.set("coefficients", 30, map(mouseY, 0, height, 0, 80),  map(mouseX, 0, width, 1, 200)); 
  }
  
  // water noise
  else if (idxShader == 6) {
    shade.set("noiseFactor", map(mouseX, 0, width, 0, 2), map(mouseX, 0, width, 0, 2));
    shade.set("noiseFactorTime", map(mouseY, 0, height, 0, 2));
  }

  // nebula
  else if (idxShader == 7) {
    shade.set("starspeed", map(mouseX, 0, width, 0, 100));
  }
 
  // landscape
  else if (idxShader == 8) {
    shade.set("dir", map(mouseX, 0, width, 1.5, 5));
  }

  // monjori
  else if (idxShader == 9) {
    shade.set("graininess", map(mouseX, 0, width, 10, 100));
    shade.set("pace", 50.0);
    shade.set("twist", map(mouseY, 0, height, 0, 100));
  }
}

void keyPressed() {
  if      (keyCode==LEFT) {
    idxShader = (idxShader + shaders.length - 1) % shaders.length;
    shade = loadShader(shaders[idxShader]);
  }    
  else if (keyCode==RIGHT) {
    idxShader = (idxShader + 1) % shaders.length;
    shade = loadShader(shaders[idxShader]);
  }
}
