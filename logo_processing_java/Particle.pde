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

