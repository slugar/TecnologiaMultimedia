float move=600;
int pantalla;
PImage SW, IM1;
void setup() {
  size(600, 600);
  pantalla=1;
  SW= loadImage("Star_Wars.png");
  IM1= loadImage("image2.jpg");
}
void draw() { //pantalla star wars
  if (pantalla==1) {
    pushStyle();
    background(0);
    if (move>width/8+5) {
      move=move-1;
    }
    textSize(50);
    image(SW, 0, move, 600, 400);
    popStyle();
    if (move<100) {
      textAlign(CENTER);
      text("Click para empezar", width/2, 500);
    }
  }
  if (pantalla==2) {//pantalla inicio star wars
    pushStyle();
    background(0);
    move=move-1;
    textSize(30);
    textAlign(CENTER);
    fill(random(100, 200));
    text(" La República Galáctica está \n sumida en disturbios. Hay \n protestas contra la tributación \n de las rutas comerciales \n a sistemas esteleres", width/2, move);
    text(" Esperando resolver el problema \n con un bloqueo de mortíferos \n cruceros, la avariciosa \n Federación de Comercio ha \n detenido todos los envios al \n pequeño planeta de Naboo. \n ", width/2, move+500);
    text(" Mientras el Congreso de la \n República debate sin fin \n esta alarmante cadena de \n acontecimientos, el Canciller \n Supremo ha despachado en \n secreto a dos Caballeros Jedi, \n los guardianes de la paz y la \n justicia en la galaxia, a resolver \n el conflicto…", width/2, move+1000);  
    if (move>=height*2) {
      move=move/2;
    }
    if (move<-1400) {
      textAlign(CENTER);
      text("Click para continuar", width/2, height/2);
      popStyle();
    }
  }
  if (pantalla==3) { //pantalla creditos 
  pushStyle();
    background(0);
    move=move-1;
    textSize(20);
    textAlign(CENTER);
    text("LUCASFILM ANIMATION SINGAPORE THANKS JEFFREY LIM\n JIANLIANG TAN \n JEAN YANG• \n JOHN SANDERS \n XAVIER NICOLAS \n \n SPECIAL THANKS \n IN MEMORY OF GRANDMA JEAN BUCZYNSKI, 1917-2009 \n GINÀ TORRES, MUJER MAS LINDA DEL MUNDO \n TO MY WONDERFUL WIFE AND PAÄTNER IN CRIME PAM AND THE TWO BEST", width/2, move);
  
  if (move<-200) {
    textAlign(CENTER);
    fill(25,255,0);
    text("Click para continuar", width/2, height/2);
    popStyle();
  }
}
if (pantalla==4) { //pantalla cast
  background(0);
  move=move-1;
  textSize(20);
  textAlign(CENTER);
  text("CAST \n \n  Obi-Wan Kenobi *WAN MCGREGOR \n Padmé NATALIE PORTMAN \n Anakin Skywalker HAYDEN CHRISTENSEN \n Supreme Chancellor Palpatine IAN McDIARMID \n Mace Windu SAMUEL L. JACKSON \n Senator Bail Organa JIMMY SMITS \n Yoda FRANK OZ \n C-3PO ANTHONY DANIELS \n Count Dooku CHRISTOPHER LEE \n Queen of Nabo KEISHA CASTLE-HUGHES \n Ki-Adi-Mundi & Nute Gunray SILAS CARSON \n Captain Typho JAY LAGA'AIA \n Tion Medon BRUCE SPENCE \n Governor Tarkin WAYNE PYGRAM", width/2, move);
if (move<-300) {
    textAlign(CENTER);
    fill(25,255,0);
    text("Click para reiniciar", width/2, height/2);
    popStyle();
  }
}
}
void mousePressed() {
  if (pantalla!=4) {
    pantalla++;
  } else if (pantalla==4) {
    pantalla=1;
  }
  move=600;
}
