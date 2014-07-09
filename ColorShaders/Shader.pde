class GShader
{
  String path;
  PShader shader;
  ArrayList<Param> parameters;
  
  GShader(String path) {
    this.path = path;
    shader = loadShader(path);
    parameters = new ArrayList<Param>();
  }
  
  void addParameter(String name, float minVal, float maxVal) {
    Param param = new Param(name, minVal, maxVal);
    parameters.add(param);
  }
  
  void addParameter(String name, float minVal1, float maxVal1, float minVal2, float maxVal2) {
    Param param = new Param(name, minVal1, maxVal1, minVal2, maxVal2);
    parameters.add(param);
  }
  
  void setShaderParameters() {
    shader.set("time", (float) millis()/1000.0);
    shader.set("resolution", float(pg.width), float(pg.height));
    for (Param p : parameters) {
      if (p.is2d) {
        shader.set(p.name, p.value2.x, p.value2.y);
      } else {
        shader.set(p.name, p.value);
      }
    }
  }
  
  void addGui() {
    PVector guiPosition = new PVector(15, 50);
    for (Param p : parameters) {
      if (p.is2d) {
        cp5.addSlider2D(p.name)
           .setArrayValue(new float[]{p.value2.x, p.value2.y})
           .setMinX(p.minValue2.x).setMinY(p.minValue2.y)
           .setMaxX(p.maxValue2.x).setMaxY(p.maxValue2.y)
           .setPosition(guiPosition.x, guiPosition.y)
           .setSize(300, 300);           
        guiPosition.y += 330;
      }
      else {
        cp5.addSlider(p.name)
           .setValue(p.value)
           .setRange(p.minValue, p.maxValue)
           .setPosition(guiPosition.x, guiPosition.y)
           .setSize(300, 25);
        guiPosition.y += 35;
      } 
    }
  }
  
  void removeGui() {
    for (Param p : parameters) {
      cp5.remove(p.name);
    }
  }
}


