class DrawColorLine implements IDrawLineStrategy {

  private PGraphics pg;
  private int opacity;
  
  DrawColorLine(PGraphics pg, int opacity) {
    this.pg = pg;
    this.opacity = opacity;
  }
  
  public void drawLine(Line line) { 
    float r = red(line.getAvgColor());
    float g = green(line.getAvgColor());
    float b = blue(line.getAvgColor());
    pg.stroke(color(r, g, b), opacity);
    line.drawLine(pg);
  } 
  
}