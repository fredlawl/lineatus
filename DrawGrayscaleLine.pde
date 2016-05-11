class DrawGrayscaleLine implements IDrawLineStrategy {
  
  private int opacity;
  private PGraphics pg;
  
  DrawGrayscaleLine(PGraphics pg, int opacity) {
    this.opacity = opacity;
    this.pg = pg;
  }
  
  public color toGrayscale(color col) {
    float r, g, b;
    
    r = ((col >> 16) & 0xFF) * 0.21;
    g = ((col >> 8) & 0xFF) * 0.72;
    b = ((col) & 0xFF) * 0.07;
    
    return color(r + g + b);
  }
  
  public void drawLine(Line line) {
    pg.stroke(this.toGrayscale(line.getAvgColor()), opacity);
    line.drawLine(pg);
  } 
  
}