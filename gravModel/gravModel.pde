
Planet p;
//boolean keyz[] = new boolean [4];
PVector g;

void setup() {
  size(600, 600);
  p = new Planet();
  //g = new PVector(0, 0.1);
  background(51);
  ellipseMode(CENTER);
}

void draw() {
  //controls();
  //p.applyForce(g);
  p.update();
  p.display();
}

//void keyPressed() {
//  if (key == 'w')  keyz[0] = true;
//  if (key == 'a')  keyz[1] = true;
//  if (key == 's')  keyz[2] = true;
//  if (key == 'd')  keyz[3] = true;
//}

//void keyReleased() {
//  if (key == 'w')  keyz[0] = false;
//  if (key == 'a')  keyz[1] = false;
//  if (key == 's')  keyz[2] = false;
//  if (key == 'd')  keyz[3] = false;
//}

//void controls() {
//  if (keyz[3]) {
//    PVector r = new PVector(0.5, 0);
//    p.applyForce(r);
//  }
//  if (keyz[2]) {
//    PVector d = new PVector(0, 0.5);
//    p.applyForce(d);
//  }
//  if (keyz[1]) {
//    PVector l = new PVector(-0.5, 0);
//    p.applyForce(l);
//  }
//  if (keyz[0]) {
//    PVector u = new PVector(0, -0.5);
//    p.applyForce(u);
//  }
//}
