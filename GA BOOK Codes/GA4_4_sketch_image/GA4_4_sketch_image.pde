PImage img;
boolean s=false;
void setup() {
  size(800,627);
  img=loadImage("alp.jpg");
}
void draw() {
  background(255);
  stroke(0, 35);
  for (int i=0; i<height; i+=2) {
    for (int j=0; j<width; j+=2) {
      color col= img.pixels[i*width+j];
      float r=  0.08*(255-brightness(col)) ;
      float ang=red(col)*PI/255;
      line(j, i, j+r*cos(ang), i+r*sin(ang));
    }
  }
  img.filter(BLUR, 2);
}

