// use Processing 2
// created 20190906 by LiuShuaiJie, modified 20211011 by whitegreen 
// github.com/whitegreen/GenerativeArt
Field f, f1;
ArrayList<Line> lines;
ArrayList<Line>  lines1;
int num = 80000;
int num1=20000;
PImage back;
float vmin = 3;
float vmax = 6;
float fmin = 0.5;
float fmax = 5;


void setup() {
  size(1920, 1080, P2D);
  f = new Field(4);
  f1=new Field(2);
  lines = new ArrayList<Line>();
  lines1 = new ArrayList<Line>();
  back = loadImage("1.jpg");
  back.loadPixels();

  for (int i = 0; i < num; i++) {
    PVector pos = new PVector (random(width), random(height));
    Line a = new Line(pos);
    a.col = back.get(int(pos.x), int(pos.y));
    lines.add(a);
  }
  for (int i = 0; i < num1; i++) {
    PVector pos1 = new PVector (random(width), random(height));
    Line a1 = new Line(pos1);
    a1.col = color(200, brightness(back.get(int(pos1.x), int(pos1.y))));
    lines1.add(a1);
  }
  background(0);
}

void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  for (Line b : lines1) 
    b.proceed(f1,f1);
  for (Line b : lines) 
    b.proceed(f1,f);
  for (Line b : lines1) 
    b.proceed(f1,f1);
}


