ControlP5 cp5;

void setupGui() {
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("Courier", 14));
  
  ListBox guiShaders = cp5.addListBox("selectShader");

  guiShaders.setPosition(5, 50).setSize(200, height-60).setItemHeight(20).setBarHeight(20);
  guiShaders.setCaptionLabel("shaders");

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
