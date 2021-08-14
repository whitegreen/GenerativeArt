//https://github.com/whitegreen/GenerativeArt
float r=240;
int n=360;
void setup() {
  size(600, 600);
}
void draw() {
  background(255);
  translate(300, 300);
  fill(0, 0, 255);
  noStroke();
  float s=2+frameCount/100;//1+0.01*frameCount; 
  for (int i=0; i<n; i++) {
    float ta= 2*PI*i/n;
    float tb= s*ta;
    PVector a= new PVector(cos(ta), sin(ta)); 
    PVector b= new PVector(cos(tb), sin(tb)); 
    a.mult(r);
    b.mult(r);
    float cos= cos(2*PI*frameCount/100.0);
    float sc = map(cos, -1, 1, 0, 1) ;
    PVector v= PVector.lerp(a, b, sc);
    ellipse(v.x, v.y, 8, 8);
  }
}

