//https://github.com/whitegreen/GenerativeArt
void setup(){
  size(1200,800);
  background(0);
  stroke(255);
}
void draw(){
  float x =frameCount;
  float r = map(x, 0, width, 2.6, 4.2 );
  float y= 0.1;
  for(int i=0;i<200;i++){
    y= r*y*(1-y);
    point(x, 800*y);
  }
}

