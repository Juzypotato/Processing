
class Pro {
  //Public variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float size;
  float speed;
  float c;
  int farge;
  boolean arrows;

  Pro() {
    // Variabler du kan endre for å leke med ;)
    mass = random(3, 12)*2;
    size = random(10, 50)*2;
    speed = random(10, 30);
    c = 0.005;
    farge = color(random(0, 255), random(0, 255), random(0, 255));

    //----------------------------------------
    location = new PVector(size, 10);
    velocity = new PVector(speed, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void velocityarrow() {
    stroke(0);
    strokeWeight(3);
    line(location.x, location.y, location.x + velocity.x * 3, location.y);

    line(location.x, location.y, location.x, location.y + velocity.y * 3);
  }

  PVector drag() {
    // Magnitude is coefficient * speed squared
    float speed = velocity.mag();
    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = velocity.get();
    dragForce.mult(-1);

    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }

  void checkEdges() {

    if (location.x + size / 2 > width) {
      location.x = width - size / 2;
      velocity.x *= -1;
    } else if (location.x - size / 2 < 0) {
      velocity.x *= -1;
      location.x = 0 + size / 2;
    }

    if (location.y + size / 2 > height) {
      velocity.y *= -1;
      location.y = height - size / 2;
      //velocity.x *= 0.9;
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(farge);
    ellipse(location.x, location.y, size, size);
    if (arrowsOn) {
      velocityarrow();
    }
  }
}
