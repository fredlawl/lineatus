class FindNextDarkestPixel implements IDarkestPixelStrategy {
  public Point nextDarkestPixel(PImage source) {
    color darkest = color(255, 255, 255);
    Point point = new Point(0, 0, darkest);
    color curPixel;
    
    for (int y = 0; y < source.height; ++y) {
      for (int x = 0; x < source.width; ++x) {
        curPixel = source.get(x, y);
        
        if (curPixel >= darkest)
          continue;
          
        point.x = x;
        point.y = y;
        darkest = curPixel; 
      }
    }
    
    point.col = darkest;
    source.set(point.x, point.y, color(255));
    return point;
  }
}