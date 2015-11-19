SpaceShip bob = new SpaceShip();
Star[] sky = new Star[200];
Asteroid[] charloot = new Asteroid[1];
public void setup() 
{
  frameRate(60);
  size(600,600);
  for(int i=0;i<sky.length;i++)
  {
    sky[i] = new Star();
  }
  for(int j = 0; j < charloot.length; j++)
    charloot[j] = new Asteroid();
}
public void draw() 
{
  background(0);
  for(int i=0;i<sky.length;i++)
  {
    sky[i].show();
  }
  bob.show();
  bob.move();
  // charloot[1].show();
  for(int i = 0; i < charloot.length; i++)
  {
   // charloot[i].setX((int)((Math.random()*10 )+ 580));
   // charloot[i].setY((int)((Math.random()*10 )+ 580));
   charloot[i].show();
   charloot[i].move();
  }
}
public void keyPressed()
{
  int degRot = 20s;  //can change
  if(key == 'w') 
  {
    bob.accelerate(0.2);
    // System.out.println("ಠ_ಠ");
  }
  if( key == 's')
  {
    bob.accelerate(-0.2);
    // System.out.println("s");
  }
  if(key == 'a')
  {
    // System.out.println("a");
    bob.rotate(-degRot);
  }
  if(key == 'd')
  {
    // System.out.println("d");
    bob.rotate(degRot);
  }
  if(key == 'e')
  {
      bob.setDirectionX(0);
      bob.setDirectionY(0);
  }
  if (key == 'f')
  {
    bob.setX((int)(Math.random()*600));
    bob.setY((int)(Math.random()*600));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
  }
  if (key == 'r')
  {
    bob.setX((int)(Math.random()*600));
    bob.setY((int)(Math.random()*600));
  }
}
class Star
{
  private int starX, starY;
  Star()
  {
    starX = (int)(Math.random()*600);
    starY = (int)(Math.random()*600);
  }
  void show()
  {
    noStroke();
    fill(225);
    ellipse(starX,starY, 5,5);
  }
}
class SpaceShip extends Floater 
{   
  SpaceShip(int x,int y)
  {
    myCenterX = x;
    myCenterY = y;
  }
    SpaceShip()
    {
      corners = 4;
      int[] xS = {-8,16,-8,-2}; //change
      int[] yS = {-8,0,8,0};  //change
      xCorners = xS;
      yCorners = yS;
      myCenterX = 300;
      myCenterY = 300;
      myColor = 255;
      myPointDirection = 270; //degrees
      myDirectionX = 0; //leave at zero
      myDirectionY = 0;
    }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}

}
class Asteroid extends Floater 
{
  Asteroid(int x, int y)
  {
    myCenterX = x;
    myCenterY = y;
  }

  float rotSpeed;
public Asteroid()
    {
      
      corners = 6;
      int[] xS = {-11,7,13,6,-11,-5};
      int[] yS = {-8,-8,0,10,8,0}; 
      xCorners = xS;
      yCorners = yS;
      myCenterX = (int)((Math.random()*10 )+ 580); 
      myCenterY = (int)((Math.random()*10 )+ 580);
      myColor = 255;
      myPointDirection = 270; //degrees
      myDirectionX = 0; //leave at zero
      myDirectionY = 0;
      rotSpeed = 5; //what is this
    }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}

    public void move()
    {
       rotate(rotSpeed);
       super.move();
       setDirectionX(Math.random());
       setDirectionY(Math.random());
       // setX((int)((Math.random()*10 )+ 580));
       // setY((int)((Math.random()*10 )+ 580)); 
    }

}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)
    {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (float nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  /*Draws the floater at the current position  */
  {             
    // fill(myColor);  
    noFill(); 
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
    // if(keyPressed == TRUE && key == 'w')
    // {
      
    // }
  }   
} 