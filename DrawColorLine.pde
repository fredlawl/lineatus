class DrawColorLine implements IDrawLineStrategy {

  PGraphics pg;
  
  DrawColorLine(PGraphics pg) {
    this.pg = pg;
  }
  
  public void drawLine(Line line) {    
    pg.stroke(line.getAvgColor(), 10);
    line.drawLine(pg);
  } 
  
}