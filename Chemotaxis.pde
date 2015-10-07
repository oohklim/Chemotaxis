int a = 150; //wave diamter
int waveX, waveY, t; //wave transparency;
Bacteria [] colony;
void setup()   
{     
  size(1000, 700);
  background(0);
  colorMode(HSB, 100);
  colony = new Bacteria[200];
  for (int i = 0; i < colony.length; i++)
  {
    colony[i] = new Bacteria();
  }
}   
void draw()
{
  fill(0, 20);
  rect(-1, -1, 1001, 701);
  if(a < 150)
  {
    stroke(0, 0, 100, t);
    ellipse(waveX, waveY, a, a);
    a = a + 2;
    t = t - 4;
  }
  for (int i = 0; i < colony.length; i++)
  {
    colony[i].move();
    colony[i].reset();
    colony[i].show();
  }
}  
class Bacteria    
{
  int x, y, h, d;
  Bacteria()
  {
    x = (int)(Math.random()*1601) - 300;
    y = (int)(Math.random()*1301) - 300;
    h = (int)(Math.random()*100) + 1;
    d = (int)(Math.random()*10) + 1;
  }
  void move()
  {
    //if there is a wave bacteria moves away from it
    if(a != 150 && x > waveX)
    {
      x = x + (int)(Math.random()*4) - 1;
    }
    else if(a != 150 && x < waveX)
    {
      x = x + (int)(Math.random()*4) - 2;
    }
    if(a != 150 && y > waveY)
    {
      y = y + (int)(Math.random()*4) - 1;
    }
    else if(a != 150 && y < waveY)
    {
      y = y + (int)(Math.random()*4) - 2;
    }
    //if there is no wave bacteria chases cursor
    if (a == 150 && x < mouseX)//[-1, 2]
    {
      x = x + (int)(Math.random()*4) - 1;
    }
    else if (a == 150 && x > mouseX)//[-2, 1]
    {
      x = x + (int)(Math.random()*4) - 2;
    }
    else
    {
      x = x + (int)(Math.random()*5) - 2;
    }
    if (a == 150 && y < mouseY)//[-1, 2]
    {
      y = y + (int)(Math.random()*4) - 1;
    }
    else if (a == 150 && y > mouseY)//[-2, 1]
    {
      y = y + (int)(Math.random()*4) - 2;
    }
    else
    {
      y = y + (int)(Math.random()*5) - 2;
    }
  }
  void reset() //if bacteria touches cursor or wave, reset off the screen
  {
    if ((x == mouseX && y == mouseY) || (a != 150 && pow(x - waveX, 2) + pow(y - waveY, 2) <= pow(a, 2))) //using equation of a circle
    {
      if ((int)(Math.random()*2) == 1)
      {
        if ((int)(Math.random()*2) == 1)
        {
          x = -100;
          y = (int)(Math.random()*1301) - 300;
        }
        else
        {
          x = 1100;
          y = (int)(Math.random()*1301) - 300;
        }
      }
      else
      {
        if ((int)(Math.random()*2) == 1)
        {
          x = (int)(Math.random()*1601) - 300;
          y = -100;
        }
        else
        {
          x = (int)(Math.random()*1601) - 300;
          y = 800;
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

void mouseClicked()
{
  if(a == 150)
  {
    waveX = mouseX;
    waveY = mouseY;
    a = 0;
    t = 300;
  }
}
