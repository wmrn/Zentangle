class Page {
  int mwr;
  int [] theta = new int [5];
  PImage img0, img1, img4, img7, img12;
  int Lsize;
  int ud;
  int updown; 
  float Lx, Ly, Rx, Ry;
  int [] r= new int [3];
  int [] g= new int [3];
  int [] b= new int [3];
  int [] s= new int[3];
  int [] pos = new int [6];
  PFont [] sfonts= new PFont [16];
  int fontwave;
  int ttheta1, ttheta2;
  float tposx, tposy;
  int fnum;
  float picwb, pichb, picwa, picha;
  float picposx;
  float picposy;
  float  distw, disth;
  int [] crossx=new int [4];
  int [] crossy=new int [4];
  PFont efont;


  Page() {
    ud=1;
    img1=loadImage("Zentangle1.jpg");
    Lsize=50;
    sfonts[0]=createFont("MS-Gothic-48.vlw", 50);
    sfonts[1] = loadFont("CooperBlack-48.vlw");
    sfonts[2] = loadFont("RomanC-48.vlw");
    sfonts[3] = loadFont("Monotxt-48.vlw");
    sfonts[4] = loadFont("Papyrus-Regular-48.vlw");
    sfonts[5] = loadFont("LucidaBright-48.vlw");
    sfonts[6]=loadFont("RomanD-48.vlw");
    sfonts[7]=loadFont("ScriptMTBold-48.vlw");
    sfonts[8]=loadFont("ShowcardGothic-Reg-48.vlw");
    sfonts[9]=loadFont("Stencil-48.vlw");
    sfonts[10]=loadFont("Swiss721BT-BoldCondensedOutline-48.vlw");
    sfonts[11]=loadFont("LatinWide-48.vlw");
    sfonts[12]=loadFont("Symap-48.vlw");
    sfonts[13]=loadFont("TempusSansITC-48.vlw");
    sfonts[14]=loadFont("VinerHandITC-48.vlw");
    sfonts[15]=loadFont("Syastro-48.vlw");
    fnum=(int)random(0, 15);
    img7=loadImage("time000.png");
    picwb=width-50;
    pichb=height-50;
    picposx=25;
    picposy=25;
    crossx[0]=0;
    crossy[0]=0;
    crossx[1]=width;
    crossy[1]=0;
    crossx[2]=width;
    crossy[2]=height;
    crossx[3]=0;
    crossy[3]=height;
    efont=loadFont("BlackadderITC-Regular-48.vlw");
    img12=loadImage("example.png");
  }

  void dis1() {
    background(255);
    pushMatrix();
    translate(50, 50);
    rotate(radians(mwr));
    tint(255, 255, 255, 255);
    image(img1, -250, -250, 500, 500);
    popMatrix();
    pushMatrix();
    translate(750, 650);
    rotate(radians(-mwr+270));
    scale(-1, 1);//左右反転
    image(img1, -250, -250, 500, 500);
    popMatrix();
    mwr++;
    fill(0);
    textFont(sfonts[0], 50);
    textSize(130);
    textAlign(LEFT);
    text("Zentangle", 220, height/2-70);
    strokeWeight(4);
    for (int ll=0; ll<width; ll++) {
      stroke(0, ll/6);     
      line(220+ll, height/2-70, 220+ll+1, height/2-70);
    }
  }

  void dis2() {
    background(255);
    for (int i=0; i<50; i++) {
      question[i].move();
      question[i].display();
    }
    fill(255, 200);
    noStroke();
    rect(190, 220, 400, 190);
    fill(0);
    textAlign(CENTER);
    textSize(50);
    text("...Zentangleって？", width/2, height/2);
  }

  void dis3() {
    background(255);
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(theta[0]));
    star[0].display(255, 127, 127);
    rotate(radians(theta[1]));
    star[1].display(255, 170, 127);
    rotate(radians(theta[2]));
    star[2].display(255, 212, 127);
    rotate(radians(theta[3]));
    star[3].display(255, 255, 127);
    popMatrix();
    textSize(Lsize);
    fill(173, 51, 53);
    text("Zentangle", width/2, height/2);
    fill(255, 85, 38);
    text("Zentangle", width/2+3, height/2+3);
    for (int i=0; i<5; i++) {
      if (i%2==0) {
        theta[i]+=(i+1);
      } else if (i%2==1) {
        theta[i]-=(i+1);
      }
      if (theta[i]>=360) {
        theta[i]=0;
      } else if (theta[i]<=0) {
        theta[i]=360;
      }
    }
    if (Lsize>=150) {
      ud=-ud;
    } else if (Lsize<=35) {
      ud=-ud;
    }
    Lsize+=ud*5;
  }

  void CaptureToPNG(String fileURL, int num, int digits, String fileType) {  

    //指定した桁数に満たない数字の右側に0を追加
    String numString = nf(num, digits); 

    // フレーム枚にpngへキャプチャ
    String pngName = fileURL + numString + fileType; 
    save(pngName);
  }

  void mouse3to4() {
    CaptureToPNG("./capture/frame_", 0, 3, ".png");
    img4=loadImage("./capture/frame_000.png");
    img4.filter(INVERT);
  }

  void dis4() {
    background(255);
    image(img4, 0, 0);
  }

  void Libra(float posx, float posy) {
    //皿
    strokeWeight(5);
    fill(90, 78, 56);
    stroke(90, 78, 56);
    arc(posx, posy+410, 200, 60, 0, PI);
    fill(226, 197, 131);
    stroke(226, 197, 131);
    ellipse(posx, posy+410, 200, 40);
    strokeWeight(3);
    fill(243, 233, 176);
    stroke(243, 233, 176);
    arc(posx, posy+420, 150, 25, radians(133), radians(407), CHORD);
    //紐
    strokeWeight(1);
    noFill();
    stroke(226, 197, 131);
    ellipse(posx, posy, 12, 12);
    for (int i=0; i<100; i++) {//左
      ellipse(posx-i, posy+5+4*i, 6, 6);
    }
    ellipse(posx-100, posy+405, 12, 12);
    for (int i=0; i<106; i++) {//奥
      ellipse(posx+0.2*i, posy+5+3.7*i, 6, 6);
    }
    ellipse(posx+20, posy+390, 12, 12);
    for (int i=0; i<100; i++) {//右
      ellipse(posx+i, posy+5+4*i, 6, 6);
    }
    ellipse(posx+100, posy+405, 12, 12);
  }

  void dis5() {
    background(255);
    fill(r[0], g[0], b[0]);
    textSize(s[0]);
    text("色", pos[0], pos[1]);
    fill(r[1], g[1], b[1]);
    textSize(s[1]);
    text("大きさ", pos[2], pos[3]);
    fill(r[2], g[2], b[2]);
    textSize(s[2]);
    text("明暗", pos[4], pos[5]);
    if (updown>=20 || updown==0 || updown<=-20) {
      for (int i=0; i<3; i++) {
        r[i]=int(random(255));
        g[i]=int(random(255));
        b[i]=int(random(255));
      }
      for (int i=0; i<6; i++) {
        pos[i]=int(random(0, 600));
      }
      s[0]=int(random(30, 600));
      s[1]=int(random(30, 290));
      s[2]=int(random(30, 400));
    }

    noFill();
    strokeWeight(10);
    stroke(226, 197, 131);
    ellipse(width/2, height-30, 200, 50);//下台
    line(width/2, 30, width/2, height-30);//背骨
    pushMatrix();
    translate(width/2, 70);
    rotate(radians(updown));
    line(-250, 0, 250, 0);//腕
    popMatrix();
    if (updown>=20) {
      ud=-ud;
    } else if (updown<=-20) {
      ud=-ud;
    }
    updown+=ud;
    Lx=400-250*cos(radians(-updown));
    Ly=70+250*sin(radians(-updown));
    Rx=400+250*cos(radians(updown));
    Ry=70+250*sin(radians(updown));
    Libra(Lx, Ly);
    Libra(Rx, Ry);
  }

  void dis6() {
    background(255);
    textFont(sfonts[0], 50);
    fill(0, 100);
    textSize(400);
    text("慣れ", 400, 520);
    textSize(50);
    textFont(sfonts[fnum], 50);
    fill(0, 0, 0, fontwave);
    pushMatrix();
    translate(width/2, height/2);
    pushMatrix();
    translate(tposx-50, tposy+25);
    rotate(radians(ttheta2));
    text("sense", 0, 0);
    popMatrix();
    popMatrix();
    tposx=200*cos(radians(ttheta1));
    tposy=200*sin(radians(ttheta1));
    ttheta1++;
    ttheta2=ttheta1*5;
    fontwave+=ud*5;
    if (fontwave>=255) {
      ud=-ud;
    } else if (fontwave<=0) {
      ud=-ud;
      fnum=(int)random(0, 15);
    }
  }

  void dis7() {
    background(255);
    if (frameCount%5==0) {
      tint(255, 100);
    } else {
      tint(0, 101, 166, 100);
    }
    image(img7, picposx, picposy, picwb, pichb);
    picwa=picwb*1.008;
    picha=pichb/1.008;
    distw=(picwa-picwb)/2;
    disth=(pichb-picha)/2;
    picposx-=distw;
    picposy+=disth;
    picwb=picwa;
    pichb=picha;
    if (frameCount%5==0) {
      fill(0, 101, 166);
    } else {
      fill(0, 0, 0, 0);
    }
    textSize(250);
    textAlign(CENTER);
    text("練習", width/2, height/2+50);
  }
  void dis8() {
    dis7();
    stroke(255, 0, 0);
    strokeWeight(15);
    line(crossx[0], crossy[0], crossx[2], crossy[2]);
    line(crossx[1], crossy[1], crossx[3], crossy[3]);
    if (crossx[0]>=100) {
      ud=-ud;
    } else if (crossx[0]<0) {
      ud=-ud;
    }
    crossx[0]+=ud*5;
    crossy[0]+=ud*5;
    crossx[1]-=ud*5;
    crossy[1]+=ud*5;
    crossx[2]-=ud*5;
    crossy[2]-=ud*5;
    crossx[3]+=ud*5;
    crossy[3]-=ud*5;
  }

  void dis9() {
    background(255);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("stage1\nテキトーに4つの点を打つ", width/2, height/2-50);
  }

  void dis10() {
    background(255);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("stage2\n打った点を線で結び\nテキトーに線で区切る", width/2, height/2-50);
  }

  void dis11() {
    background(255);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("stage3\n線で区切った場所に模様を書く", width/2, height/2-50);
  }
  void dis12() {
    tint(255, 255, 255, 100);
    image(img12, 0, 0, width, height);
  }

  void dis13() {
    background(255);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("stage4\n完成☆", width/2, height/2-50);
  }
  void dis14() {
    background(255);
    textFont(efont);
    fill(0);
    textSize(100);
    textAlign(CENTER);
    text("fin", width/2, height/2);
  }
}

