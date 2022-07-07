void marcador(){
  textSize(50);
  fill(255);
  text(marcador,250,50);
  text(marcador2,100,50);
  if(posXpel + radio/2 >= width ){
  marcador -= 1;

  }
  if(marcador == 0){
    fill(255);
    textSize(15);
    text("JUGADOR 1 GANA    JUGADOR 2 PIERDE \n(click para reiniciar)",60,100);
  }
  if(posXpel + radio/2 <=  15 ){
  marcador2 -= 1;

  }
  if(marcador2 == 0){
    fill(255);
    textSize(15);
    fill(255);
    text("JUGADOR 1 PIERDE    JUGADOR 2 GANA \n(click para reiniciar)",60,100);
  }
  if(marcador == 0 || marcador2 == 0){
    textSize(50);
    text(marcador2,100,50);
    text(marcador,250,50);
    posXpel = 200;
    posYpel = 200;
  }
}
