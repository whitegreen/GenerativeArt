int w=360; 
int h=360;
int[][] d = new int[h][w];
void setup() {
  size(2*w, 2*h);
  noStroke();
  fill(0);
}
void draw() {
  background(255);
  int[][] c = new int[h][w];
  for (int i=1; i< h -1; i++) {
    for (int j=1; j< w -1; j++) {
      int count=d[i-1][j-1]+d[i-1][j]+d[i-1][j+1]+d[i][j-1] + d[i][j+1]+d[i+1][j-1]+d[i+1][j]+d[i+1][j+1];
      c[i][j]= 1-count%2;  
      if (1==c[i][j]) rect(2*j, 2*i, 2, 2);
    }
  }
  d=c;
}

