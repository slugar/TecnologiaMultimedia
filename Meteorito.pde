class meteorito
{
  float x; //meteorito x
  float y; //meteorito y
  float vy; //meteorito vy
  float g; //gravedad
  float maxDist; //delimita en Y el viaje del meteorito para resetearse 


  // constructor del meteorito
  meteorito()
  {
   
    x = random(10, width-10); //genera meteoritos en una posicion aleatoria en lo alto de la pantalla
    y = 0; //meteorito empieza en Y
    vy = 2; //velocidad en Y de meteorito 
    g = 0.4; //gravedad

    maxDist = 10000;
  }

  void update()
  {
    //dibujo meteorito
    noStroke();
    fill(255, 0, 0); //color rojo al meteorito  
    beginShape();
    vertex(x, y);
    vertex(x-5, y-10);
    vertex(x-5, y-50);
    vertex(x, y-25);
    vertex(x+5, y-50);
    vertex(x+5, y-10);
    endShape(CLOSE);

    y += vy; //incremento en Y
    vy += g; //gravedad
  }


  //genera meteoritos en lo alto
  void resetMeteorito()
  {
    x = random(10, width-10); 
    y = 0;
    vy = 2;

    //volver a dibujar el meteorito
    noStroke();
    fill(255, 0, 0);
    beginShape();
    vertex(x, y);
    vertex(x-5, y-10);
    vertex(x-5, y-50);
    vertex(x, y-25);
    vertex(x+5, y-50);
    vertex(x+5, y-10);
    endShape(CLOSE);
  }
}
