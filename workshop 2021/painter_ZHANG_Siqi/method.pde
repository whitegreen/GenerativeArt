void Brush() {
  float s = 2+30/dist(px, py, brush.x, brush.y);
  s=min(20, s);//limit strokeWeight
  float r0=min(40, (5/dist(px, py, brush.x, brush.y)));//stay the longer the flower will get bigger
  if (20==s)
    flower(r0); //flower follow the mouse move 
  strokeWeight(s);
  stroke(0, s*100);
  line(px, py, brush.x, brush.y);
  stroke(255, s*100);
  line(width-px, height-py, width-brush.x, height-brush.y);//symmetric
}

void ink(float bx, float by, float  c) {
  noStroke();
  fill(c);
  float r = random(0.5, 10);
  ellipse(bx+random(-30, 30), by+random(-30, 30), r, r);
  ellipse(bx+random(-30, 30), by+random(-30, 30), r, r);
}

void flower(float r0) { 
  int n=(int)random(10, 50);
  float gap=TWO_PI/n;
  for (int i=1; i<n; i++) {
    float theta=i*gap;
    float r=r0*sin(theta*i*random(1, 20));
    strokeWeight(0.5);
    fill(255, 200);
    stroke(cols[(int)random(cols.length)], random(100, 200));
    float x=mouseX*0.9+r*cos(theta);
    float y=mouseY*0.9+r*sin(theta);
    ellipse(x, y, random(5, 20), random(5, 20));//petal
    line(x+random(-5, 5), y+random(-5, 5), x+random(-15, 15), y+random(-15, 15)); //filament
  }
}

void autosplatter() { //the growing square above background 
  strokeWeight(1);
  stroke(cols[(int)random(cols.length)], 50);
  if (frameCount<2000) 
   for (int i=0; i<3000; i++)    
      jump();
}

void jump() {
  float nx=sin(-12.4*y0)-cos(12.5*x0);
  float ny=sin(-1*x0)-cos(1.9+y0);     
  point(200*x0+width/2, 200*y0+height/2);
  x0=nx;
  y0=ny;
}

