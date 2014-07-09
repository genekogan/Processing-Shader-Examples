ControlP5 cp5;

void setupGui() {
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("Courier", 14));
  
  DropdownList guiShaders = cp5.addDropdownList("selectShader");
  guiShaders.setPosition(480, 25).setSize(240, height-10).setItemHeight(25).setBarHeight(25);
  guiShaders.captionLabel().set("shaders");
  guiShaders.captionLabel().style().marginTop = 1;
  guiShaders.captionLabel().style().marginLeft = 1;
  for (int i=0; i<shaders.size(); i++) {
    guiShaders.addItem(shaders.get(i).path, i);
  }  
}

void controlEvent(ControlEvent theEvent) 
{
  String name = theEvent.getName();
  
  for (Param p : shader.parameters) {  
    if (name.equals(p.name)) {
      if (p.is2d) {
        p.set(theEvent.getArrayValue());  
      }
      else {
        p.set(theEvent.value());
      }
      return;
    }
  }

  if (name.equals("selectShader")) {
    setShader((int) theEvent.value());
  }  
}
