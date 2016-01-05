ArrayList<Raindrop> r = new ArrayList<Raindrop>();//declare a new Raindrop arraylist called r
PImage back;//declare a PImage for the background
Catcher bucket;//declare a catcher
PFont fon;//declare a font
int caught;//declare a variable to store the amount of raindrops caught

void setup()
{
  size(800, 600);
  r.add(new Raindrop(random(width), 0));//add 1 raindrop to r at a given x and y position
  back = loadImage("beach_stones_high_grass_sea_clouds_cloudy_800x600_hd-wallpaper-234683.jpg");//initialize background image
  bucket = new Catcher(80);//initialize the catcher
  fon = createFont("Comic Sans MS", 24);//initialize the font
  caught = 0;//initialize the number of raindrops caught
}

void draw()
{
  background(back);
  
  stroke(0);
  fill(200);
  rect(0, height - 150, 100, height);//draw a gray box in the lower left corner
  
  textFont(fon);
  fill(0);
  textAlign(CENTER);
  text(caught, 50, height - 70);//display the number of raindrops caught in the box
  text("Catch 1000 raindrops as fast as you can!", width / 2, 50);//display the instructions at the top of the screen
  
  r.add(new Raindrop(random(width), 0));//add a new raindrop
  
  for(int i = r.size() - 1; i >= 0; i--)//for each raindrop
  {
    Raindrop temp = r.get(i);
    temp.fall();//make the raindrop fall
    temp.display();//display the raindrop
    if (temp.isInContactWith(bucket))//check to see if the raindrop is in contact with the bucket
    {
      r.remove(i);//if it is, remove the raindrop
      caught++;//add 1 to the number of raindrops caught
    }
    if (temp.loc.y > height + temp.diam/2)//check to see if the raindrop goes below the bottom of the screen
    {
      r.remove(i);//if it does, remove the raindrop
    }
  }
  
  bucket.update();//update the position of the bucket
  bucket.display();//display the bucket
  
  if(millis() % 8000 <= 100 || (millis() % 8000 <= 500 && millis() % 8000 >= 400))//every 8 seconds for 2 0.1-second pulses
  {
    fill(255, 100);
    rect(0, 0, width, height);//make a transparent white flash
  }
}