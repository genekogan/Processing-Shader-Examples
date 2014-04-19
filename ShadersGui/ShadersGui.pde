import controlP5.*;

ArrayList<GShader> shaders;
GShader shader;
PGraphics pg;
PImage textureImg;
int idxShader = -1;

void setup() 
{
  size(1440, 720, P2D);
  setupShaders();
  setupGui();  
  setShader(0);
  pg = createGraphics(960, 720, P2D);
  textureImg = loadImage("hummingbird.jpg");
}

void draw() 
{ 
  shader.setShaderParameters();
  
  if (shader.type == TYPE_COLOR) {
    pg.beginDraw();
    pg.shader(shader.shader);
    pg.rect(0, 0, pg.width, pg.height);
    pg.endDraw();
  }
  else if (shader.type == TYPE_TEXTURE) {
    pg.beginDraw();
    pg.shader(shader.shader);
    pg.image(textureImg, 0, 0, pg.width, pg.height);
    pg.endDraw();
  }
  
  fill(0);
  rect(0, 0, 480, height);
  image(pg, 480, 0); 
}


