float angulo = 0;
float velocidadRotacion;
color colorCirculo;
color colorCentro;
float centroX, centroY;
float umbralGlitch = 10;
float tamanoGradiente = 150;
int cantidadCirculos = 6;
float margen;
float tamanoInicial = 400;
float tamanoFinal = 100;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  frameRate(60);
  
  centroX = width / 2;
  centroY = height / 2;
  
  margen = (tamanoInicial - tamanoFinal) / cantidadCirculos;
}

void draw() {
  background(0);
  
  // Calcula la velocidad de rotación en función de la distancia del mouse al centro
  float distancia = dist(mouseX, mouseY, centroX, centroY);
  velocidadRotacion = map(distancia, 0, width / 2, 0, 0.1);
  
  // Cambia el color del círculo exterior en función de la posición del mouse
  if (mouseX > 400 && mouseY > 400) {
    float umbralColor = map(distancia, 0, width / 2, 0, 255);
    colorCirculo = color(0, 0, 255, umbralColor);
    colorCentro = lerpColor(color(255), color(0), umbralColor / 255);
  } else {
    float umbralColor = map(distancia, 0, width / 2, 0, 255);
    colorCirculo = color(255, 0, 0, umbralColor);
    colorCentro = lerpColor(color(0), color(255), umbralColor / 255);
  }
  
  // Dibuja los círculos que rotan
  translate(centroX, centroY);
  rotate(radians(angulo));
  
  for (int i = 0; i < cantidadCirculos; i++) {
    float tamanoCirculo = tamanoInicial - i * margen;
    float colorRelleno = map(i, 0, cantidadCirculos - 1, 0, 255);
    fill(lerpColor(colorCirculo, color(0), colorRelleno / 255));
    ellipse(0, 0, tamanoCirculo, tamanoCirculo);
  }
  
  angulo += velocidadRotacion;
  
  // Dibuja el círculo blanco en el centro
  float distanciaCentro = dist(mouseX, mouseY, centroX, centroY);
  
  if (distanciaCentro < tamanoGradiente) {
    float cantidadGradiente = map(distanciaCentro, 0, tamanoGradiente, 0, 255);
    colorCentro = lerpColor(colorCentro, color(255), cantidadGradiente / 255);
  }
  
  fill(colorCentro);
  ellipse(centroX, centroY, 100, 100);
  
  // Dibuja el efecto glitch en coordenadas fijas
  float velocidadMouse = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  if (velocidadMouse > umbralGlitch) {
    pushMatrix(); // Guarda la transformación actual
    translate(0, 0); // Mueve el origen al punto (0, 0)
    rotate(radians(angulo)); // Aplica la rotación
      
    stroke(255);
    
    for (int y = 0; y < height; y += 10) {
      line(0, y, width, y);
    }
    
    popMatrix(); // Restaura la transformación guardada
  }
}
