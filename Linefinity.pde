//final int NUM_LINES = 1800;
//final int GENERATIONS = 250;
//final int CURRENT_IMG = 1;

//String[] images = {
//  "smile-face.jpg",
//  "leaf-07.jpg"
//};

//PImage source;
//LineDrawer drawer;

//void setup() {
//  size(800, 600);
//  surface.setResizable(false);
  
//  // Canvas Setup
//  background(255);
//  colorMode(ARGB);
//  blendMode(MULTIPLY);
//  strokeWeight(1);
  
//  // Load Image
//  source = loadImage(images[CURRENT_IMG]);
//  surface.setSize(source.width, source.height);
  
//  drawer = new LineDrawer(source);
//  drawer.setNumOfGenerations(GENERATIONS);
//  drawer.setNumOfLines(NUM_LINES);
  
//  drawer.setFindDarkestPixelAlgorithm(new FindNextDarkestPixel());
//  drawer.setDarkestLineAlgorithm(new FindDarkestLine());
//  drawer.setLineGenerationAlgorithm(new GenerateLine());
//  drawer.setDrawLineAlgorithm(new DrawGrayscaleLine());
//  //drawer.setDrawLineAlgorithm(new DrawColorLine());
//}

//void draw() {
//  drawer.generate();
//  noLoop();
//}