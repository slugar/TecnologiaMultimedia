class pelota
{

  float x;  //pelota x
  float y; //pelota y
  float vx; //velocidad en X
  float vy; //velocidad en Y
  float D; //diametro

  //constructor de pelota
  pelota()
  {
    x = 300;
    y = 400;
    vx = 0; //al prencipio la pelota cae en vertical
    vy = 4; 
    D = 10;
  }

  //actualizacion
  void actualizar()
  {
    noStroke();
    fill(255);
    ellipse(x, y, D, D);

    y += vy; //incremento y
    x += vx; //incremento x
  }

  //direccion de la pelota a la izquierda
  void goLeft()
  {
    vx = -4; //decrece en X
  }

  //direccion de la pelota a la derecha
  void goRight()
  {
    vx = 4; //incremento en X
  }

  //cambiar la direccion de la pelota en Y
  void changeY()
  {
    vy *= -1; 
  }
  

  //reseteo de la pelota en el caso de perder una vida
  void reset()
  {
    x = 300;
    y = 400;
    vx = 0;
    vy = 4;
  }
}
