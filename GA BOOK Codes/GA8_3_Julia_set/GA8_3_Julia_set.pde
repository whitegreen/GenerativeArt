//https://github.com/whitegreen/GenerativeArt
void setup() {
  size(900,700);
  colorMode(HSB);
}
void draw() {
  float a = map(mouseX, 0, height, -1, 1);
  float b = map(mouseY, 0, height, -1, 1);
  loadPixels();
  for (int i=0; i<height; i++) 
    for (int j=0; j<width; j++) 
      pixels[i*width + j]= colorAt(i, j, a, b);
  updatePixels();
}
color colorAt(int i, int j, float a, float b) {
  float x= 2.4*(j-width*0.5)/height;
  float y= 2.4*(i-height*0.5)/height;
  for (int n = 0; n < 7; n++) {
    float nx = x * x-y * y + a;
    float ny = 2 * x * y + +b;
    x = nx;
    y = ny;
  }
  float v=x*x+y*y;
  return 150*v>255?color(255):color(150*v, 255, 255);
  // return color(x*y<0?255:0);
}


