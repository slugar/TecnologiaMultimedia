class Paleta 
{
  float x; //paleta x
  float y; //paleta y
  float w; //paleta width
  float h; //paleta height
  float r; //paleta en rojo
  float g; //paleta verde
  float b; //paleta azul

  //constructor paleta
  Paleta()
  {
    x = width/2;
    y = 500;
    w = 100;
    h = 10;
    r=255;
    g=255;
    b=255;
  }

  void update()
  {
    //la paleta sigue al mouse
    x = mouseX;    

    //dibujo de paleta
    fill(r, g, b);
    rect(x, y, w, h);
  }
}
