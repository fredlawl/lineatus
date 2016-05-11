class DrawColorLine implements IDrawLineStrategy {

  public void drawLine(Line line) {    
    stroke(line.getAvgColor(), 10);
    line.drawLine();
  } 
  
}