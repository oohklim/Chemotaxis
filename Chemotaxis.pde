Bacteria [] colony;
 void setup()   
 {     
   size(500, 500);
   colorMode(HSB, 100);
   noFill();
   colony = new Bacteria[5];
   for (int i = 0; i < colony.length; i++)
   {
     colony[i] = new Bacteria((int)(Math.random() * 501), (int)(Math.random() * 501));
   }   
 }   
 void draw()   
 { 
   background(0);
   for (int i = 0; i < colony.length; i++)
   {
     colony[i].move();
     colony[i].show();
   }      
 }  
 class Bacteria    
 {
   int myX, myY, h;
   Bacteria(int x, int y)
   {
     myX = x;
     myY = y;
     h = (int)(Math.random()*100) + 1;
   }
   void move()
   {
     myX = myX + (int)(Math.random()*5)-2;
     myY = myY + (int)(Math.random()*5)-2;
   }
   void show()
   {
     stroke(h, 70, 90);
     ellipse(myX, myY, 25, 25);
   }
