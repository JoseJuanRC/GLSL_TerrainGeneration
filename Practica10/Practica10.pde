PShader sh;
PShape ground;

int size = 2000;

float posX=0;
float posY=0;

float incX = 0;
float incY = 0;

float velocity = 10;

float angle = 0.6;
float incAngle = 0.0;

float maxAngle = 0.9;
float minAngle = 0.1;

PFont f;
boolean intro = true;

void setup() {
  size(640, 640, P3D);
  noStroke();
  sh = loadShader("shader_frag.glsl", "shader_vert.glsl");
  
  
  sh.set("u_resolution", float(width), float(height));
  sh.set("water", 0.,0.95,0.8);
  sh.set("deepWater", 0.,0.5,1.);
  sh.set("grass", 0,1.,0);
  sh.set("mountain", 0.66,0.3,0.08);
  sh.set("rocks", 0.66,0.66,0.66);
  sh.set("snow", 1.,1.,1.);

  posX = 1200;
  posY = 100;

  ground = createShape(); 
  create();
}


void create() {
  ground.beginShape(TRIANGLE);
  
  int inc = 10;
  for (int i = 0; i<size; i+=inc)
    for (int j = 0; j<size; j+=inc) {
      
      ground.vertex(i, j);
      ground.vertex(i, j+inc);
      ground.vertex(i + inc, j);
      
      ground.vertex(i+inc, j);
      ground.vertex(i, j+inc);
      ground.vertex(i +inc, j+inc);
    }
    
  
  ground.endShape(CLOSE);
}


void draw() {
  if (intro) {
    drawIntro();  
  }else {
    movement();
    background(123,0,0);
    translate(width/2-size/2, width/2-size/2, -size/2);
    rotateX(angle);
    shader(sh);
    shape(ground);
  
    resetShader();
  }
}

void drawIntro() {
  background(0);
  textAlign(CENTER);
  f = createFont("Arial",40,true); 
  textFont(f);
  text("Navega por el mundo",width/2,height/8); 
  
  textAlign(CENTER);
  f = createFont("Arial",28,true); 
  textFont(f);
  text("Controles",width/2,height/3.8); 
  textAlign(LEFT);
  f = createFont("Arial",20, true); 
  textFont(f);
  text("Click izquierdo:       Zoom in",width/20,height/2.4);  
  text("Click derecho:        Zoom out",width/20,height/2.2);  
  text("Flechas:                Movemos la cámara",width/20,height/2.02);  

  
  textAlign(CENTER);
  f = createFont("Arial",18,true); 
  textFont(f);
  text("Pulsa enter para continuar",width/2,height/1.25); 

  
  textAlign(LEFT);
  f = createFont("Arial",14,true); 
  textFont(f);
  text("Hecho por: José Juan Reyes Cabrera",0,height/1.02); 
}

void mousePressed() {
  if (mouseButton == LEFT)
    incAngle=0.005f;
  else incAngle=-0.005f;
  
}

void mouseReleased() {
  incAngle=0;
}

void movement() {
  posX+=incX;
  posY+=incY;
  
  posX = max(min(posX,5000), 0); // Limites del mundo
  
  angle+= incAngle;
  angle = max(minAngle,min(angle, maxAngle));
  
  sh.set("position", posX, posY);
}


void keyPressed() {
  if (keyCode==LEFT) incX=-velocity;
  else if (keyCode==RIGHT) incX=velocity;
  
  else if (keyCode==UP) incY=-velocity;
  else if (keyCode==DOWN) incY=velocity;
  else if (keyCode==ENTER) intro = false;
}

void keyReleased() {
  if (keyCode==LEFT || keyCode==RIGHT) incX=0;
  if (keyCode==UP || keyCode==DOWN) incY=0;
}
