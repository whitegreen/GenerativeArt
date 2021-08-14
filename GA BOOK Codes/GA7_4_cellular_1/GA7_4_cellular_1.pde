//https://github.com/whitegreen/GenerativeArt
int w=360; 
int h=360;
int[][] d = new int[h][w];
void setup() {
  size(2*w, 2*h);
  int a=0; 
  for (int i=a; i< h-a; i++) 
    for (int j=a; j< w-a; j++) 
      d[i][j]=1;
}
void draw() {
  background(255);
  noStroke();
  fill(0);
  int[][] c = new int[h][w];
  for (int i=1; i< h -1; i++) {
    for (int j=1; j< w -1; j++) {
      int count=d[i-1][j-1]+d[i-1][j]+d[i-1][j+1]+d[i][j-1]
      + d[i][j+1]+d[i+1][j-1]+d[i+1][j]+d[i+1][j+1];
      c[i][j]=d[i][j];
      if (0== d[i][j]) { //dead   
        if (3==count || 6==count || 7==count )   c[i][j]=1;  // revive
      } else {  //live
        if (3>count || 5==count)   c[i][j]=0;  // die
        rect(2*j, 2*i, 2,2);
      }
    }
  }
  d=c;
}
