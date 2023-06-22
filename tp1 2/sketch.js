//Cosas para manejar el glitch
const cool_glitch = 125;
let t=0;
let p_time=0;
let delta_t=0;

let angulo = 0;
let velocidadRotacion;
let colorCirculo;
let colorCentro;
let centroX, centroY;
const umbralGlitch = 10;
const tamanoGradiente = 150;
const cantidadCirculos = 6;
let margen;
const tamanoInicial = 400;
const tamanoFinal = 100;
let tamanoCirculo;
let tamanoImagenCentro;
const tamanoImagenCentroInicial = 200; // Tamaño inicial del círculo central de imágenes
const tamanoImagenCentroFinal = 80; // Tamaño final del círculo central de imágenes

let mic;
let imagen;
let fondoRojo;
let fondoAzul;
let imagenGlitch;
let imagenCentroAzul;
let imagenCentroRojo;
let p_amplitud;
let amplitud;
let tinte_glitch;
let glitch;

let prevMouseX, prevMouseY;

function preload() {
  imagen = loadImage("textura.png");
  fondoRojo = loadImage("fondo_rojo.png");
  fondoAzul = loadImage("fondo_azul.png");
  imagenGlitch = loadImage("glitch.png");
  imagenCentroAzul = loadImage("centroazul.png");
  imagenCentroRojo = loadImage("centrorojo.png");
}

function setup() {
  createCanvas(600, 600);
  smooth();
  noStroke();
  frameRate(60);

  centroX = width / 2;
  centroY = height / 2;

  margen = (tamanoInicial - tamanoFinal) / cantidadCirculos;

  mic = new p5.AudioIn();
  mic.start();

  if (imagen) {
    imagen.resize(int(tamanoInicial), int(tamanoInicial));
  } else {
    console.log("Error al cargar la imagen");
  }

  fondoRojo.resize(width, height);
  fondoAzul.resize(width, height);

  if (!imagen || !imagenCentroAzul || !imagenCentroRojo) {
    console.log("Error al cargar la imagen o las imágenes del centro");
  } else {
    console.log("Imágenes cargadas correctamente");
  }
  userStartAudio();
  p_amplitud = 0;
}

function draw() {
  p_time=millis();
  amplitud = mic.getLevel();
  let isSonidoAlto = amplitud > 0.5;

  if (isSonidoAlto)
  {
    background(fondoAzul);
  }else
  {
    background(fondoRojo);
  }
  let rojo = map(amplitud,0,1,255,0);
  let azul = map(amplitud,0,1,0,255);
  colorCirculo = color(rojo,0,azul);
  colorCentro = color(rojo,0,azul);

  push();
  translate(centroX, centroY);
  rotate(radians(angulo));

  for (let i = 0; i < cantidadCirculos; i++) {
    tamanoCirculo = tamanoInicial - i * margen;
    const colorRelleno = map(i, 0, cantidadCirculos - 1, 0, 255);

    push();
    rotate(radians(-angulo * (i + 1)));

    const escala = tamanoCirculo / tamanoInicial;

    imageMode(CENTER);
    colorMode(RGB);
    tint(red(colorCirculo), green(colorCirculo), blue(colorCirculo));
    image(imagen, 0, 0, imagen.width * escala, imagen.height * escala);
    noTint();

    pop();

    noStroke();
    fill(lerpColor(colorCirculo, color(0), colorRelleno / 255));
    ellipse(0, 0, tamanoCirculo, tamanoCirculo);
  }

  pop();

  fill(colorCentro);
  ellipse(centroX, centroY, tamanoCirculo, tamanoCirculo);
    noTint();
  const velocidadMouse = dist(mouseX, mouseY, prevMouseX, prevMouseY);
  
  //Cambio del volumen entre un frame y otro
  //Te conviene usar esto para manejar la
  //velocidad de rotacion si no quieren usar
  //el pitch
  let cambioAmplitud = amplitud-p_amplitud;
  if(cambioAmplitud<0)
  {
    cambioAmplitud*=(-1);
  }

  if(cambioAmplitud > umbralGlitch*.03 && !glitch)
  {
    tinte_glitch = color(random(255), 0, random(255), random(100, 200));
    glitch = true;
    t=0;    
    //console.log("WASD");
  }

  //Pone el glitch
  if (glitch && (t<cool_glitch))
  {
    tint(tinte_glitch);
    imageMode(CORNER);
    image(imagenGlitch, 0, 0, width, height);
    noTint();
    t+=delta_t;
  }else{glitch = false;}

  let imagenCentro;
  if (red(colorCirculo) > blue(colorCirculo)) {
    imagenCentro = imagenCentroRojo;
  } else {
    imagenCentro = imagenCentroAzul;
  }

  tamanoImagenCentro = map(
    tamanoCirculo,
    tamanoFinal,
    tamanoInicial,
    tamanoImagenCentroFinal,
    tamanoImagenCentroInicial
  );

  const posXImagenCentro = centroX;
  const posYImagenCentro = centroY;

  push();
  translate(posXImagenCentro, posYImagenCentro);
  rotate(radians(-angulo));
  imageMode(CENTER);
  image(imagenCentro, 0, 0, tamanoImagenCentro, tamanoImagenCentro);
  pop();

  prevMouseX = mouseX;
  prevMouseY = mouseY;

  //Cosas para manejar el angulo
  //Mapeo el volumen a un angulo en radianes
  //que va de 0 a 360 * 2 (dos vueltas enteras)
  sumAng= map(amplitud,0,1,0,TWO_PI*2);
  angulo += sumAng;

  //angulo += velocidadRotacion;
  p_amplitud = amplitud;
  delta_t=millis()-p_time;
}