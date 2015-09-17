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
    colony[i].bounce();
  }
}  
class Bacteria    
{
  int x, y, h, d;
  boolean up, right;
  Bacteria()
  {
    x = (int)(Math.random() * 1001) - 200;
    y = (int)(Math.random() * 1001) - 200;
    h = (int)(Math.random()*100) + 1;
    d = (int)(Math.random()*26) + 5;
    boolean up = true;
    boolean right = false;
  }
  void bounce()
  {
    if (x <= 0)
    { 
      right = true;
    }
    if (x >= 600)
    {
      right = false;
    }
    if (y <= 0)
    {
      up = false;
    }
    if (y >= 600)
    {
      up = true;
    }
  }
  void move()
  {
    if (right == true)//[-1, 3]
    {
      x = x + (int)(Math.random()*4) - 1;
    }
    else//[-3, 1]
    {
      x = x + (int)(Math.random()*4) - 2;
    }
    if (up == false)//[-1, 3]
    {
      y = y + (int)(Math.random()*4) - 1;
    }
    else//[-3, 1]
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
