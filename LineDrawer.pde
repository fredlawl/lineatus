class LineDrawer {
  private PImage originalImg, resultImg;
  private int numOfGenerations, numOfLines;
  private int totalPixelsInImage;
  
  private IDarkestPixelStrategy nextDarkestPixelAlg;
  private IDarkestLineStrategy darkestLineAlg;
  private ILineGenerationStrategy lineGenerationAlg;
  private IDrawLineStrategy drawLineAlg;
  
  LineDrawer(PImage source) {
    this.originalImg = source.copy();
    this.totalPixelsInImage = source.width * source.height;
  }
  
  public void setFindDarkestPixelAlgorithm(IDarkestPixelStrategy alg) {
    this.nextDarkestPixelAlg = alg;
  }
  
  public void setDarkestLineAlgorithm(IDarkestLineStrategy alg) {
    this.darkestLineAlg = alg;
  }
  
  public void setLineGenerationAlgorithm(ILineGenerationStrategy alg) {
    this.lineGenerationAlg = alg;
  }
  
  public void setDrawLineAlgorithm(IDrawLineStrategy alg) {
    this.drawLineAlg = alg;
  }
  
  public void setNumOfGenerations(int numOfGenerations) {
    this.numOfGenerations = numOfGenerations;
  }
  
  public void setNumOfLines(int numOfLines) {
    this.numOfLines = numOfLines;
  }
  
  public void generate() {
    Line[] generation;
    int linecount = 0;
    Line darkestLine;
    
    println("Start");
    
    //image(this.originalImg, 0, 0);
    
    while (linecount < this.numOfLines) {
      // Create a generation
      generation = this.createGeneration(this.nextDarkestPixelAlg.nextDarkestPixel(this.originalImg));
      
      // Find the line with the darkest avg pixels
      darkestLine = this.darkestLineAlg.darkestLine(generation);
      
      // Draw line
      this.drawLineAlg.drawLine(darkestLine);
      
      // Remove the color from original image to continue
      removeColorFromImage(darkestLine.getAvgColor());
      
      ++linecount;
    }
    
    println("END");
  }
  
  private Line[] createGeneration(Point darkestPixel) {
    int randomX = 0, randomY = 0;
    Point randomPoint;
    
    Line[] lines = new Line[this.numOfGenerations];
    int curGeneration = 0;
    int linecount = 0;
    
    while (curGeneration < this.numOfGenerations) {
      Line line = this.lineGenerationAlg.generateLine(darkestPixel);
      
      fillPointColors(line);
      
      lines[curGeneration] = line;
      ++curGeneration;
    }
    
    // IDK why, but this hack right here allows for the drawing to draw more than one line :p
    stroke(#ff0000);
    
    return lines;
  }
  
  private void removeColorFromImage(color col) {
    color curPixel;
    this.originalImg.loadPixels();
    for (int i = 0; i < this.originalImg.pixels.length; i++) {
       curPixel = this.originalImg.pixels[i];
       if (curPixel != col)
         continue;
         
       this.originalImg.pixels[i] = color(255);
    }
    this.originalImg.updatePixels();
  }
  
  private void fillPointColors(Line line) {
    Point[] points = line.getPoints();
    int count = points.length;
    
    for (int i = 0; i < count; i++) {
      Point point = points[i];
      color pixelColor = this.originalImg.get(point.x, point.y);
      point.col = pixelColor;
    }
  }
  
}