
class Line {
  private Point[] pointsOnLine;
  private float slope;
  private color avgColor = -1;
  
  Line() {
    //pointsOnLine = new Points[];
  }
  
  Line(Point[] points) {
    this.pointsOnLine = points;
  }
  
  public float getSlope() {
    return slope; 
  }
  
  public Point[] getPoints()
  {
    return pointsOnLine;
  }
  
  public Point getStartPoint() {
    return pointsOnLine[0];
  }
  
  public Point getEndPoint() {
    return pointsOnLine[pointsOnLine.length - 1]; 
  }
  
  public color getAvgColor() {
    if (avgColor == -1)
      avgColor = this.avgColorOfLine();
    
    return avgColor;
  }
  
  public void drawLine() {
    Point start = getStartPoint();
    Point end = getEndPoint();
    line(start.x, start.y, end.x, end.y);    
  }
  
  private color avgColorOfLine() {
    int r, g, b;
    color pixel; //<>//
    double sum[] = new double[3];
    int len = this.pointsOnLine.length;
    int i = 0;
    
    for (; i < len; ++i) {
      pixel = this.pointsOnLine[i].col;
      sum[0] += ((pixel >> 16) & 0xFF) / len;
      sum[1] += ((pixel >> 8) & 0xFF) / len;
      sum[2] += ((pixel) & 0xFF) / len;
    }
    
    return color((float) sum[0], (float) sum[1], (float) sum[2]);
  }
    
}