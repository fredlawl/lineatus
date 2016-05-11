// Need G4P library
import g4p_controls.*;

PGraphics pg;
PImage splashImage;
PImage uploadedImage = null;
LineDrawer drawer;

int numLines = 1600; 
int numGenerations = 200;
int opacityLvl = 10;
boolean isGenerating = false;

public void setup(){
  size(800, 512, JAVA2D);
  surface.setResizable(false);
  createGUI();
  customGUI();
  
  // Canvas Setup
  colorMode(ARGB);
  blendMode(MULTIPLY);
  strokeWeight(1);
}

public void draw(){
  if (!isGenerating) {
    background(230);
    drawSketch();
  } else {
    noLoop();
  }
}

public void drawSketch() {
  pg.beginDraw();
  if (uploadedImage == null) {
    pg.image(splashImage, 0, 0);
  } else {
    pg.background(255); 
    pg.image(uploadedImage, 0, 0);
  }
  pg.endDraw();
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
  pg = createGraphics(512, 512, JAVA2D);
  renderWindow.setGraphic(pg);
  splashImage = loadImage("splash.jpg"); //<>//
}