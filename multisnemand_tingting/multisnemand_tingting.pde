// jeg så ikke lige noget om komentarer i opgaven, så det har jeg ikke orket

boolean lmao = true;


int antal = 69/2;

float time = 0;
float frekvensmod = 1.75; //invers
float[] startbounce = new float[antal];

float[] posx = new float[antal];
float[] posy = new float[antal];
float[] posz = new float[antal];
float[] speedx = new float[antal];
float[] speedy = new float[antal];
float[] speedz = new float[antal];

boolean resetting = false;
int reset_i = 0;

PImage ulf;

void setup() {
  size(690, 690);
  setPosSpeed();
  ulf = loadImage("ulf.png");
}

void draw() {
  //setup
  background(0,0,0);

  if(!resetting)
    time++;

  for(int i = 0; i < antal; i++){
    figure(speedz [i], speedx[i],speedy[i],posx[i],posy[i],posz[i], startbounce[i]); //posx, posy, size, dirx, diry
    
  }

  delay(2);

  if(time>1000)
    resetting = true;

  if (resetting){
    time -= 20;
    reset_i++;
    
    if(reset_i > 50){
      setPosSpeed();
      resetting = false;
      reset_i = 0; 
    }
  }
    
}

void figure(float speedz, float speedx, float speedy, float posx, float posy, float posz, float startbounce) {
  float size = speedz * time + posz;
  if (size < 0)
    size = 0;
  posx = posx + time * speedx;
  posy = posy + time * speedy;
  posy = posy + sin((time+startbounce)/frekvensmod)*5;
  fill(255);
  circle(posx, posy-10*size, 69*size);
  circle(posx, posy+50*size, 100*size);
  rectMode(CENTER);
  rect(posx, posy+5*size, 15*size, 15*size);
  circle(posx+15*size, posy-10*size, 10*size);
  circle(posx-15*size, posy-10*size, 10*size);
  
  pushMatrix();
    scale(size/2);
    if(lmao)
      image(ulf, posx/(size/2)-90, posy/(size/2)-100);
  popMatrix();
}

void setPosSpeed(){
  for(int i = 0; i < antal; i++){
      posx[i] = random(0,690);
      posy[i] = random(0,690);
      posz[i] = random(0,2);
      speedx[i] = random(-2,2);
      speedy[i] = random(-2,2);
      speedz[i] = random(-0.01,0.01);
      
      startbounce[i] = random(0,frekvensmod*5);     
  }
}
