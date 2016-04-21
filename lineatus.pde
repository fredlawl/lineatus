// Need G4P library
import g4p_controls.*;

PGraphics pg;
PImage splashImage;

public void setup(){
  size(800, 512, JAVA2D);
  createGUI();
  customGUI();
}

public void draw(){
  background(230);
  drawSketch();
}

public void drawSketch() {
  pg.beginDraw();
  pg.image(splashImage, 0, 0);
  pg.endDraw();
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
  pg = createGraphics(512, 512, JAVA2D);
  renderWindow.setGraphic(pg);
  splashImage = loadImage("splash.jpg"); //<>//
}