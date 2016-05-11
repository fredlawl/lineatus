void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    uploadedImage = loadImage(selection.getAbsolutePath());
    uploadedImage = cropImage(uploadedImage, 512, 512);
  }
}

PImage cropImage(PImage source, int newWidth, int newHeight) {
  PImage target = createImage(newWidth, newHeight, RGB);  
  
  int midHeight = source.height/2;
  int midWidth = source.width/2;
  
  int wStep = newWidth/2;
  int hStep = newHeight/2;
  
  int newX = 0;
  int newY = 0;
  for(int x = midWidth - wStep; x < midWidth + wStep; x++){
    for(int y = midHeight - hStep; y < midHeight + hStep; y++){
      color c;
      if(x <= 0) c = color(255);
      else if(x >= source.width) c = color(255);
      else if(y <= 0) c = color(255);
      else if(y >= source.height) c = color(255);
      else c = source.get(x,y);
      
      target.set(newX,newY,c);
      newY++;
    }
    newX++;
    newY = 0;
  }
  
  return target;
}