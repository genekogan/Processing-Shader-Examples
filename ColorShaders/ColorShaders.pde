import controlP5.*;

ArrayList<GShader> shaders;
GShader shader;
PGraphics pg;
int idxShader = -1;

void setup() 
{
  size(1440, 720, OPENGL);
  setupShaders();
  setupGui();  
  setShader(0);
  pg = createGraphics(960, 720, OPENGL);
}

void draw() 
{ 
  shader.setShaderParameters();
  
  pg.beginDraw();
  pg.shader(shader.shader);
  pg.rect(0, 0, pg.width, pg.height);
  pg.endDraw();
  
  fill(0);
  rect(0, 0, 480, height);
  image(pg, 480, 0); 
}


