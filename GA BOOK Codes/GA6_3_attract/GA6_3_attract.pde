//https://github.com/whitegreen/GenerativeArt
int n=2345;
PVector [] ps=new PVector[n];
PVector [] ds=new PVector[n];
PVector [] cs= {new PVector(-300,0), new PVector(300, 0)};
void setup() {
  size(1000, 800);
  for (int i=0; i<n; i++) {
    ds[i]=new PVector();
    PVector v= PVector.random2D();
    v.mult(380);  
    ps[i]= v;
  }
  background(0);
}
void draw() {
  fill(0, 8);
  noStroke();
  rect(0, 0, 1000, 800);
  translate(500,400);
  stroke(255);
  for (int i=0; i<n; i++) {
    for (int j=0; j<cs.length; j++) {
      PVector accel= PVector.sub(cs[j], ps[i]);
      accel.setMag(0.008);  
      ds[i].add(accel);
    }
    ps[i].add(ds[i]);
    point(ps[i].x, ps[i].y);
  }
}

