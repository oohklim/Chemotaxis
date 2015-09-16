Bacteria [] colony;
 void setup()   
 {     
   size(800, 800);
   colorMode(HSB, 100);
   colony = new Bacteria[100];
   for (int i = 0; i < colony.length; i++)
   {
     colony[i] = new Bacteria();
   }   
 }   
 void draw()   
 {
   background(0, 0, 100);
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
     x = (int)(Math.random() * 801);
     y = (int)(Math.random() * 801);
     h = (int)(Math.random()*100) + 1;
     d = (int)(Math.random()*16) + 10;
   }
   void move()
   {
     if(x < mouseX)//[-1, 3]
     {
       x = x + (int)(Math.random()*5) - 1;
     }
     else if(x > mouseX)//[-3, 1]
     {
       x = x + (int)(Math.random()*5) - 3;
     }
     if(y < mouseY)//[-1, 3]
     {
       y = y + (int)(Math.random()*5) - 1;
     }
     else if(y > mouseY)//[-3, 1]
     {
       y = y + (int)(Math.random()*5) - 3;
     }
   }
   void show()
   {
     noFill();
     stroke(h, 70, 90);
     ellipse(x, y, d, d);
   }
 }
