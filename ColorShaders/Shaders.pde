void setupShaders() 
{
  GShader newShader;
  shaders = new ArrayList<GShader>();
  
  // blobby
  newShader = new GShader("blobby.glsl");
  newShader.addParameter("depth", 0, 2);
  newShader.addParameter("rate", 0, 2);
  shaders.add(newShader);
  
  // drip
  newShader = new GShader("drip.glsl");
  newShader.addParameter("intense", 0, 1);
  newShader.addParameter("speed", 0, 1);
  newShader.addParameter("graininess", 0, 1, 0, 1);
  shaders.add(newShader);
  
  // electro
  newShader = new GShader("electro.glsl");
  newShader.addParameter("rings", 5, 40);
  newShader.addParameter("complexity", 1, 60);
  shaders.add(newShader);
  
  // eye
  newShader = new GShader("eye.glsl");
  newShader.addParameter("mouse", 0, width, 0, height);
  shaders.add(newShader);
  
  // bands
  newShader = new GShader("bands.glsl");
  newShader.addParameter("noiseFactor", 5, 100);
  newShader.addParameter("stripes", 0, 100);
  shaders.add(newShader);
  
  // sinewave
  newShader = new GShader("sinewave.glsl");
  newShader.addParameter("colorMult", 0.5, 5.0, 0.5, 2.0);
  newShader.addParameter("coeffx", 10, 50);
  newShader.addParameter("coeffy", 0, 90);
  newShader.addParameter("coeffz", 1, 200);
  shaders.add(newShader);
  
  // water noise
  newShader = new GShader("noisy.glsl");
  newShader.addParameter("noiseFactor", 0, 10, 0, 10);
  newShader.addParameter("noiseFactorTime", 0, 2);
  shaders.add(newShader);
  
  // nebula
  newShader = new GShader("nebula.glsl");
  newShader.addParameter("starspeed", 0, 100);
  shaders.add(newShader);
  
  // landscape
  newShader = new GShader("landscape.glsl");
  newShader.addParameter("dir", 1.5, 5);
  shaders.add(newShader);
  
  // monjori
  newShader = new GShader("monjori.glsl");
  newShader.addParameter("graininess", 10, 100);
  newShader.addParameter("pace", 20, 80);
  newShader.addParameter("twist", 0, 100);
  shaders.add(newShader);
  
  // bits
  newShader = new GShader("bits.glsl");
  newShader.addParameter("mx", 0, 1);
  newShader.addParameter("my", 0, 1);
  shaders.add(newShader);
  
  // rain
  newShader = new GShader("rain.glsl");
  newShader.addParameter("hue", 0, 0.1);
  newShader.addParameter("fade", 0, 1);
  newShader.addParameter("slow", 0.1, 3);
  newShader.addParameter("gray", 0, 1);
  shaders.add(newShader);
}


void setShader(int idxNextShader) {
  if (idxShader > -1)
    shader.removeGui();
  idxShader = idxNextShader;
  shader = shaders.get(idxShader); 
  shader.addGui();
}
