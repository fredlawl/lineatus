class DrawGrayscaleLine implements IDrawLineStrategy {
  
  public color toGrayscale(color col) {
    float r, g, b;
    
    r = ((col >> 16) & 0xFF) * 0.21;
    g = ((col >> 8) & 0xFF) * 0.72;
    b = ((col) & 0xFF) * 0.07;
    
    return color(r + g + b);
  }
  
  public void drawLine(Line line) {
    stroke(this.toGrayscale(line.getAvgColor()), 10);
    line.drawLine();
  } 
  
}