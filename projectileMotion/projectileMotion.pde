import processing.opengl.*;

// Global variables
World world;
Arrowtoggle arrows;
boolean arrowsOn;


void setup() {
  fullScreen(OPENGL);
  smooth(4);
  //size(800, 600);
  world = new World();
  arrows = new Arrowtoggle();
  arrowsOn = false;
  
}

void mousePressed() {
  world.bounce();

  if (mouseX > arrows.location.x && mouseX < arrows.location.x + 50 && mouseY > arrows.location.y && mouseY < arrows.location.y + 50) {
    if (arrowsOn) {
      arrowsOn = false;
    } else {
      arrowsOn = true;
    }
    for (int i = 0; i < world.pros.length; i++) {
      world.pros[i].applyForce(new PVector(0, 100));
    }
  }
}

void draw() {
  background(50);
  world.update();
  arrows.update();
}
