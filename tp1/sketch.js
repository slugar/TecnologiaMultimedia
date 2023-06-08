//https://www.youtube.com/watch?v=zDvcv0fWk4Y

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

let prevMouseX, prevMouseY;
let imagen;
let fondoRojo;
let fondoAzul;
let imagenGlitch;
let imagenCentroAzul;
let imagenCentroRojo;

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

  prevMouseX = mouseX;
  prevMouseY = mouseY;

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
}

function draw() {
  const distancia = dist(mouseX, mouseY, centroX, centroY);
  velocidadRotacion = map(distancia, 0, width / 25, 0, 0.1);

  if (dist(mouseX, mouseY, centroX, centroY) < tamanoInicial / 2) {
    const umbralColor = map(distancia, 0, width / 2, 0, 255);
    colorCirculo = color(255, 0, 0, umbralColor);
    colorCentro = lerpColor(color(0), color(255), umbralColor / 255);
    background(fondoRojo);
  } else {
    const umbralColor = map(distancia, tamanoInicial / 2, width / 2, 0, 255);
    colorCirculo = color(0, 0, 255, umbralColor);
    colorCentro = lerpColor(color(255), color(0), umbralColor / 255);
    background(fondoAzul);
  }

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
    if (red(colorCirculo) > blue(colorCirculo)) {
      tint(255, 0, 0);
    } else {
      tint(0, 0, 255);
    }
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

  const velocidadMouse = dist(mouseX, mouseY, prevMouseX, prevMouseY);

  if (velocidadMouse > umbralGlitch) {
    tint(random(255), 0, random(255), random(100, 200));
    imageMode(CORNER);
    image(imagenGlitch, 0, 0, width, height);
    noTint();
  }

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

  angulo += velocidadRotacion;
}
