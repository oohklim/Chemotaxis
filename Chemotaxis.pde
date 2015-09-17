Bacteria [] colony;
void setup()   
{     
  size(600, 600);
  background(0);
  colorMode(HSB, 100);
  colony = new Bacteria[250];
  for (int i = 0; i < colony.length; i++)
  {
    colony[i] = new Bacteria();
  }
}   
void draw()   
{
  fill(0, 15);
  rect(-1, -1, 601, 601);
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
    x = (int)(Math.random() * 1201) - 300;
    y = (int)(Math.random() * 1201) - 300;
    h = (int)(Math.random()*100) + 1;
    d = (int)(Math.random()*26) + 5;
  }
  void move()
  {
    if (x < mouseX)//[-1, 2]
    {
      x = x + (int)(Math.random()*4) - 1;
    }
    else//[-2, 1]
    {
      x = x + (int)(Math.random()*4) - 2;
    }
    if (y < mouseY)//[-1, 2]
    {
      y = y + (int)(Math.random()*4) - 1;
    }
    else//[-2, 1]
    {
      y = y + (int)(Math.random()*4) - 2;
    }
  }
  void show()
  {
    noFill();
    stroke(h, 70, 90);
    ellipse(x, y, d, d);
  }
}
