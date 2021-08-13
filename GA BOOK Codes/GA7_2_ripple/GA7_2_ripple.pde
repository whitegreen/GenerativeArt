int w=800;
int h=600;
float[][] d = new float[h][w];
float[][] hd = new float[h][w];
void setup(){
   size(w, h);
}
void mousePressed(){
  d[mouseY][mouseX]=100;
}
void draw(){
  loadPixels();
  float[][] t= new float[h][w];
  for(int i=1; i< h-1 ; i++) {
     for(int j=1; j< w-1 ; j++) {
        t[i][j]= (d[i-1][j]+ d[i+1][j]+ d[i][j-1]+d[i][j+1])*0.5 -hd[i][j];
        t[i][j]*=0.999;
        pixels[i*w+j]= color(160*d[i][j]);
     }
  }
  updatePixels();
  hd=d;
  d=t;
}
