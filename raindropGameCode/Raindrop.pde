class Raindrop
{
  PVector loc, vel, acc;
  float diam;
  Raindrop(float x, float y)
  {
     loc = new PVector(x, y);
     vel = new PVector(0, 0);
     acc = new PVector(0, 0.25);
     diam = 30;
  }
  void fall()
  {
    loc.add(vel);
    vel.add(acc);
  }
  void display()
  {
    noStroke();
    fill(0, 0, 255);
    ellipse(loc.x, loc.y, diam, diam);
  }
  boolean isInContactWith(PVector p)
  {
    if(loc.dist(p) <= diam / 2)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  void reset()
  {
    loc.set(random(width), 0);
    vel.set(0, 0);
  }
}