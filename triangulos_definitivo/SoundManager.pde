import java.util.*;

class SoundManager {
  
  // Figuras que se visualizan, a partir de cuyos tamaños modificaremos 
  Figures fig;
  
  // Mapa con los diferentes osciladores que pueden sonar
  Map<Integer, Oscillator> oscillators = new HashMap<Integer, Oscillator>();
  
  // Key del oscilador usado en el intervalo actual 
  Integer oscKey = 0;
  
  SoundManager(Figures fig, PApplet mainPage) {
    this.fig = fig;
    
    oscillators.put(0, new TriOsc(mainPage));
    oscillators.put(1, new SawOsc(mainPage));
    oscillators.put(2, new SqrOsc(mainPage));
  }
  
  
  // Comprobamos que círculo es el mayor y seleccionamos el oscilador que tenga asociado
  void setNewOscillator() {
    float maxSize = fig.circles[0].size;
    int indexMaxSize = 0;
    
    for(int i = 1; i < fig.circles.length; i++) {
      if(fig.circles[i].size >= maxSize) {
        maxSize = fig.circles[i].size;
        indexMaxSize = i;
      }
    }
    
    oscKey = indexMaxSize;
  }
  
  // Modificamos la amplitud y frecuencia del oscilador en funcion del area del triangulo y la media del tamaño de los círculos
  void setOscillatorAmpFreq() {
    oscillators.get(oscKey).amp(map(fig.getAverageCircleSize(), 80, 300, 0, 1));  
    oscillators.get(oscKey).freq(map(fig.getTriangleArea(), 500, 170000, 20.0, 500.0));
  }
  
  
  void playSound() {
    oscillators.get(oscKey).play();
  }
  
  
  void stopSound() {
    oscillators.get(oscKey).stop();
  }
}
