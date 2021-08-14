//https://github.com/whitegreen/GenerativeArt
int n=720;
float[] x=new float[n];
float[] y=new float[n];
float[] dx=new float[n];
float[] dy=new float[n];
int w=800;
int h=800;
void setup() {
  size(w, h); //size(800,800)in Processing 3
  float speed=5;
  for (int i=0; i<n; i++) {
    x[i]=w/2;
    y[i]=h/2;
    float ang= i*2*PI/n;
    dx[i]=speed*cos(ang);
    dy[i]=speed*sin(ang);
  }
}
void draw() {
  fill(0, 60);
  rect(0, 0, w, h);
  fill(255);
  noStroke();
  for (int i=0; i<n; i++) {
    ellipse(x[i], y[i], 6, 6);
    x[i]+=dx[i];
    y[i]+=dy[i];
    if (x[i]>w || x[i]<0)  dx[i]*=-1;
    if (y[i]>h || y[i]<0)  dy[i]*=-1;
  }
}

