PImage osu1, osu2, osu3, osu4;
PFont fuente;

int miPantalla = 0;
int miTiempo = 0;
int duracion = 480;

float posX1 = -400;
float posY2 = 600;
float posX3 = 1000;
float posX4 = -100;

String texto1, texto2, texto3, texto4;

void setup() {
  size(640, 480);
  colorMode(HSB, 360, 100, 100);

  osu1 = loadImage("osu1.jpeg");
  osu2 = loadImage("osu2.jpg");
  osu3 = loadImage("osu3.png");
  osu4 = loadImage("osu4.jpeg");

  fuente = loadFont("franklin.vlw");
  textFont(fuente);

  frameRate(60);
  
  texto1 = "Osu! Es un videojuego de ritmo y precisión lanzado en 2007 por Dean Herbert. Se juega haciendo click, siguiendo círculos y al ritmo de la música";
  texto2 = "Se juega usando teclado, mouse, tabletas gráficas o pantallas táctiles, según el modo y preferencia.";
  texto3 = "La comunidad crea beatmaps con canciones y patrones para jugar. Es muy activa y creativa.";
  texto4 = "Existen varios modos de juego: estándar, Taiko, Catch the Beat y Mania.";
}

void draw() {
  background(0, 0, 0);
  miTiempo++;

  if (miTiempo < duracion) miPantalla = 0;
  else if (miTiempo < duracion * 2) miPantalla = 1;
  else if (miTiempo < duracion * 3) miPantalla = 2;
  else if (miTiempo < duracion * 4) miPantalla = 3;
  else miPantalla = 4;

  textSize(22);
  textAlign(CENTER, CENTER);
  fill(303, 70, 70); // color rosa HSB

  if (miPantalla == 0) {
    image(osu1, 0, 0, 640, 480);
    posX1 += 5;
    if (posX1 > 20) posX1 = 20;
    text(texto1, posX1, 50, 230, 400);
  } else if (miPantalla == 1) {
    image(osu2, 0, 0, 640, 480);
    textSize(25);
    posY2 -= 5;
    if (posY2 < 60) posY2 = 60;
    text(texto2, 150, posY2, 300, 120);
  } else if (miPantalla == 2) {
    image(osu3, 0, 0, 640, 480);
    posX3 -= 5;
    if (posX3 < 250) posX3 = 250;
    text(texto3, posX3, 120, 330, 90);
  } else if (miPantalla == 3) {
    image(osu4, 0, 0, 640, 480);
    posX4 += 3;
    if (posX4 > 65) posX4 = 65;
    text(texto4, 350, posX4, 230, 400);
  } else if (miPantalla == 4) {
    background(0);
    fill(0, 0, 100);
    textSize(24);
    textAlign(CENTER, CENTER);
    text("Click para reiniciar", width / 2, 150);

    fill(303, 70, 70);
    noStroke();
    rect(width / 2 - 75, height / 2 - 25, 150, 50, 10);

    fill(0, 0, 100);
    textSize(20);
    text("Reiniciar", width / 2, height / 2);
  }
}

void mousePressed() {
  if (miPantalla == 4) {
    if (mouseX > width / 2 - 75 && mouseX < width / 2 + 75 &&
      mouseY > height / 2 - 25 && mouseY < height / 2 + 25) {
      miPantalla = 0;
      miTiempo = 0;
      posX1 = -400;
      posY2 = 600;
      posX3 = 1000;
      posX4 = -100;
    }
  }
}
