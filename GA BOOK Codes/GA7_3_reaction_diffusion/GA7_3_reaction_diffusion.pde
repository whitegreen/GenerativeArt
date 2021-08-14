//https://github.com/whitegreen/GenerativeArt
int w=200;
int h=160;
float[][] us = new float[h][w];
float[][] vs = new float[h][w];
void setup() {
  size(3*w, 3*h);
  colorMode(HSB);
}
void draw() {
  noStroke();
  for (int i=1; i< h-1; i++) {
    for (int j=1; j< w-1; j++) {
      float u = us[i][j];
      float v = vs[i][j];
      float newu = 0.8*lap(us, i, j) - u*v*v + 0.99*u + 0.015;
      float newv = 0.52*lap(vs, i, j) +  u*v*v + 0.935*v;
      us[i][j] = constrain(newu, 0, 1);
      vs[i][j] = constrain(newv, 0, 1);
      fill( 200*us[i][j], 255, 255 );
      rect(j*3, i*3, 3, 3);
    }
  }
}
float lap(float[][] a, int i, int j) {
  float x=-a[i][j]+0.2*(a[i-1][j]+a[i+1][j]+a[i][j-1]+a[i][j+1]);
  x+=0.05*(a[i-1][j-1]+a[i-1][j+1]+a[i+1][j-1]+a[i+1][j+1]);
  return x;
}
void mousePressed() {
  for (int i=mouseY-30; i< mouseY+30; i++) 
    for (int j=mouseX-30; j<mouseX+30; j++) 
      vs[i/3][j/3]=1;
}
