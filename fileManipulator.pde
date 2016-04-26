void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    uploadedImage = loadImage(selection.getAbsolutePath());
    grayScale(uploadedImage);
    //uploadedImage = cropImage(uploadedImage, 512, 512);
  }
}

void grayScale(PImage img) {
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color pixel = img.pixels[i];
    float r = ((pixel >> 16) & 0xFF) * 0.21;
    float g = ((pixel >> 8) & 0xFF) * 0.72;
    float b = ((pixel) & 0xFF) * 0.07;
    img.pixels[i] = color(r + g + b);
  }
  img.updatePixels();
}

PImage cropImage(PImage source, int newWidth, int newHeight) {
  PImage target = createImage(newWidth, newHeight, RGB);  
  
  return target;
}