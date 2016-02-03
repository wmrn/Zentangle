PFont myFont;
int Pagenum;

Page page;
Question [] question= new Question [50];
Star [] star = new Star [4];

void setup() {
  size(800, 700);
  smooth();
  myFont = createFont("MS-Gothic-48.vlw", 50);
  textFont(myFont);
  page= new Page();
  Pagenum=0;  
  for (int i=0; i<50; i++) {
    question[i]= new Question();
  }
  for (int i=1; i<4; i++) {
    star[i]= new Star(900*((i+1)*2+3)/2, 900/(2*(i+1)));
  }
  star[0]=new Star(900/2, 900/4);
}

void draw() {
  if (Pagenum==0) {
    page.dis1();
  } else if (Pagenum==1) {
    page.dis2();
  } else if (Pagenum==2) {
    page.dis3();
  } else if (Pagenum==3) {
    page.dis4();
  } else if (Pagenum==4) {
    page.dis5();
  } else if (Pagenum==5) {
    page.dis6();
  } else if (Pagenum==6) {
    page.dis7();
  } else if (Pagenum==7) {
    page.dis8();
  } else if (Pagenum==8) {
    page.dis9();
  } else if (Pagenum==9) {
    page.dis10();
  } else if (Pagenum==10) {
    page.dis11();
  } else if (Pagenum==11) {
    page.dis12();
  } else if (Pagenum==12) {
    page.dis13();
  } else if (Pagenum==13) {
    page.dis14();
  }
}

void mousePressed() {
  Pagenum++;
  if (Pagenum==3) {
    page.mouse3to4();
  }
  if (Pagenum==6) {
    textFont(myFont);
  }
  if(Pagenum>13){
    Pagenum=0;
  }
}

