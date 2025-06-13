// link video: https://youtu.be/IY8aYS4Lw9I

PImage referencia;

// cuadricula
int cantidadFilas = 3;
int cantidadColumnas = 3;

// colores base para cada paleta
color colorBase_Paleta1 = color(50, 50, 200);
color colorBase_Paleta2 = color(200, 70, 70); 
color colorBase_Paleta3 = color(255, 255, 0); 

// para controlar la paleta de colores activa
int paletaActiva = 1;     // paleta inicial
int totalPaletas = 3;   // total de paletas

// tamaño y espacio de los elementos en la cuadrícula del lado derecho
float tamanoElemento = 133;
float margenSuperior = 0;
float espacioEntreElementosX = 133;
float espacioEntreElementosY = 133;
// invertir los colores
boolean modoColoresInvertidos = false;

void setup() {
  size(800, 400);
  referencia = loadImage("referencia.jpeg");
}

void draw() {
  background(255);
  image(referencia, 0, 0, 800 / 2, 400);

  // calculo la posinicial X para centrar la cuadrícula con los elementos en el lado derecho
  float anchoCuadricula = cantidadColumnas * espacioEntreElementosX - (espacioEntreElementosX - tamanoElemento);
  float inicioDerechoX = 800 / 2 + ( (800 / 2) - anchoCuadricula ) / 2;

  // calculo del centro de la cuadricula
  float centroCuadriculaX = inicioDerechoX + anchoCuadricula / 2;
  float centroCuadriculaY = 400 / 2;
  
  // dist del mouse al centro de la cuadricula y lo transforma para controlar la intensidad del oscurecimiento
  float distanciaAlCentroDeLaCuadricula = obtenerDistanciaAlCentroDeLaCuadricula(mouseX, mouseY, centroCuadriculaX, centroCuadriculaY);
  float factorOscuridadGlobal = map(distanciaAlCentroDeLaCuadricula, 0, 250, 0.6, 0.0);
  
  if (factorOscuridadGlobal < 0.0) {
      factorOscuridadGlobal = 0.0;
  } else if (factorOscuridadGlobal > 0.6) {
      factorOscuridadGlobal = 0.6;
  }

  // bucle FOR anidado para dibujar la cuadrícula de elementos en el lado derecho
  for (int fila = 0; fila < cantidadFilas; fila++) {
    for (int columna = 0; columna < cantidadColumnas; columna++) {
      float centroX = inicioDerechoX + columna * espacioEntreElementosX + tamanoElemento / 2;
      float centroY = margenSuperior + fila * espacioEntreElementosY + tamanoElemento / 2;

      // seleccionar el color base de la paleta activa
      color colorBaseDeEstaPaleta;
      if (paletaActiva == 1) {
        colorBaseDeEstaPaleta = colorBase_Paleta1;
      } else if (paletaActiva == 2) {
        colorBaseDeEstaPaleta = colorBase_Paleta2;
      } else {
        colorBaseDeEstaPaleta = colorBase_Paleta3;
      }

      // los colores oscuros y claros a partir del color base
      color colorGeneradoOscuro = lerpColor(color(0), colorBaseDeEstaPaleta, 0.10);
      color colorGeneradoClaro = lerpColor(color(255), colorBaseDeEstaPaleta, 0.99);

      // alternar colores: si la suma de fila y columna es par, el círculo es oscuro y si es impar, el círculo es claro
      boolean esCirculoOriginalmenteOscuro = (((fila + columna) / 2) * 2 == (fila + columna));

      color colorParaCirculo;
      color colorParaFondoCuadrado;

      // invertir los colores
      if (modoColoresInvertidos) {
        if (esCirculoOriginalmenteOscuro) {
          colorParaCirculo = colorGeneradoClaro;
          colorParaFondoCuadrado = colorGeneradoOscuro;
        } else {
          colorParaCirculo = colorGeneradoOscuro;
          colorParaFondoCuadrado = colorGeneradoClaro;
        }
      } else {
        if (esCirculoOriginalmenteOscuro) {
          colorParaCirculo = colorGeneradoOscuro;
          colorParaFondoCuadrado = colorGeneradoClaro;
        } else {
          colorParaCirculo = colorGeneradoClaro;
          colorParaFondoCuadrado = colorGeneradoOscuro;
        }
      }
      
      // aplica el oscurecimiento a los colores base de las paletas
      colorParaCirculo = lerpColor(colorParaCirculo, color(0), factorOscuridadGlobal);
      colorParaFondoCuadrado = lerpColor(colorParaFondoCuadrado, color(0), factorOscuridadGlobal);

      // dibuja el cuadrado de fondo y el círculo encima usando las funciones
      dibujarCuadrado(centroX, centroY, tamanoElemento, colorParaFondoCuadrado);
      dibujarCirculo(centroX, centroY, tamanoElemento, colorParaCirculo);
    }
  }
}

// funcion que devuelve el valor de la distancia como un 'float'
float obtenerDistanciaAlCentroDeLaCuadricula(float mX, float mY, float gcX, float gcY) {
  return dist(mX, mY, gcX, gcY);
}

// funcion para dibujar cuadrado
void dibujarCuadrado(float xCentro, float yCentro, float tamano, color colorRelleno) {
  fill(colorRelleno);
  noStroke();
  rectMode(CENTER);
  rect(xCentro, yCentro, tamano, tamano);
}

// funcion para dibujar circulo
void dibujarCirculo(float xCentro, float yCentro, float tamano, color colorRelleno) {
  fill(colorRelleno);
  noStroke();
  ellipseMode(CENTER);
  ellipse(xCentro, yCentro, tamano, tamano);
}

// evento para hacer click y cambiar la paleta de color
void mousePressed() {
  paletaActiva++;
  if (paletaActiva > totalPaletas) {
    paletaActiva = 1;
  }
}

// evento para reiniciar con la tecla R/r y para invertir colores con la tecla C/c
void keyPressed() {
  if (key == 'r' || key == 'R') {
    paletaActiva = 1;
    modoColoresInvertidos = false;
  } else if (key == 'c' || key == 'C') {
    modoColoresInvertidos = !modoColoresInvertidos;
  }
}
