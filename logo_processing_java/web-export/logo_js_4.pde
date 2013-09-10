/* @pjs preload="logo.jpg, logo.png, sprite.jpg";*/

PImage img;
PImage sprite;
int sampling;
ArrayList <Particle> particles;
int numParticles;

boolean springEnabled;
float forceRadius;
float friction;
float springFactor;
int cursorMode;

void setup () {

  size (709, 70);
  img = loadImage ("logo.jpg");
  sprite = loadImage ("sprite.jpg");

  sampling = 10;

  particles = new ArrayList<Particle>();

  img.loadPixels();

  int w = img.width;
  int h = img.height;

  int xOffset = (width - w ) /2 ;
  int yOffset = (height - h ) /2 ;

  for ( int x = 0 ; x < w ; x+=sampling )
  {
    //Loop through all the columns
    for ( int y = 0 ; y < h ; y+=sampling )
    {

      PVector pos = new PVector (x - xOffset, y - yOffset);
      color tempColor = img.pixels[x + (y * width)];
      //particles.add (new Particle(width/2, 0, 48))
      if (tempColor != color (255)) particles.add ( new Particle ( pos, tempColor ) ) ;
    }
  }
  
  frameRate (30);
  numParticles = (img.width * img.height) / sampling;

  cursorMode = 0;
  forceRadius = 45;
  friction = 0.85;
  springFactor = 0.02;
  springEnabled = true;
}

void draw () {

  background (255);
  //image (img, 0, 0);
  PVector diff = new PVector(0, 0);
  float dist;
  float ratio;
  PVector mousePos = new PVector (mouseX, mouseY);

  for (int i = 0; i < particles.size(); i++) {

    ratio = 1.0;

    particles.get(i).velocity.mult(friction);
    particles.get(i).acceleration = new PVector();

    diff = PVector.sub(mousePos, particles.get(i).position);

    dist = dist(0, 0, diff.x, diff.y);

    if ( dist < forceRadius )
    {
      ratio = -1 + dist / forceRadius ;
      //Repulsion
      if ( cursorMode == 0 ) {
     
        PVector tempDiff = PVector.mult(diff, ratio);
        particles.get(i).acceleration.sub(tempDiff);
      } 
      else {
        PVector tempDiff = PVector.mult(diff, ratio);
        particles.get(i).acceleration.add(tempDiff);
      }
    }

    if ( springEnabled ) {
      //Move back to the original position
      particles.get(i).acceleration.x += springFactor * (particles.get(i).spawnPoint.x - particles.get(i).position.x);
      particles.get(i).acceleration.y += springFactor * (particles.get(i).spawnPoint.y - particles.get(i).position.y) ;
     // if (i%50 == 0) println (particles.get(i).spawnPoint.x - particles.get(i).position.x) ;
    }

    particles.get(i).velocity.add(PVector.mult(particles.get(i).acceleration, ratio));
    particles.get(i).position.add(particles.get(i).velocity);
  }  

  for (int i = 0; i < particles.size(); i++) {

    //stroke (particles.get(i).col);
    //rect (particles.get(i).position.x, particles.get(i).position.y, 3, 3);
    tint (particles.get(i).col);
    image (sprite, particles.get(i).position.x, particles.get(i).position.y);
    
  }

  //println (particles.size());
}
class Particle {
  
 PVector position, velocity;
 PVector acceleration;
 PVector spawnPoint;
 color col;
 
 Particle (PVector _position, color _color)
 {
   acceleration = new PVector();
   position = _position;
   col = _color;
   //velocity = new PVector (random (-5, 5), random (-5, 5));
   velocity =  new PVector();
   spawnPoint = new PVector();
   spawnPoint.x = _position.x;
   spawnPoint.y = _position.y;
   //spawnPoint = new PVector();
 }
 
}


