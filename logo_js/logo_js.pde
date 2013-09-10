PImage img;
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
  img = loadImage ("logo.png");
  sampling = 2;

  loadPixels();

  int w = img.width;
  int h = img.height;

  int xOffset = (width - w ) /2 ;
  int yOffset = (height - h ) /2 ;

  for ( int x = 0 ; x < w ; x+=sampling )
  {
    //Loop through all the columns
    for ( int y = 0 ; y < h ; y+=sampling )
    {

      PVector pos = new PVector (x, y);
      color tempColor = pixels[x + (y * width)];
      //particles.add (new Particle(width/2, 0, 48))
      particles = new ArrayList<Particle>();
      particles.add ( new Particle ( pos, tempColor ) ) ;
    }
  }

  frameRate (30);
  numParticles = (img.width * img.height) / sampling;

  cursorMode = 0;
  forceRadius = 45;
  friction = 0.85;
  springFactor = 0.12;
  springEnabled = true;
}

void draw () {
  image (img, 0, 0);
  PVector diff = new PVector();
  float dist;
  float ratio;
  PVector mousePos = new PVector (mouseX, mouseY);

  for (int i = 0; i < particles.size(); i++) {

    particles.get(i).velocity.x *= friction;
    particles.get(i).velocity.y *= friction;

    particles.get(i).acceleration = new PVector();
    diff.x = mousePos.x - particles.get(i).position.x;
    diff.y = mousePos.y - particles.get(i).position.y;

    dist = dist(0, 0, diff.x, diff.y);

    if ( dist < forceRadius )
    {
      ratio = -1 + dist / forceRadius ;
      //Repulsion
      if ( cursorMode == 0 ) {
        particles.get(i).acceleration.x -= ( diff.x * ratio);
        particles.get(i).acceleration.y -= ( diff.y * ratio);
       
      } else {
        particles.get(i).acceleration.x += ( diff.x * ratio);
        particles.get(i).acceleration.y += ( diff.y * ratio);
      }
    }
  }
}

