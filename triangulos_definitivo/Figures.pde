
class Figures {
  
  Circle[] circles = new Circle[3];
  Triangle triang = new Triangle();
  
  // Centro del conjunto de figuras
  PVector figureCenter = new PVector();
  
  // Incremento que decrece/crece la figura tras actualizar la posicion de los círculos
  float changeTriangle = 0.005;
  float changeCircle = 0.003;
  
  
  Figures() {
    for(int i = 0; i < circles.length; i++) {
      circles[i] = new Circle(i);  
    } 
  }
  
  float getTriangleArea() {
    return abs(circles[0].position.x * (circles[1].position.y - circles[2].position.y) + circles[1].position.x * (circles[2].position.y - circles[0].position.y) + circles[2].position.x * (circles[0].position.y - circles[1].position.y)) / 2.0;
  }
  
  
  float getAverageCircleSize() {
    float mean = 0;
    for(int i = 0; i < circles.length; i++) mean += circles[i].size;
    return mean / 3;
  
  }
  
  // Actualizamos el tamaño de las figuras
  void calculateFiguresNewSize() {
    for (int i = 0; i < 3; i++) {
      if(triang.expand) {
        circles[i].position.x = lerp(circles[i].position.x, figureCenter.x, -changeTriangle);
        circles[i].position.y = lerp(circles[i].position.y, figureCenter.y, -changeTriangle);
      } else {
        circles[i].position.x = lerp(circles[i].position.x, figureCenter.x, changeTriangle);
        circles[i].position.y = lerp(circles[i].position.y, figureCenter.y, changeTriangle);
      } 
      
      if(circles[i].expand) {
        circles[i].setNewSize(lerp(circles[i].size, 10, -changeCircle));
      } else {
        circles[i].setNewSize(lerp(circles[i].size, 10, changeCircle));
      }
    }
  }
  
  
  // Calculamos el centro de la figura para poder encogerla hacia él
  void calculateFigureCenter() {
    figureCenter.set(0, 0);
    
    for (int i = 0; i < 3; i++) figureCenter.add(circles[i].position);
    figureCenter.div(3);
  }
  
  
  // Randomizamos los polígonos al inicio de un nuevo intervalo
  void randomizeFigures() {
    for(int i = 0; i < circles.length; i++) {
      circles[i].setNewColor();
      circles[i].setNewPosition(new PVector(random(width), random(height)));
      circles[i].setNewSize(random(100, 244));
      circles[i].randomizeExpansionReduction();
    }
    
    triang.setNewColor();
    triang.randomizeExpansionReduction();
    
    calculateFigureCenter(); // Calculamos el nuevo centro
  }
  
  
  // Dibujamos las figuras
  void drawFigures() {

    for(int i = 0; i < circles.length; i++) {
     drawCircle(i);
    } 
    fill(triang.triangleColor);
    triangle(circles[0].position.x, circles[0].position.y, circles[1].position.x, circles[1].position.y, circles[2].position.x, circles[2].position.y);
  }
  
  
  // Dibujamos los círculos
  void drawCircle(int selectedCircle) {
    noStroke();
    fill(circles[selectedCircle].circleColor);
    ellipse(circles[selectedCircle].position.x, circles[selectedCircle].position.y, circles[selectedCircle].size, circles[selectedCircle].size);
  }
}
