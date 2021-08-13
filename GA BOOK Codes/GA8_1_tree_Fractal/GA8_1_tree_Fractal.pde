float a=0.5;
float b=0.3;
void setup() {
  size(1000, 800);
}
void draw() {
  background(255); 
  branch(new PVector(width/2, height/2), 160, 0, 9);
}
void branch(PVector p, float r, float theta, int age) {
  if (0>age)  return;
  PVector v= new PVector(r*cos(theta), r*sin(theta));   
  v.add(p);
  line(p.x, p.y, v.x, v.y);
  line(width-p.x, p.y,width-v.x, v.y);
  branch(v, a*r, theta + b*PI, age-1 );
  branch(v, a*r, theta - b*PI, age-1);
}
void mouseMoved() {
  a = map(mouseX, 0, width, 0.4, 0.8);
  b = map(mouseY, 0, height, 0, 1);
}


