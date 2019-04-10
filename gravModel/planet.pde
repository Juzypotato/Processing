
class Planet {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float centermass;
  float G; //Grav const

  Planet() {
    location = new PVector(width/4, height/2);
    velocity = new PVector(0, -2.5);
    acceleration = new PVector(0, 0);
    mass = 0.1;
    centermass = 100;
    G = 1;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  PVector mousePull() {
    PVector mouse = new PVector(width/2, height/2);
    PVector force = PVector.sub(location, mouse);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d, 5.0, 25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * centermass) / (d * d);      // Calculate gravitional force magnitude
    force.mult(strength);        // Get force vector --> magnitude * direction
    force.mult(-1);
    return force;
  }

  void update() {
    applyForce(mousePull());
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
    acceleration.mult(0);
  }

  void display() {
    stroke(3);
    ellipse(location.x, location.y, 20, 20);
    ellipse(width/2, height/2, 10, 10);
  }
}
