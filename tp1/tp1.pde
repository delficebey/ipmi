PImage mouse;

void setup() {
  size (800, 400);
  mouse = loadImage("mouse.jpeg");
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0, 0, 32);
  image(mouse, 0, 0, 400, 400);

  strokeWeight(4);
  stroke(0, 100, 0);
  line (400, 0, 400, 400);

  println(mouseX + "/" + mouseY);

  stroke(245, 0, 20);
  fill(0, 0, 5);
  ellipse(600, 200, 180, 250);

  strokeWeight(8);
  stroke(0, 0, 20);
  line (596, 72, 612, 0);
  // line(x1,y1,x2,y2);

  strokeWeight(3);
  stroke(245, 0, 20);
  line (512, 200, 580, 160);

  line (610, 160, 688, 200);

  strokeWeight(8);
  ellipse(595, 155, 7, 17);

  ellipse(507, 213, 2, 15);
  ellipse(507, 184, 2, 17);

  strokeWeight(3);
  line (590, 126, 600, 126);
  line (590, 120, 600, 120);
  line (590, 120-6, 600, 120-6);
  line (590, 120-6-6, 600, 120-6-6);
  line (590, 120-6-6-6, 600, 120-6-6-6);

  strokeWeight(3);
  line(580, 160, 580, 80);
  line(610, 160, 610, 78);

  noFill();
  arc(595, 155, 30, 40, 0, TWO_PI);

  line(580, 96, 610, 96);

  strokeWeight(9);
  stroke(176, 100, 100);
  arc(594, 260, 32, 34, HALF_PI, PI + HALF_PI);

  strokeWeight(10);
  stroke(170, 100, 100);
  line(597, 260, 610, 260);
  line(610, 260, 610, 274);

  strokeWeight(3);
  stroke(170, 100, 100);
  arc(600, 210, 170, 220, 0, PI);
}
