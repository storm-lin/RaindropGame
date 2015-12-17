class Catcher
{
  float diam;//declare diameter and position vector
  PVector loc;
  Catcher(float t)//construct with diameter as a parameter
  {
    diam = t;
    loc = new PVector();
  }
  void update()//move the catcher to the current mouse position
  {
    loc.set(mouseX, mouseY);
  }
  void display()//draw the catcher
  {
    stroke(0);
    fill(100);
    quad(loc.x - diam/2, loc.y - diam/2, loc.x + diam/2, loc.y - diam/2, loc.x + diam/3, loc.y + diam/2, loc.x - diam/3, loc.y + diam/2);
  }
}