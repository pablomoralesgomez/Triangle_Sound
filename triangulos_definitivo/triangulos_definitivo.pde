import processing.sound.*;


// Objeto que maneja el dibujado y tamaños de los círculos
Figures figures = new Figures();

// Objeto que maneja los osciladores que suenan, su frecuencia, amplitud, inicio y parada
SoundManager sound = new SoundManager(figures, this);

// Duracion de cada intervalo visual/auditivo e inicio del anterior intervalo
float intervalDuration, intervalStart;


void setup() {
  size(800, 600);
  
  startNewInterval();
  figures.randomizeFigures();
  
}


void draw() {
  background(200);
  
  figures.drawFigures();
  figures.calculateFiguresNewSize();
  
  sound.setOscillatorAmpFreq();
  //print("circle size: " + figures.getAverageCircleSize() + "\n");
  //print("triangle area: " + figures.getTriangleArea() + "\n");
  
  if(checkEndInterval()) {
    
    sound.stopSound();
    
    figures.randomizeFigures();
    sound.setNewOscillator();
    
    startNewInterval();
    sound.playSound();
  }
}


// Empezamos un nuevo intervalo de tiempo
void startNewInterval() {
  intervalDuration = random(0.5, 3); // Dura entre medio y 3 segundos
  intervalStart = millis();
}


// Comprobamos si ha concluido el intervalo de tiempo
boolean checkEndInterval() {
  return millis() - intervalStart >= intervalDuration * 1000;
}
