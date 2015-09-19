Bacteria [] colony;
void setup()   
{     
  size(1200, 1000);
  background(0);
  colorMode(HSB, 100);
  colony = new Bacteria[300];
  for (int i = 0; i < colony.length; i++)
  {
    colony[i] = new Bacteria();
  }
}   
void draw()
{
  fill(0, 30);
  rect(-1, -1, 1501, 1001);
  for (int i = 0; i < colony.length; i++)
  {
    colony[i].move();
    colony[i].show();
  }
}  
class Bacteria    
{
  int x, y, h, d;
  Bacteria()
  {
    x = (int)(Math.random() * 1801) - 300;
    y = (int)(Math.random() * 1601) - 300;
    h = (int)(Math.random()*100) + 1;
    d = (int)(Math.random()*10) + 1;
  }
  void move()
  {
    if (x < mouseX)//[-1, 2]
    {
      x = x + (int)(Math.random()*4) - 1;
    }
    else if (x > mouseX)//[-2, 1]
    {
      x = x + (int)(Math.random()*4) - 2;
    }
    else
    {
      x = x + (int)(Math.random()*5) - 2;
    }
    if (y < mouseY)//[-1, 2]
    {
      y = y + (int)(Math.random()*4) - 1;
    }
    else if (y > mouseY)//[-2, 1]
    {
      y = y + (int)(Math.random()*4) - 2;
    }
    else
    {
      y = y + (int)(Math.random()*5) - 2;
    }
    if (x == mouseX && y == mouseY)//if bac touches cursor it resets off screen
    {
      if((int)(Math.random() * 2) == 1)
      {
        if((int)(Math.random() * 2) == 1)
        {
          x = -100;
          y = (int)(Math.random() * 1601) - 300;
        }
        else
        {
          x = 1300;
          y = (int)(Math.random() * 1601) - 300;
        }
      }
      else
      {
        if((int)(Math.random() * 2) == 1)
        {
          x = (int)(Math.random() * 1801) - 300;
          y = -100;
        }
        else
        {
          x = (int)(Math.random() * 1801) - 300;
          y = 1100;
        } 
      }
    }
  }
  void show()
  {
    noFill();
    stroke(h, 70, 90);
    ellipse(x, y, d, d);
  }
}
