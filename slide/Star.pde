class Star {
  int vertex_num; //頂点数(星を描画、とげの数*2)
  float R; //頂点から中心までの距離(半径)
  float R_out; //中心からとげまでの距離(半径)
  float R_in; //中心から谷までの距離(半径)
  int posSX; //x座標の位置
  int posSY; //y座標の位置
  int speedSX;
  int speedSY;

  void display(int r,int g,int b) {
    fill(r,g,b);
    pushMatrix();
    translate(posSX, posSY);
    beginShape();
    for (int i = 0; i < vertex_num; i++) {
      if (i%2 == 0) {
        R = R_out;
      } else {
        R = R_in;
      }
      vertex(R*cos(radians(360*i/vertex_num)), R*sin(radians(360*i/vertex_num)));
    }
    endShape(CLOSE);
    popMatrix();
  }

  Star(float R,float r) {
   vertex_num = 10*2;
    R_out = R;
    R_in = r;
    posSX=0;
    posSY=0;
    speedSX=(int)random(1, 5);
    speedSY=(int)random(1, 5);
  }

  void move() {
    posSX += speedSX;
    posSY += speedSY;
    if ( posSX > width-15 ) {
      posSX = width - 15;
      speedSX = -speedSX;
    }
    if ( posSX < 15 ) {
      posSX = 15;
      speedSX = -speedSX;
    }
    if ( posSY > height-15) {
      posSY = height - 15;
      speedSY = -speedSY;
    }
    if ( posSY - 15 < 0 ) {
      posSY = 15;
      speedSY = -speedSY;
    }
  }
}

