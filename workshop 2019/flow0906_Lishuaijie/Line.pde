class Line {
  PVector pos,vel,acc;
  PVector futV, futP, preP;
  float Vmax,Fmax,ang,r;

  float sradius = 20.0;
  float rand = random(1.0);
  color col = 255;
  
  Line(PVector pos) {
    this.pos = pos;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    r = 4.0;
    Vmax = vmin + rand*(vmax-vmin);
    Fmax = fmin + rand*(fmax-fmin);
  }

  void update() {
    preP = pos.get();
    vel.add(acc);
    pos.add(vel);
    vel.limit(Vmax);
    acc.mult(0);
    ang = vel.heading();
  }  

  void futPos() {
    futV = vel.get();
    futV.normalize();
    futV.mult(2.0);
    futP =  PVector.add(futV, pos); //   futV.add(pos);
  }

  void follow(Field flow) {
    PVector fo = flow.iter(futP);
    fo.mult(Vmax);
    PVector st = PVector.sub(fo, vel);
    st.limit(Fmax);
     acc.add(st);
  }

  void find(PVector target) {
    PVector fo = PVector.sub(target, pos);
    fo.normalize();
    fo.mult(Vmax);
    PVector st = PVector.sub(fo, vel);
    st.limit(Fmax);
     acc.add(st);
  }

  void spin() {
    PVector futurePos = vel.get();
    futurePos.add(pos);
    float angle = vel.heading()-0.05;
    PVector spos = new PVector(futurePos.x + cos(angle)*sradius, futurePos.y + sin(angle)*sradius);
    find(spos);
  }

  void edge() {
    if (pos.x < -r) pos.x = width+r;
    if (pos.y < -r) pos.y = height+r;
    if (pos.x > width+r) pos.x = -r;
    if (pos.y > height+r) pos.y = -r;
  }
  
  void proceed(Field fa, Field fb) {
    futPos();
    follow(fa);
    fb.depo(pos, vel);
    spin();
    update();
    edge();
    stroke(col, 60);
    if (preP.dist(pos) < 30) 
      line(preP.x, preP.y, pos.x, pos.y);
  }
}
