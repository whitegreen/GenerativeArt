class Field {
  PVector[][] ff;
  int cols, rows;
  int index;
  PImage img;
  float ang = 0;

  Field(int r) {
    index = r;
    cols = width/index;
    rows = height/index;
    ff = new PVector[cols][rows];
    init();
  }

  void init() {
    for (int i = 0; i < cols; ++i) 
      for (int j = 0; j < rows; ++j)
        ff[i][j] = PVector.random2D();
  }

  void depo(PVector loc, PVector ph) {
    int cc = int(constrain(loc.x/index, 0, cols-1));
    int rr = int(constrain(loc.y/index, 0, rows-1));
    PVector tmp = ph.get();
    tmp.normalize();
    ff[cc][rr] =tmp;
  }

  PVector iter(PVector iter) {
    int cc = int(constrain(iter.x/index, 0, cols-1));
    int rr = int(constrain(iter.y/index, 0, rows-1));
    return ff[cc][rr];
  }
}
