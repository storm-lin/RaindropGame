ArrayList<Raindrop> r = new ArrayList<Raindrop>();      //declare a new Raindrop arraylist called r
PImage back;//declare a PImage
Catcher bucket;//declare a catcher

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test

void setup() {
  size(800, 600);
  r.add(new Raindrop(random(width), 0));   //Initialize r. The parameters used are the initial x and y positions
  back = loadImage("beach_stones_high_grass_sea_clouds_cloudy_800x600_hd-wallpaper-234683.jpg");//initialize background image
  bucket = new Catcher(80);//initialize the catcher
}

void draw() {
  background(back);
  r.add(new Raindrop(random(width), 0));
  for (int i = r.size() - 1; i >= 0; i--)//for each raindrop
  {
    Raindrop temp = r.get(i);
    temp.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    temp.display();      //display the raindrop
    if (temp.isInContactWith(bucket)) {      //check to see if the raindrop is in contact with the bucket
      r.remove(i);                         //if it is, remove the raindrop
    }
    if (temp.loc.y > height + temp.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r.remove(i);                           //if it does, remove the raindrop
    }
  }
  bucket.update();
  bucket.display();
}