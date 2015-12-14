SpaceShip bob = new SpaceShip();
Bullet pew = new Bullet(bob);
Star[] sky = new Star[200];
ArrayList <Bullet> bullet;
ArrayList <Asteroid> charloot;
public boolean loser = false;
public int asteroids = 30;
public void setup() 
{
  size(900,900);
  charloot = new ArrayList <Asteroid>();
  bullet = new ArrayList <Bullet>();
  frameRate(60);
  for(int i=0;i<sky.length;i++)
  {
    sky[i] = new Star();
  }
  for(int j = 0; j < asteroids; j++)
    charloot.add(new Asteroid());
}
public void draw() 
{ 
  if(loser == true)
  {
    lose();
  } 
  else{
  background(0);
  for(int i=0;i<sky.length;i++)
  {
    sky[i].show();
  }
  bob.show();
  bob.move();
  // charloot[1].show();
  for(int i = 0; i < charloot.size(); i++)
  {
   charloot.get(i).show();
   charloot.get(i).move();
   if(dist(charloot.get(i).getX(), charloot.get(i).getY(), bob.getX(), bob.getY()) <= 20)
   {
    lose();
    loser = true;
   }
   System.out.println(charloot.size());
   if(charloot.size() == 1)
    win();
  }
}

 for(int i = 0; i < bullet.size(); i++){
      bullet.get(i).show();
      bullet.get(i).move();
  for(int j = 0; j < charloot.size(); j++)
    {
      // if(dist(bullet.get(i).getX(), bullet.get(i).getY(), bob.getX(), bob.getY()) <= 20)
      //   loser = true;

      // if(dist(bob.getX(), bob.getY(), charloot.get(j).getX(), charloot.get(j).getY()) <= 20)
      //   loser = true;

      if(dist(bullet.get(i).getX(), bullet.get(i).getY(), charloot.get(j).getX(), charloot.get(j).getY()) <= 20){
        charloot.remove(j);
        bullet.remove(i); //crashes program without break
        break;
      }
      if(bullet.size() >= 5)
        bullet.remove(0);
    }
  }
}
public void lose()
{
   fill(0);
   stroke(0);
   rect(0,0,900,900);
   fill(255);
   textSize(48);
   textAlign(CENTER);
   text("YOU LOSE", 450,400);
   textSize(28);
   text("Press L to restart", 450, 500);
}
public void win()
{
   fill(0);
   stroke(0);
   rect(0,0,900,900);
   fill(255);
   textSize(48);
   textAlign(CENTER);
   text("YOU WIN", 450,400);
   textSize(28);
   text("Press L to restart", 450, 500);
}
public void keyPressed()
{
  if(key == 'l')
  {
   charloot = new ArrayList <Asteroid>();
   bullet = new ArrayList <Bullet>();
   for(int i=0;i<sky.length;i++)
    {
      sky[i] = new Star();
    }
  for(int j = 0; j < asteroids; j++)
    charloot.add(new Asteroid());
    loser = false;
  }
  if(loser == true)
    return;

  int degRot = 20;  //can change
  if(key == 'w') 
  {
    bob.accelerate(0.2);
    // System.out.println("ಠ_ಠ");
  }
  if(key == 's')
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
  if(key == ' ')//-------------------------------BULLET-------------------------------------------------
  {
    bullet.add(new Bullet(bob));
    
    // bullet.move();
    // bullet.show();

  }
    
  if (key == 'r')
  {
    bob.setX((int)(Math.random()*600));
    bob.setY((int)(Math.random()*600));
    for(int i = 0; i <charloot.size(); i++)
    {
    if(bob.getX() == charloot.get(i).getX() && bob.getY() == charloot.get(i).getY())
    {
     bob.setX((int)(Math.random()*600));
     bob.setY((int)(Math.random()*600));
    }
  }
 }
}

class Bullet extends Floater
{
  private double dRadians;
  Bullet(SpaceShip phteven)
  {
    myCenterX = phteven.getX();
    myCenterY = phteven.getY();
    myPointDirection = phteven.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + phteven.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + phteven.getDirectionY();
    
  }
  public void show()
  {
    fill(255,0,0);
    stroke(255,0,0);
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);  
  }
  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
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
class Star
{
  private int starX, starY;
  Star()
  {
    starX = (int)(Math.random()*900);
    starY = (int)(Math.random()*900);
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
  public SpaceShip(int x,int y)
  {
    myCenterX = x;
    myCenterY = y;
  }
  public SpaceShip()
  {
      corners = 4;
      int[] xS = {-8,16,-8,-2}; //change
      int[] yS = {-8,0,8,0};  //change
      xCorners = xS;
      yCorners = yS;
      myCenterX = 450;
      myCenterY = 450;
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
  // Asteroid(int x, int y)
  // {
  //   myCenterX = x;
  //   myCenterY = y;
  // }

private float rotSpeed;
public Asteroid()
    {
      corners = 6;
      int[] xS = {-11,7,13,6,-11,-5};
      int[] yS = {-8,-8,0,10,8,0}; 
      xCorners = xS;
      yCorners = yS;
      myCenterX = ((Math.random()*600));/*10)+ 580); */
      myCenterY = ((Math.random()*600));/*10)+ 580);*/
      myColor = 255;
      myPointDirection = (int)(Math.random()*360); //degrees

      if(Math.random()<.5)
         myDirectionX = (int)((Math.random()*1)-2);
      else
        myDirectionX = (int)((Math.random()*1)+2);

      if(Math.random()>.5)
         myDirectionY = (int)((Math.random()*1)-2);
      else
        myDirectionY = (int)((Math.random()*1)+2);

      rotSpeed = (int)((Math.random()*4)+1); //what is this
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
       // setDirectionX(Math.random());
       // setDirectionY(Math.random());
       // setX((int)((Math.random()*10 )+ 580));
       // setY((int)((Math.random()*10 )+ 580)); 
    }
    public void show()
    {
      // fill(myColor);  
    fill(255); 
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
  public void show ()  /*Draws the floater at the current position */
  {             
    // fill(myColor);  
    fill(0); 
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