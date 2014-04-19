final static int TYPE_COLOR = 0;
final static int TYPE_TEXTURE = 1;
  
class GShader
{
  
  String path;
  int type;
  PShader shader;
  ArrayList<Param> parameters;
  
  GShader(String path, int type) {
    this.path = path;
    this.type = type;
    shader = loadShader(path);
    parameters = new ArrayList<Param>();
  }
  
  void addParameter(String name, float minVal, float maxVal, boolean isInt) {
    Param param = new Param(name, minVal, maxVal, isInt);
    parameters.add(param);
  }
  
  void addParameter(String name, float minVal, float maxVal) {
    addParameter(name, minVal, maxVal, false);
  }
  
  void addParameter(String name, float minVal1, float maxVal1, float minVal2, float maxVal2, boolean isInt) {
    Param param = new Param(name, minVal1, maxVal1, minVal2, maxVal2, isInt);
    parameters.add(param);
  }

  void addParameter(String name, float minVal1, float maxVal1, float minVal2, float maxVal2) {
    addParameter(name, minVal1, maxVal1, minVal2, maxVal2, false);
  }
  
  void setShaderParameters() {
    shader.set("time", (float) millis()/1000.0);
    shader.set("resolution", float(pg.width), float(pg.height));
    for (Param p : parameters) {
      if (p.is2d) {
        if (p.isInt)  shader.set(p.name, (int) p.value2.x, (int) p.value2.y);
        else          shader.set(p.name, p.value2.x, p.value2.y);
      } else {
        if (p.isInt)  shader.set(p.name, (int) p.value);
        else          shader.set(p.name, p.value);        
      }
    }
    if (path.equals("ripple.glsl")) {
      shader.set("time", (millis()-rippleTimeClick) / 1000.0);
    }
  }
  
  void addGui() {
    PVector guiPosition = new PVector(210, 50);
    for (Param p : parameters) {
      if (p.is2d) {
        cp5.addSlider2D(p.name)
           .setArrayValue(new float[]{p.value2.x, p.value2.y})
           .setMinX(p.minValue2.x).setMinY(p.minValue2.y)
           .setMaxX(p.maxValue2.x).setMaxY(p.maxValue2.y)
           .setPosition(guiPosition.x, guiPosition.y)
           .setSize(220, 240);           
        guiPosition.y += 270;
      }
      else {
        cp5.addSlider(p.name)
           .setValue(p.value)
           .setRange(p.minValue, p.maxValue)
           .setPosition(guiPosition.x, guiPosition.y)
           .setSize(220, 22);
        guiPosition.y += 27;
      } 
    }
  }
  
  void removeGui() {
    for (Param p : parameters) {
      cp5.remove(p.name);
    }
  }
}


