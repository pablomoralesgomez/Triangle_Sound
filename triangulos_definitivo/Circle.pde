
class Circle {
  
  // Posicion del círculo
  PVector position = new PVector(0, 0);
  
  // Color del círculo
  color circleColor = color(0, 0, 0);
  
  // Tamaño de los círculos
  float size = 100;
  
  // Boolean -> true: expandimos el círculo | false: reducimos el círculo
  boolean expand = false;
  
  // Randomizer
  Random rd;
  
  
  Circle(long seed) {
    rd = new Random(seed);
  }
  
  
  // Usamos la clase Random obtener un nuevo boolean
  void randomizeExpansionReduction() {
    expand = rd.nextBoolean();
  }
  
  
  // Setters
  void setNewColor() {
    circleColor = color(random(255), random(255), random(255));
  }
  
  
  void setNewPosition(PVector newPosition) {
    position = newPosition;
  }
  
  
  void setNewSize(float newSize) {
    size = newSize;
  }
  
}
