class Question extends Object {
  int num;
  void init() {
    super.init();
    num=int(random(360));
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(num));
    textSize(100);
    fill(random(255), random(255), random(255));
    text("？", 0, 0);
    popMatrix();
    if (num>=360) {
      num=0;
    } else {
      num++;
    }
  }
}

