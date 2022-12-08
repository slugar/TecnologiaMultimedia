class Ladrillo
{
  float x; //ladrillo x
  float y; //ladrillo y
  float w; //ladrillo width
  float h; //ladrillo height
  float r; //ladrillo rojo
  float g; //ladrillo verde
  float b; //ladrillo azul

  boolean hit; //si el ladrillo ha sido golpeado o no


  Ladrillo(float x0, float y0)
  {
    x = x0;
    y = y0;

    //colores
    r = random(128, 255);
    g = random(128, 255);
    b = random(128, 255);
    w = 50; // width del ladrillo 
    h = 25; // height dedl ladrillo

    hit = false; //al comienzo el ladrillo no golpea
  }

  //dibujo del ladrillo 
  void update()
  {
    noStroke();
    fill(r, g, b);
    rect(x, y, w, h);
  }

  //que pasa si un ladrillo es golpeado
  void gotHit()
  {
    hit = true; //reconoce que el ladrillo ha sido golpeado

    r = 0;
    g = 0;
    b = 0;
    rect(x, y, w, h);
  }
}
