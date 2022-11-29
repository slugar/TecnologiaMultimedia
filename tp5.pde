Tp 5 Bruno Araiztegui, con la participacion de Gomez Arenillas Lautaro Jeremias


int filas = 7; //filas 
int columnas = 7; //Columnas
int total = filas * columnas; //Ladrillos columnas
int puntaje = 0; //Contador
int gameScore = 0; //Contador del juego
int streak = 0;  //Cuántos ladrillos seguidos ha golpeado el jugador sin que la pelota se vaya del campo
int maxStreak = 0; //maximo de veces golpeada la pelota sin perder
int vidas = 5; //vidas


Paleta Paleta2 = new Paleta(); //iniciar paleta
pelota ball2 = new pelota(); //iniciar pelota
ladrillo[] box = new ladrillo[total]; //array de ladrillos
meteorito missile2 = new meteorito(); //inicializar meteorito

void setup()
{
  size(600, 600);
  background(0);
  smooth();

  //array de ladrillos
  for (int i = 0; i < filas; i++)
  {
    for (int j = 0; j< columnas; j++)
    {
      box[i*filas + j] = new ladrillo((i+1) *width/(filas + 2), (j+1) * 50); //places all the bricks into the array, properly labelled.
    }
  }
}


void draw()
{
  background(0);

  //dibujo de ladrillos con array
  for (int i = 0; i<total; i++)
  {
    box[i].update();
  }

  //dibujo de paleta y pelota
  Paleta2.update();
  ball2.actualizar();


  //interacciones de pelota y paleta

  //If para la colicion entre la paleta y la pelota 
  //If para hacer que vaya a la izquierda o derecha dependiendo si toco del lado izquierdo o derecho de la paleta

  //si pega en la izquierda
  if (ball2.y == Paleta2.y && ball2.x > Paleta2.x && ball2.x <= Paleta2.x + (Paleta2.w / 2) )
  {
    ball2.goLeft();
    ball2.changeY();
    streak = 0; //trazo
  }

  //si pega en la derecha
  if (ball2.y == Paleta2.y && ball2.x > Paleta2.x + (Paleta2.w/2) && ball2.x <= Paleta2.x + Paleta2.w )
  {
    ball2.goRight();
    ball2.changeY();
    streak = 0; //trazo
  }

  //en caso de que la pelota pegue en la pared derecha
  if (ball2.x + ball2.D / 2 >= width)
  {
    ball2.goLeft();
  }

  //en caso de que la pelota pegue en la pared izquierda
  if (ball2.x - ball2.D / 2 <= 0)
  {
    ball2.goRight();
  }

  //en caso de que la pelota rompa un ladrillo, cambia la direccion
  if (ball2.y - ball2.D / 2 <= 0)
  {
    ball2.changeY();
  }


  //interacciones entre pelota, ladrillo y meteorito

  for (int i = 0; i < total; i ++)
  {
    //si la pelota toca un ladrillo, la pelota baja y se incrementa la puntuacion
    if (ball2.y - ball2. D / 2 <= box[i].y + box[i].h &&  ball2.y - ball2.D/2 >= box[i].y && ball2.x >= box[i].x && ball2.x <= box[i].x + box[i].w  && box[i].hit == false )
    {
      ball2.changeY();
      box[i].gotHit();
      puntaje += 1;
      gameScore += 10;
      streak += 1;

      //calcula la racha máxima para mostrar la puntuación final al final
      if (streak>maxStreak)
      {
        maxStreak = streak;
      }
    } 

    //Si la pelota golpea la parte superior del ladrillo, la pelota se mueve hacia arriba y aumenta la puntuación
    if (ball2.y + ball2.D / 2 >= box[i].y && ball2.y - ball2.D /2 <= box[i].y + box[i].h/2 && ball2.x >= box[i].x && ball2.x <= box[i].x + box[i].w && box[i].hit == false ) 
    {
      ball2.changeY();
      box[i].gotHit();
      puntaje += 1;
      gameScore += 10;
      streak += 1;

      //Calcula la racha máxima para mostrar la puntuación final al final
      if (streak>maxStreak)
      {
        maxStreak = streak;
      }
    }

    //si la pelota golpea la izquierda del ladrillo, la pelota cambia a la derecha e incrementa la puntuación
    if (ball2.x + ball2.D / 2 >= box[i].x && ball2.x + ball2.D / 2 <= box[i].x + box[i].w / 2 && ball2.y >= box[i].y && ball2.y <= box[i].y + box[i].h  && box[i].hit == false)
    {
      ball2.goLeft();
      box[i].gotHit();
      puntaje += 1;
      gameScore += 10;
      streak += 1;

      //Calcula la racha máxima para mostrar la puntuación final al final
      if (streak>maxStreak)
      {
        maxStreak = streak;
      }
    }

    //si la pelota golpea la derecha del ladrillo, la pelota cambia a la izquierda y aumenta la puntuación
    if (ball2.x - ball2.D/2 <= box[i].x + box[i].w && ball2.x +ball2.D / 2 >= box[i].x + box[i].w / 2 && ball2.y >= box[i].y && ball2.y <= box[i].y + box[i].h  && box[i].hit == false)
    {
      ball2.goRight();
      box[i].gotHit();
      puntaje += 1;
      gameScore += 10;
      streak += 1;

      //calcula la racha máxima para mostrar la puntuación final al final
      if (streak>maxStreak)
      {
        maxStreak = streak;
      }
    }

    //en caso de que un meteorito toque un ladrillo
    if (missile2.y >=box[i].y && missile2.y <= box[i].y + box[i].h/2 && missile2.x >= box[i].x  && missile2.x <= box[i].x + box[i].w && box[i].hit == false)
    {
      box[i].gotHit();
      puntaje += 1;
      gameScore += 10;
      streak += 1;
      missile2.resetMeteorito();
    }
  }
  

  //interacciones del meteorito y la paleta
  
  //If the missile hits the paddle
  if (missile2.x >= Paleta2.x && missile2.x <= Paleta2.x + Paleta2.w && missile2.y >= Paleta2.y && missile2.y <= Paleta2.y + Paleta2.h)
  {
    Paleta2.g = 0;
    Paleta2.b = 0;
    vidas -= 1;
  }
  

  //interacciones entre el meteorito y ladrillo 
  
  //cada frame se dibuja un meteorito
  missile2.update();

  //para que el meteorito se reinicie una vez que llega al suelo
  if (missile2.y > missile2.maxDist)
  {
    missile2.resetMeteorito();
    
    //valores g and b= 255 para que la paleta sea blanca denuevo
    Paleta2.g = 255; 
    Paleta2.b = 255;
  }

  //si hay solo 1 ladrillo, los meteoritos caen mas rapido
  if (puntaje == total - 1)
  {
    //distancia en la que tiene que bajar el meteorito para reiniciarse
    missile2.maxDist = 700;
  }

  //reseteo de la pelota en caso de perder
  if (ball2.y > height)
  {
    ball2.reset();
    vidas -= 1;
  }


  //contador de puntaje
  textSize(32);
  text(gameScore, 10, 30);

  //contador de vidas
  textSize(18);
  text("LIVES: ", 10, 570);
  text(vidas, 70, 570); 

  //click para reiniciar
  if ((puntaje == total || vidas <= 0) && mousePressed)
  {
    resetGame();
  } 


  //para cuando termina el juego
  if (puntaje == total)
  {
    termino();
  }

  //If no more lives are left, game ends
  if (vidas <= 0)
  {
    perdiste();
  }
}

//pantalla cuando se pierde
void perdiste()
{
  background(0);
  textSize(32);
  text("GAME OVER", 100, 200);
  text("puntaje: ", 100, 300);
  text(gameScore, 300, 300);
  text("Maximo de golpes: ", 100, 400); 
  text(maxStreak, 300, 400);
  text("Click para jugar denuevo", 100, 500);

  //pelotas y misiles fuera de la pantalla
  ball2.x = -10;
  ball2.y = -10;
  ball2.vx = 0;
  ball2.vy = 0;

  missile2.x = -20;
  missile2.y = -20;
}





//funcion para cuando termina la partida
void termino()
{ 

  //pantalla final
  background(0);
  textSize(32);
  text("GANASTE!", 100, 200);
  text("Score: ", 100, 300);
  text(gameScore, 300, 300);
  text("Max Streak: ", 100, 400); 
  text(maxStreak, 300, 400);
  text("Click para jugar denuevo", 100, 500);

}


//Resteo del juego re piola
void resetGame()
{

  //ARRAY DE LOS LARDRILLO'
  for (int i = 0; i < filas; i++)
  {
    for (int j = 0; j< columnas; j++)
    {
      box[i*filas + j] = new ladrillo((i+1) *width/(filas + 2), (j+1) * 50);
    }

    //RESTEO DE VOLARES
    puntaje = 0;
    gameScore = 0;
    streak = 0;
    maxStreak = 0;
    vidas = 5;

    //RESTEO DEL MISILES
    missile2.maxDist = 10000;
  }

  //RESTEO DE LA PELOTA
  ball2.reset();
}
