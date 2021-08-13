float theta=0.37;
float s=0.52;
void setup() {
  size(1000, 800);
  rectMode(CENTER);
  colorMode(HSB);
}
void draw() {
  background(255); 
  noStroke();
  square(500, 400, 256, 8);
}
void square(float x,float y,float w,int age){
  if (0>age) return;
  fill(age*20, 255, 255, 255-age*25);
  pushMatrix();
  translate(x, y);
  rect(0, 0, w, w);
  rotate(theta*PI);
  square(-w/2, w/2, w*s, age-1);
  square(w/2, -w/2, w*s, age-1);
  square(w/ 2, w/2, w*s, age-1);
  popMatrix();
}

