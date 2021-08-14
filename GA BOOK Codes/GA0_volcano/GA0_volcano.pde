//https://github.com/whitegreen/GenerativeArt
int h=300;
int w=400;
void setup() {
  size(800, 600);
}
void draw() {
  background(255);
  noStroke();
  fill(0);
  float s=5.0;
  for (int i=0; i<h; i++) {
    for (int j=0; j<w; j++) {
      float x=noise(s*(j+3*frameCount)/w, s*i/h);
      float y=noise(s*j/w, s*(i+2*frameCount)/h);
      float nx=j + 18*map(x, 0, 1, -0.6, 0.6);
      float ny=i + 18*map(y, 0, 1, -0.6, 0.6);
      float t= map(cos(0.005*frameCount), -1, 1, 0.01, 0.0005);  //0.02, 0.0005
      float theta= lerp(noise(t*nx, t*ny ), noise(4*t*nx, 4*t*ny ), 0.2);
      fill(map( cos(theta*0.04*(1+0.004*frameCount)/t), -1, 1, 0, 255));
      rect( j*2, i*2, 2, 2);
    }
  }
}

