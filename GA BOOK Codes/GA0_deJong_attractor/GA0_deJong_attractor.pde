//https://github.com/whitegreen/GenerativeArt
float x=0;
float y=0;
float a=-1.24; 
float b=-1.25;
float c=-1.81;
float d=-1.9;
float sc=200;
void setup() {   
  size(840, 840);
  background(0);
}
void draw() {
  translate(width/2, height/2);
  stroke(255,20);
  for (int i=0; i<1000; i++)
    cal();
}
void cal() {
  float nx= sin(a * y) - cos(b * x);  //De Jong attractors
  float ny= sin(c * x) - cos(d * y);
  point(sc*x, sc*y);
  x=nx;
  y=ny;
}

