class FindDarkestLine implements IDarkestLineStrategy {
  public Line darkestLine(Line[] lines) {
    Line darkestLine = new Line();
    color darkestColorSoFar = color(255, 255, 255);
    int darkestLineSoFar = 0;
    
    for (int i = 0; i < lines.length; ++i) {
       if (lines[i].getAvgColor() >= darkestColorSoFar)
         continue;
       
       darkestColorSoFar = lines[i].getAvgColor();
       darkestLineSoFar = i;
    }
    
    darkestLine = lines[darkestLineSoFar];
    return darkestLine;
  }
}