String estado ;
PImage d1, d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13, d14,d15,d16,d17,d18; 
PImage fondo;
PFont fuente;
PImage img;
int velocidad = -01;
int y = 1000;
int space = 20;
int contador = 0;
import ddf.minim.*;
Minim minim; 
AudioPlayer player;


void setup(){
  size (600,600);
  minim = new Minim(this);
  player = minim.loadFile("El-Ruiseñor-del-Emperador.wav");
  fuente = loadFont("Phosphate-Inline-30.vlw");
  fondo = loadImage("elruiseñor.jpg");
  estado = "escenario";
  img = loadImage("TITULO.png");
  d1 = loadImage("1.PNG");
  d2 = loadImage("2.PNG");
  d3 = loadImage("3.PNG");
  d4 = loadImage("4.PNG");
  d5 = loadImage("5.PNG");
  d6 = loadImage("6.PNG");
  d7 = loadImage("7.PNG");
  d8 = loadImage("8.PNG");
  d9 = loadImage("9.PNG");
  d10 = loadImage("10.PNG");
  d11= loadImage("11.PNG");
  d12= loadImage("12.PNG");
  d13= loadImage("13.PNG");
  d14= loadImage("14.PNG");
  d15= loadImage("15.PNG");
  d16= loadImage("16.PNG");
  d17= loadImage("17.PNG");
  d18= loadImage("18.PNG");
                   
  contador = contador +1;

 
}

void draw(){
   if (estado.equals( "escenario")){
     println(contador);
     background(0);
     fill(#FCE400);
     textFont(fuente);
     text("Christian Andersen",150,width/2);
     fill(random(100,200));
    text("(Click para empezar)",140,500);
    
   }
   
  if(estado.equals ( "0")){
    background(fondo);
    image(img,0,0,600,600);
    textFont(fuente);
    fill(255);
    text("(Click para empezar)",140,500);
  }
   
  if (estado.equals( "1")){
  y = y + velocidad;
  fill(#FCE400);
  textFont(fuente);
  background(fondo);
  image(img,0,y-1000,600,y-400);
  text("PERSONAJES",30,y+50);
  text("El Emperador.",30,y+100 );
  text("El Ruiseñor" ,30,y+150);
  text("El Ruiseñor mecanico",30,y+200);
  text("El Jardinero.",30,y+250 );

 // text("",30,y+350);
  text("El emperador sustituto",30,y+400 );
  text("La muerte",30,y+450 );
  text("Sirvientes", 30,y+500 );
  image(d1 , 30,y+500);
  image(d2, 30,y+1100);
  image(d3, 30,y+2200);
  image(d5, 30,y+2800);
  image(d6, 30,y+3400);
  image(d7, 30,y+4000);
  image(d8, 30,y+4600);
  image(d9, 30,y+5200);
  image(d10, 30,y+5800);
  image(d11, 30,y+6400);
  image(d12, 30,y+7000);
  image(d13, 30,y+7600);
  image(d14, 30,y+8200);
  image(d15, 30,y+8800);
  image(d16, 30,y+9400);
  image(d17, 30,y+10000);
  image(d18, 30,y+16000);
  
 }
 //image(sable,mouseX-30,mouseY-30,55,55);
}


 void mousePressed(){
if(estado.equals("escenario")){
  if (mouseX<600 && mouseY<600){
    estado = "0" ;
    //pantalla inicial
  }
}else if (estado.equals("0")){
    if(mouseX< 600 && mouseX < 600){
    estado = "1" ;
    //pantalla 2 
    }
    
    else if (estado.equals("1")){
    if(mouseX< 600 && mouseX < 600){
    estado = "2" ;
    //pantalla 2 
    }
    }
}
player.play();
 }
