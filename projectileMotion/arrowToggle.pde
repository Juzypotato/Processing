
class Arrowtoggle {
  boolean arrows;
  PVector location;

  Arrowtoggle() {
    // Variabler du kan endre for å leke med ;)
    location = new PVector(width - 100, 100);
  }

  void update() {
    display();
  }

  void display() {
    noStroke();
    fill(200);
    rect(location.x, location.y, 50, 50);
    textSize(36);
    fill(0);
    text("Vect", location.x + 25, location.y + 25);
  }
}
