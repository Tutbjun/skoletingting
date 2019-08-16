float posx;
float posy;
float speed = 3;
float time = 0;
float size;
float frekvensmod = 1.75; //invers


void setup() {
  size(690, 690);
}

void draw() {
  //setup
  background(0,0,0);

  maths();

  figure();

  delay(2);

  if (size>2000)
    time = 0;
}

void maths() {
  time++;
  size = pow(1.02, posx/1.75)/100+1;
  posx = time * speed;
  posy = time * speed;
  posy = posy + sin(time/frekvensmod)*5;
}

void figure() {

  fill(255);
  circle(posx, posy-10*size, 69*size);
  circle(posx, posy+50*size, 100*size);
  rectMode(CENTER);
  rect(posx, posy+5*size, 15*size, 15*size);
  circle(posx+15*size, posy-10*size, 10*size);
  circle(posx-15*size, posy-10*size, 10*size);
}
