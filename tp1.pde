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

float prevMouseX, prevMouseY;
PImage imagen;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  frameRate(60);

  centroX = width / 2;
  centroY = height / 2;

  margen = (tamanoInicial - tamanoFinal) / cantidadCirculos;

  prevMouseX = mouseX;
  prevMouseY = mouseY;

  imagen = loadImage("img.png");
  if (imagen != null) {
    imagen.resize(int(tamanoInicial), int(tamanoInicial));
  }

  if (imagen == null) {
    println("Error al cargar la imagen");
  } else {
    println("Imagen cargada correctamente");
  }
}

void draw() {
  background(0);

  // Calcula la velocidad de rotación en función de la distancia del mouse al centro
  float distancia = dist(mouseX, mouseY, centroX, centroY);
  velocidadRotacion = map(distancia, 0, width / 25, 0, 0.1);

  // Cambia el color del círculo exterior en función de la posición del mouse
  if (dist(mouseX, mouseY, centroX, centroY) < tamanoInicial / 2) {
    float umbralColor = map(distancia, 0, width / 2, 0, 255);
    colorCirculo = color(0, 0, 255, umbralColor);
    colorCentro = lerpColor(color(255), color(0), umbralColor / 255);
  } else {
    float umbralColor = map(distancia, tamanoInicial / 2, width / 2, 0, 255);
    colorCirculo = color(255, 0, 0, umbralColor);
    colorCentro = lerpColor(color(0), color(255), umbralColor / 255);
  }

  // Dibuja los círculos que rotan
  pushMatrix();
  translate(centroX, centroY);
  rotate(radians(angulo));

  for (int i = 0; i < cantidadCirculos; i++) {
    float tamanoCirculo = tamanoInicial - i * margen;
    float colorRelleno = map(i, 0, cantidadCirculos - 1, 0, 255);

    pushMatrix();
    rotate(radians(-angulo * (i + 1)));

    // Calcula el tamaño de la imagen para que se ajuste al círculo
    float escala = tamanoCirculo / tamanoInicial;

    // Dibuja la imagen centrada y ajustada al círculo
    imageMode(CENTER);
    image(imagen, 0, 0, imagen.width * escala, imagen.height * escala);

    popMatrix();

    fill(lerpColor(colorCirculo, color(0), colorRelleno / 255));
    ellipse(0, 0, tamanoCirculo, tamanoCirculo);
  }

  popMatrix();

  angulo += velocidadRotacion;

  // Dibuja el círculo blanco en el centro
  fill(colorCentro);
  ellipse(centroX, centroY, 100, 100);

  // Calcula la velocidad del mouse
  float velocidadMouse = dist(mouseX, mouseY, prevMouseX, prevMouseY);

  // Dibuja el efecto glitch cuando la velocidad del mouse supera el umbral
  if (velocidadMouse > umbralGlitch) {
    stroke(255);

    for (int y = 0; y < height; y += 10) {
      line(0, y, width, y);
    }
  }

  // Actualiza la posición anterior del mouse
  prevMouseX = mouseX;
  prevMouseY = mouseY;
}
