//https://github.com/whitegreen/GenerativeArt
void setup(){
  size(1200,800);
  background(0);
  colorMode(HSB);
}
void draw(){
  float x =frameCount;
  float r = map(x, 0, width, 2.6, 4.2 );
  float y= 0.1;
  for(int i=0;i<200;i++){
    stroke(200-i, 255,255);
    y= r*y*(1-y);
    point(x, 800*y);
  }
}

