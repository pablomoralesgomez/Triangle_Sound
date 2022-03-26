import java.util.Random;

class Triangle {
  
  // Color del triángulo
  color triangleColor = color(0, 0, 0);
  
  // Boolean -> true: expandimos el triangulo | false: reducimos el triangulo
  boolean expand = false;
  
  // Randomizer
  Random rd = new Random(System.currentTimeMillis());
  
  
  // Usamos la clase Random obtener un nuevo boolean
  void randomizeExpansionReduction() {
    expand = rd.nextBoolean();
  }
  
  
  // Setters
  void setNewColor() {
    triangleColor = color(random(255), random(255), random(255));
  }
}
