//GOMEZ ARENILLAS LAUTARO https://youtu.be/n5nr3Br8GL0

int pantalla;
int posXp1 = 10;
int posYp1 = 200;
int sizeP1 = 40;
//player 2
int posXp2 = 380;
int posYp2 = 200;
int sizeP2 = 40;
//pelota
int radio = 20;
float posXpel = 200;
float posYpel = 100;
float vel = 2;
float dirXpel = 1;
float dirYpel = 1;
//marcador
int marcador = 3;
int marcador2 = 3;
void setup() {
  size(400, 400);
  pantalla=1;
}


void draw() {

if (pantalla==1) {
    pushStyle();
    background(0);
    textSize(30);
    textAlign(CENTER);
    text("CLICK PARA INICIAR\n  Jugador 1 Teclas   W S     \n Jugador 2 Teclas  O L",width/2 ,height/2);
 
    popStyle();
  }
    if(pantalla==2){
    background(0);
    paleta1();
    paleta2();
    pelota();
    condicion();
    marcador();
    campo();
  }
  }
