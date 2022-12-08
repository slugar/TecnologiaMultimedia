
Juego miJuego;

void setup() {
  size(600, 600);
  background(0);
  smooth();
  miJuego = new Juego();
}


void draw()
{
  background(0);

  miJuego.update();
}

void mousePressed() {
  miJuego.click();
}
