//based on https://openprocessing.org/sketch/1015644
color[] cols= {color(112, 112, 75),   color(115, 105, 97), color(215, 90, 35), color(242, 230, 195)};
PVector brush = new PVector(0, 0);
float px;
float py;
float x0=0;
float y0=0;

void setup() {
  size(1418, 1003);
  noStroke();  
  background(cols[(int)random(cols.length)]);
}

void draw() {
  brush.x+=(mouseX-brush.x)/8;
  brush.y+=(mouseY-brush.y)/8;//follow the mouse with delay effect
  if (frameCount>40) 
    Brush();
  px=brush.x;
  py=brush.y;//stored value:)
  autosplatter();
}

void mouseMoved() {
  if (0==frameCount%8) {
    ink(mouseX, mouseY, 0);
    ink(width-mouseX, height-mouseY, 255);
  }
}

