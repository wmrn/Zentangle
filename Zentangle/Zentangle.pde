PImage img;
int [] verx= new int [4];
int [] very= new int [4];
int point=-1;
int stage;
ArrayList <Integer> x=new ArrayList<Integer>();
ArrayList <Integer> y=new ArrayList<Integer>();
ArrayList <Integer> terx=new ArrayList<Integer>();
ArrayList <Integer> tery=new ArrayList<Integer>();
int num2, num3;
PImage [] patern=new PImage[13];
ArrayList <Integer> flag=new ArrayList<Integer>();

void setup() {
  size(700, 700, P2D);
  img=loadImage("back.png");
  patern[0]=loadImage("018.jpg");
  patern[1]=loadImage("082.jpg");
  patern[2]=loadImage("132.jpg");
  patern[3]=loadImage("067.jpg");
  patern[4]=loadImage("089.jpg");
  patern[5]=loadImage("047.jpg");
  patern[6]=loadImage("042.jpg");
  patern[7]=loadImage("024.jpg");
  patern[8]=loadImage("030.jpg");
  patern[9]=loadImage("068.jpg");
  patern[10]=loadImage("106.jpg");
  patern[11]=loadImage("117.jpg");
  patern[12]=loadImage("133.jpg");
}

void draw() {
  num2=x.size();
  num3=terx.size();
  background(255);
  if (stage>0 && stage<4) {
    fill(0);
    textSize(50);
    text("stage:"+stage, 0, 50);
    fill(0);
    stroke(0);
    rect(0, 650, 700, 50);
  }
  if (stage<3) {
    fill(255);
    text("next stage☞", width-330, height-15);
  }
  if (stage==0) {
    image(img, 0, 0, width, height);
  }
  for (int i=0; i<4; i++) {
    strokeWeight(7);
    stroke(0);
    point(verx[i], very[i]);
  }
  if (stage>=3) {
    for (int i=0; i<13; i++) {
      stroke(0);
      image(patern[i], 54*i, 650, 50, 50);
    }
    /*if (num3>0 && mousePressed) {
      println(terx.get(num3-1)+","+ tery.get(num3-1));
      println(mouseX+","+mouseY);
    }*/
    for (int i=0; i<num3/4; i++) {
      beginShape();
      noStroke();
      texture(patern[flag.get(i+1)]);
      vertex(terx.get(4*i), tery.get(i), 0, 0);
      vertex(terx.get(4*i+1), tery.get(4*i+1), 400, 0);
      vertex(terx.get(4*i+2), tery.get(4*i+2), 400, 400);
      vertex(terx.get(4*i+3), tery.get(4*i+3), 0, 400);
      vertex(terx.get(4*i), tery.get(i), 0, 0);
      endShape();
    }
  }
  if (stage>=2) {
    for (int i=0; i<3; i++) {
      stroke(0);
      line(verx[i], very[i], verx[i+1], very[i+1]);
    }
    line(verx[3], very[3], verx[0], very[0]);

    if (num2%2==0) {
      for (int i=0; i<num2; i+=2) {
        line(x.get(i), y.get(i), x.get(i+1), y.get(i+1));
      }
    } else {
      for (int i=0; i<num2-1; i+=2) {
        if (mousePressed) {
          line(x.get(num2-1), y.get(num2-1), mouseX, mouseY);
        }
        line(x.get(i), y.get(i), x.get(i+1), y.get(i+1));
      }
    }
  }
}

void mousePressed() {
  if (mouseY>=height-50 && mouseX>=375 && stage<3) {
    stage++;
  }
  if (stage==1) {
    point++;
    if (point>=4) {
      point=0;
    }
    verx[point]=mouseX;
    very[point]=mouseY;
  }
  if (stage==2 && get(mouseX, mouseY)==#000000) {
    x.add(mouseX);
    y.add(mouseY);
  }
  if (stage==3 && mouseY>=height-50) {
    flag.add(mouseX/54);
  } else if (stage==3 && get(mouseX, mouseY)==#000000 && mouseY<height-50) {
    terx.add(mouseX);
    tery.add(mouseY);
    //println(mouseX+","+mouseY);
  }
}

void mouseReleased() {
  if (stage==2 && get(mouseX, mouseY)==#000000) {
    x.add(mouseX);
    y.add(mouseY);
  }
}

