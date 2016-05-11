class GenerateLine implements ILineGenerationStrategy {
  
  public Line generateLine(Point start) {
    Line result;
    Point[] pointsOnLine;
    
    pointsOnLine = randomLine(start);
    result = new Line(pointsOnLine); //<>//
    
    return result;
  }
  
  private Point[] randomLine(Point t)
  {
     ArrayList<Point> randomArray = new ArrayList<Point>();
     
     float x1 = t.x;
     float y1 = t.y;
     float x2 = 0;
     float y2 = 0;
    
     ///////////////////////////////////
     //Make random point be on the edge
     ///////////////////////////////////
     int randomBoxPoint = (int)random(0,4);
     if(randomBoxPoint == 0 || randomBoxPoint == 1)
     {
     if(randomBoxPoint == 0)
     {
       x2 = 0;
     }
     else
     {
       x2 = width-1;
     }
     y2 = floor(random(0,height));
     }
     else if(randomBoxPoint == 2 || randomBoxPoint == 3)
     {
     if(randomBoxPoint == 2)
     {
       y2 = 0;
     }
     else
     {
       y2 = height-1;
     }
     x2 = floor(random(0,width));
     }
     
     
     //////////////////////////////////
     //Draw lines
     //////////////////////////////////
    float dx = x2-x1;
    float dy = y2-y1;
    float i = 0;
    float j = 0;
    if(x1==x2 || y1 == y2)
    {
      if(randomBoxPoint == 0)
      {
        if(x1 == x2)
        {
           y2 = 0;
           randomArray.add(new Point(int(x2),int(y2)));
           for(j = 0; j < height; j++)
           {
             i = 0;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
        else if(y1 == y2)
        {
           randomArray.add(new Point(int(x2),int(y2)));
           for(i = 0; i< width; i++)
           {
             j = y1;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
      }
      else if(randomBoxPoint == 1)
      {
        if(x1 == x2)
        {
           y2 = 0;
           randomArray.add(new Point(int(x2),int(y2)));
           for(j = 0; j < height; j++)
           {
             i = width-1;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
        else if(y1 == y2)
        {
           randomArray.add(new Point(int(x2),int(y2)));
           for(i = width; i > 0; i--)
           {
             j = y1;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
      }
      else if(randomBoxPoint == 2)
      {
        if(x1 == x2)
        {
          randomArray.add(new Point(int(x2),int(y2)));
           for(j = 0; j < height; j++)
           {
             i = x1;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
        else if(y1 == y2)
        {
           x2 = 0;
           randomArray.add(new Point(int(x2),int(y2)));
           for(i = 0; i < width; i++)
           {
             j = y1;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
      }
      else if(randomBoxPoint == 3)
      {
        if(x1 == x2)
        {
           randomArray.add(new Point(int(x2),int(y2)));
           for(j = height; j > 0 ; j--)
           {
             i = x1;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
        else if(y1 == y2)
        {
           x2 = 0;
           randomArray.add(new Point(int(x2),int(y2)));
           for(i = 0; i < width; i++)
           {
             j = y1-1;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
      }
    }
    
    ///////////////////////////////
    //bigger dx
    ///////////////////////////////
    else if(abs(dx) >= abs(dy))
    {
      randomArray.add(new Point(int(x2),int(y2)));
      if(randomBoxPoint == 0)
      {
        if(y1 < y2)
        {
          for(i = 0; (i<width && j >=0); i++)
          {
            j = (dy/dx)*(i-x1)+y1;
           randomArray.add(new Point(int(i),int(j)));
          }
        }
        else if(y1 > y2)
        {
          for(i = 0; (i<width && j < height); i++)
          {
            j = (dy/dx)*(i-x1)+y1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
      }
      else if(randomBoxPoint == 1)
      {
        if(y1 < y2)
        {
           for(i = width; (i>0 && j >=0); i--)
           {
             j = (dy/dx)*(i-x1)+y1;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
        else if(y1 > y2)
        {
           for(i = width; (i > 0 && j < height); i--)
           {
             j = (dy/dx)*(i-x1)+y1;
             randomArray.add(new Point(int(i),int(j)));
           }
        }
      }
      else if(randomBoxPoint == 2)
      {
        if(x1 < x2)
        {
          for(i = x2; (i > 0 && j < height); i--)
          {
             j = (dy/dx)*(i-x1)+y1;
             randomArray.add(new Point(int(i),int(j)));
          }
        }
        else if(x1 > x2)
        {
          for( i = x2; (i < width && j < height); i++)
          {
            j = (dy/dx)*(i-x1)+y1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
      }
      else if(randomBoxPoint == 3)
      {
        if(x1 < x2)
        {
          for(i = x2; (i >=0 && j >=0); i--)
          {
            j = (dy/dx)*(i-x1)+y1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
        else if(x1 > x2)
        {
          for(i = x2; (i < width && j >= 0); i++)
          {
            j = (dy/dx)*(i-x1)+y1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
      }
    }
    /////////////////////////////////////
    //smaller dx
    ///////////////////////////////////////
    else if(abs(dx) < abs(dy))
    {
      randomArray.add(new Point(int(x2),int(y2)));
      if(randomBoxPoint == 0)
      {
        if(y1 < y2)
        {
          
          for(j = y2; (j > 0 && i < width); j--)
          {
            i = (j - y1)*(dx/dy)+x1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
        else if(y1 > y2)
        {
          for(j = y2; (j < height && i < width); j++)
          {
            i = (j - y1)*(dx/dy)+x1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
      }
      else if(randomBoxPoint == 1)
      {
        if(y1 < y2)
        {
          for(j = y2; (j > 0 && i >= 0); j--)
          {
            i = (j - y1)*(dx/dy)+x1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
        else if(y1 > y2)
        {
          for(j = y2; (j < height && i >= 0); j++)
          {
            i = (j - y1)*(dx/dy)+x1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
      }
      else if(randomBoxPoint == 2)
      {
        if(x1 > x2)
        {
          for(j = 0; (j < height && i < width); j++)
          {
            i = (j - y1)*(dx/dy)+x1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
        else if(x1 < x2)
        {
          for(j = 0; (j < height && i >= 0); j++)
          {
            i = (j - y1)*(dx/dy)+x1;
           randomArray.add(new Point(int(i),int(j)));
          }
        }
      }
      else if(randomBoxPoint == 3)
      {
        if(x1 < x2)
        {
          for(j = height; (j > 0 && i >= 0); j--)
          {
            i = (j - y1)*(dx/dy)+x1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
        else if(x1 > x2)
        {
          for(j = height; (j > 0 && i < width); j--)
          {
            i = (j - y1)*(dx/dy)+x1;
            randomArray.add(new Point(int(i),int(j)));
          }
        }
      }
    }
    
    Point[] points = randomArray.toArray(new Point[randomArray.size()]);
    return points;
  }
}