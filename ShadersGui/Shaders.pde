void setupShaders() 
{
  GShader newShader;
  shaders = new ArrayList<GShader>();
  
  
  //================================
  // COLOR SHADERS
  //================================
  
  // blobby
  newShader = new GShader("blobby.glsl", TYPE_COLOR);
  newShader.addParameter("depth", 0, 2);
  newShader.addParameter("rate", 0, 2);
  shaders.add(newShader);
  
  // drip
  newShader = new GShader("drip.glsl", TYPE_COLOR);
  newShader.addParameter("intense", 0, 1);
  newShader.addParameter("speed", 0, 1);
  newShader.addParameter("graininess", 0, 1, 0, 1);
  shaders.add(newShader);
  
  // electro
  newShader = new GShader("electro.glsl", TYPE_COLOR);
  newShader.addParameter("rings", 5, 40);
  newShader.addParameter("complexity", 1, 60);
  shaders.add(newShader);
  
  // eye
  newShader = new GShader("eye.glsl", TYPE_COLOR);
  newShader.addParameter("mouse", 0, width, 0, height);
  shaders.add(newShader);
  
  // bands
  newShader = new GShader("bands.glsl", TYPE_COLOR);
  newShader.addParameter("noiseFactor", 5, 100);
  newShader.addParameter("stripes", 0, 100);
  shaders.add(newShader);
  
  // sinewave
  newShader = new GShader("sinewave.glsl", TYPE_COLOR);
  newShader.addParameter("colorMult", 0.5, 5.0, 0.5, 2.0);
  newShader.addParameter("coeffx", 10, 50);
  newShader.addParameter("coeffy", 0, 90);
  newShader.addParameter("coeffz", 1, 200);
  shaders.add(newShader);
  
  // water noise
  newShader = new GShader("noisy.glsl", TYPE_COLOR);
  newShader.addParameter("noiseFactor", 0, 10, 0, 10);
  newShader.addParameter("noiseFactorTime", 0, 2);
  shaders.add(newShader);
  
  // nebula
  newShader = new GShader("nebula.glsl", TYPE_COLOR);
  newShader.addParameter("starspeed", 0, 100);
  shaders.add(newShader);
  
  // landscape
  newShader = new GShader("landscape.glsl", TYPE_COLOR);
  newShader.addParameter("dir", 1.5, 5);
  shaders.add(newShader);
  
  // monjori
  newShader = new GShader("monjori.glsl", TYPE_COLOR);
  newShader.addParameter("graininess", 10, 100);
  newShader.addParameter("pace", 20, 80);
  newShader.addParameter("twist", 0, 100);
  shaders.add(newShader);
  
  // bits
  newShader = new GShader("bits.glsl", TYPE_COLOR);
  newShader.addParameter("mx", 0, 1);
  newShader.addParameter("my", 0, 1);
  shaders.add(newShader);
  
  // rain
  newShader = new GShader("rain.glsl", TYPE_COLOR);
  newShader.addParameter("hue", 0, 0.1);
  newShader.addParameter("fade", 0, 1);
  newShader.addParameter("slow", 0.1, 3);
  newShader.addParameter("gray", 0, 1);
  shaders.add(newShader);
  
  
  //================================
  // TEXTURE SHADERS
  //================================
  
  // brcosa
  newShader = new GShader("brcosa.glsl", TYPE_TEXTURE);
  newShader.addParameter("brightness", 0, 2);
  newShader.addParameter("saturation", -5, 5);
  newShader.addParameter("contrast", -5, 5);
  shaders.add(newShader);
  
  // hue
  newShader = new GShader("hue.glsl", TYPE_TEXTURE);
  newShader.addParameter("hue", 0, TWO_PI);
  shaders.add(newShader);
  
  // pixelate
  newShader = new GShader("pixelate.glsl", TYPE_TEXTURE);
  newShader.addParameter("pixels", 1, 100, 1, 100);
  shaders.add(newShader);
  
  // blur 
  newShader = new GShader("blur.glsl", TYPE_TEXTURE);
  newShader.addParameter("sigma", 0, 10);
  newShader.addParameter("blurSize", 0, 30, true);
  newShader.addParameter("texOffset", 0.5, 3);
  shaders.add(newShader);
  
  // channels
  newShader = new GShader("channels.glsl", TYPE_TEXTURE);
  newShader.addParameter("rbiasx", -1, 1);
  newShader.addParameter("rbiasy", -1, 1);
  newShader.addParameter("gbiasx", -1, 1);
  newShader.addParameter("gbiasy", -1, 1);
  newShader.addParameter("bbiasx", -1, 1);
  newShader.addParameter("bbiasy", -1, 1);
  newShader.addParameter("rmultx", 0, 2);
  newShader.addParameter("rmulty", 0, 2);
  newShader.addParameter("gmultx", 0, 2);
  newShader.addParameter("gmulty", 0, 2);
  newShader.addParameter("bmultx", 0, 2);
  newShader.addParameter("bmulty", 0, 2);
  shaders.add(newShader);
  
  // threshold
  newShader = new GShader("threshold.glsl", TYPE_TEXTURE);
  newShader.addParameter("threshold", 0, 1);
  shaders.add(newShader);
  
  // neon
  newShader = new GShader("neon.glsl", TYPE_TEXTURE);
  newShader.addParameter("brt", 0, 0.5);
  newShader.addParameter("rad", 0, 3, true);
  shaders.add(newShader);
  
  // edges
  newShader = new GShader("edges.glsl", TYPE_TEXTURE);
  shaders.add(newShader);
  
  // wrap
  newShader = new GShader("wrap.glsl", TYPE_TEXTURE);
  newShader.addParameter("radius", 0, 2);
  newShader.addParameter("radTwist", 1, 10);
  shaders.add(newShader);
  
  // deform
  newShader = new GShader("deform.glsl", TYPE_TEXTURE);
  newShader.addParameter("mouse", 0, 1, 0, 1);
  newShader.addParameter("turns", 2, 10);
  shaders.add(newShader);
  
  // pixelrolls
  newShader = new GShader("pixelrolls.glsl", TYPE_TEXTURE);
  newShader.addParameter("pixels", 0, 200, 0, 200);
  newShader.addParameter("rollRate", 0, 10);
  newShader.addParameter("rollAmount", 0, 1);
  shaders.add(newShader);
  
  // patches 
  newShader = new GShader("patches.glsl", TYPE_TEXTURE);
  newShader.addParameter("row", 0, 1);
  newShader.addParameter("col", 0, 1);
  shaders.add(newShader);
  
  // modcolor
  newShader = new GShader("modcolor.glsl", TYPE_TEXTURE);
  newShader.addParameter("modr", 0, 0.5);
  newShader.addParameter("modg", 0, 0.5);
  newShader.addParameter("modb", 0, 0.5);
  shaders.add(newShader);
  
  // halftone
  newShader = new GShader("halftone.glsl", TYPE_TEXTURE);
  newShader.addParameter("pixelsPerRow", 2, 100, true);
  shaders.add(newShader);
  
  // halftone_cmyk
  newShader = new GShader("halftone_cmyk.glsl", TYPE_TEXTURE);
  newShader.addParameter("density", 0, 1);
  newShader.addParameter("frequency", 0, 100);
  shaders.add(newShader);
  
  // invert 
  newShader = new GShader("invert.glsl", TYPE_TEXTURE);
  shaders.add(newShader);
  
  // bilateral_filter
  newShader = new GShader("bilateral_filter.glsl", TYPE_TEXTURE);
  newShader.addParameter("sigma", 0, 2);
  shaders.add(newShader);
  
  // ripple
  newShader = new GShader("ripple.glsl", TYPE_TEXTURE);
  newShader.addParameter("ctr", 0, 1, 0, 1);
  shaders.add(newShader);
}

void setShader(int idxNextShader) {
  if (idxShader > -1)
    shader.removeGui();
  idxShader = idxNextShader;
  shader = shaders.get(idxShader); 
  shader.addGui();
}

int rippleTimeClick;
void mouseClicked() {
  if (shader.path.equals("ripple.glsl")) {
    rippleTimeClick = millis();
    cp5.getController("ctr").setArrayValue(new float[]{(float)(mouseX-480)/pg.width, (float)mouseY/pg.height});
  }  
}

