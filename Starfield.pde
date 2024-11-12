class Particle {
  float x, y;
  float angle, speed;
  
  Particle() {
    x = random(width);     
    y = random(height);    
    angle = random(TWO_PI); 
    speed = random(1, 3);   
  }

  void move() {
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    
    // Wrap around edges
    if (x < 0) x = width;
    if (x > width) x = 0;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }

  void show() {
    fill(255, 150, 0);  
    ellipse(x, y, 10, 10);  
  }
}

class OddballParticle extends Particle {
  void show() {
    fill(0, 255, 0);  
    rect(x, y, 10, 10);  
  }
}

Particle[] particles = new Particle[50]; 

void setup() {
  size(800, 600);
  for (int i = 0; i < particles.length; i++) {
    if (i == 0) {
      particles[i] = new OddballParticle(); 
    } else {
      particles[i] = new Particle(); 
    }
  }
}

void draw() {
  background(135, 206, 235); 
  for (Particle p : particles) {
    p.move();
    p.show();
  }
}
