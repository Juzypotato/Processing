
class World {
  //Public variables
  PVector g;
  int projectiles = 100;
  
  Pro[] pros = new Pro[projectiles];
  
  World() {
    // Variabler du kan leke med
    float gravity = 1;
    
    //------------
    for (int i = 0; i < pros.length; i++) {
      pros[i] = new Pro();
    }
    g = new PVector(0, gravity);
  }
  
  void bounce(){
    for (int i = 0; i < pros.length; i++) {
      pros[i].applyForce(new PVector(0, -100));
    }
  }
  
  void update() {
    for (int i = 0; i < pros.length; i++) {
      pros[i].applyForce(g);
      pros[i].update();
      pros[i].display();
      pros[i].checkEdges();
      //pros[i].applyForce(pros[i].drag());
    }
  }
}
