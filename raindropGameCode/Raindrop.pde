class Raindrop
{
  PVector loc, vel, acc;//declare movement vectors and diameter
  float diam;
  Raindrop(float x, float y)
  {
     loc = new PVector(x, y);//initialize movement vectors and diameter
     vel = new PVector(0, 0);
     acc = new PVector(0, 0.25);
     diam = 40;
  }
  void fall()
  {
    loc.add(vel);//update location and velocity
    vel.add(acc);
  }
  void display()
  {
    noStroke();//set stroke and fill
    fill(0, 0, 255);
    ellipse(loc.x, loc.y, diam, diam);//draw the raindrop at its current location
  }
  boolean isInContactWith(PVector p)
  {
    if(loc.dist(p) <= diam / 2)//if the point is within the radius from the current location
    {
      return true;//return that it is in contact
    }
    else
    {
      return false;//return that it is not in contact
    }
  }
  void reset()
  {
    loc.set(random(width), 0);//move the raindrop to a random location on the top of the canvas
    vel.set(0, 0);//reset its velocity to 0
  }
}