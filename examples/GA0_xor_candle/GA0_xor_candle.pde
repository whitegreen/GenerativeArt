void setup(){
  size(800,400);
}
void draw(){
  background(255);
  for(int i=0;i<width;i++){
    int v=(width-i+frameCount)^(i+frameCount);
    line(i,0,i, 0.5*v);
  }
}

