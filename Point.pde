class Point {
  public int x;
  public int y;
  public color col;
  
  Point(int x, int y) {
    this.x = x;
    this.y = y;
    this.col = color(255);
  }
  
  Point(int x, int y, color col) {
    this.x = x;
    this.y = y;
    this.col = col;
  }
}