// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】tony aさん
// 【作品名】stuff 10
// https://openprocessing.org/sketch/1274942
//

class GameSceneCongratulations286 extends GameSceneCongratulationsBase {
  Shape shape1, shape2, shape3, shape4, shape5;
  Zodiac[] lis;
  int ang;

  @Override void setup() {
    background(100);

    shape1 = new Shape(0, 255, 3, 255, 215, 0, 255, false, 8);
    shape2 = new Shape(0, 270, 10, 255, 215, 0, 255, false, 8);
    shape3 = new Shape(0, 280, 10, 255, 215, 0, 255, false, 8);
    shape4 = new Shape(0, 340, 3, 255, 215, 0, 255, false, 4);
    shape5 = new Shape(0, 425, 3, 255, 215, 0, 255, false, 4);

    lis = new Zodiac[8];
    int c = 0;
    for (int i=0; i<lis.length; i++) {
      c += 1;
      if (c>8) {
        c -= 8;
      }
      lis[i] = new Zodiac(c, 2, 20, 255, 255, 255);
    }

    ang = 0;
  }
  @Override void draw() {
    push();
    background(0);
    translate(width/2, height/2);
    rotate(radians(ang));

    taigy(120);

    noFill();
    stroke(255, 215, 0);
    strokeWeight(10);
    ellipse(0, 0, 200, 200);
    stroke(255);
    ellipse(0, 0, 230, 230);
    stroke(255, 215, 0);

    stroke(255, 215, 0);
    strokeWeight(5);
    ellipse(0, 0, 300, 300);

    strokeWeight(2);
    int amount = 60;
    float a = 360/(float)amount;
    for (int j=0; j<amount; j++) {
      float an = radians(a*j);
      float x = 150 * cos(an);
      float y = 150 * sin(an);
      float X = 65 * cos(an);
      float Y = 65 * sin(an);
      line(x, y, X, Y);
    }

    stroke(255, 215, 0);
    re(185, 8, 70, 50, false);

    stroke(255);
    ellipse(0, 0, 320, 320);
    re(160, 4, 30, 30, false);

    stroke(255, 215, 0);
    strokeWeight(10);
    ellipse(0, 0, 380, 380);

    shape1.show(22.5, 0);
    shape2.show(22.5, 0);
    shape3.show(22.5, 0);

    re(250, 8, 70, 50, true);

    int rune_num = lis.length;
    final float w = 60;
    final float h = 8;
    for (int j=0; j<rune_num; j++) {
      float an = radians(45*j);
      rotate(an);
      taicy(j+1, 0, 275, w, h);
      rotate(-an);
    }

    for (int i=0; i<rune_num; i++) {
      float ang = 360/(float)rune_num*i;
      lis[i].show(210, ang);
    }

    for (int i=0; i<rune_num; i++) {
      float ang = 180+360/(float)rune_num*i;
      lis[i].show(380, ang);
    }

    shape4.show(0, 0);
    shape4.show(45, 0);
    shape5.show(0, 0);
    shape5.show(45, 0);

    ang +=1;
    pop();

    logoRightLower(#ff0000);
  }

  void re(float r, int amount, float w, float h, boolean fi) {
    strokeWeight(2);
    if (fi) {
      fill(0);
    } else {
      noFill();
    }

    for (int j=0; j<amount; j++) {
      float an = radians(360/(float)amount*j);
      rotate(an);
      rect(-w/2, -r-h, w, h);
      rotate(-an);
    }
  }

  class Shape {
    float dis;
    float R;
    float w;
    int r, g, b, alp;
    boolean Fi;
    int num;
    float offset;

    Shape(float dis, float R, float w,
      int r, int g, int b, int alp, boolean Fill, int num) {
      this.dis = dis;
      this.R = R;
      this.w = w;
      this.r = r;
      this.g = g;
      this.b = b;
      this.alp = alp;
      this.Fi = Fill;
      this.num = num;
      this.offset = 360/(float)this.num;
    }

    void show(float ang, int a) {
      stroke(this.r, this.g, this.b, this.alp);
      strokeWeight(this.w);
      if (this.Fi) {
        fill(this.r, this.g, this.b, this.alp);
      } else {
        noFill();
      }

      float cen_x = 0 + this.dis * cos(radians(a-90));
      float cen_y = 0 + this.dis * sin(radians(a-90));

      beginShape();
      for (int j = 0; j < this.num; j++) {
        float x = cen_x + (this.R) * cos(radians(ang+this.offset*j));
        float y = cen_y + (this.R) * sin(radians(ang+this.offset*j));
        vertex(x, y);
      }
      endShape(CLOSE);
    }
  }
  void taicy(int num, float cenx, float ceny, float w, float h) {
    if (num==1) {
      lin(cenx, ceny-2*h, w, h);
      lin(cenx, ceny, w, h);
      lin(cenx, ceny+2*h, w, h);
    }
    if (num==2) {
      lin(cenx, ceny, w, h);
      dotlin(cenx, ceny-2*h, w, h);
      lin(cenx, ceny+2*h, w, h);
    }
    if (num==3) {
      lin(cenx, ceny-2*h, w, h);
      dotlin(cenx, ceny, w, h);
      lin(cenx, ceny+2*h, w, h);
    }
    if (num==4) {
      dotlin(cenx, ceny-2*h, w, h);
      dotlin(cenx, ceny, w, h);
      lin(cenx, ceny+2*h, w, h);
    }
    if (num==5) {
      lin(cenx, ceny, w, h);
      lin(cenx, ceny-2*h, w, h);
      dotlin(cenx, ceny+2*h, w, h);
    }
    if (num==6) {
      lin(cenx, ceny, w, h);
      dotlin(cenx, ceny-2*h, w, h);
      dotlin(cenx, ceny+2*h, w, h);
    }
    if (num==7) {
      dotlin(cenx, ceny, w, h);
      lin(cenx, ceny-2*h, w, h);
      dotlin(cenx, ceny+2*h, w, h);
    }
    if (num==8) {
      dotlin(cenx, ceny, w, h);
      dotlin(cenx, ceny-2*h, w, h);
      dotlin(cenx, ceny+2*h, w, h);
    }
  }

  void lin(float cenx, float ceny, float w, float h) {
    fill(255);
    float x = cenx-w/2;
    float y = ceny-h/2;
    rect(x, y, w, h);
  }

  void dotlin(float cenx, float ceny, float w, float h) {
    float x = cenx-w/2;
    float y = ceny-h/2;
    rect(x, y, w/5*2, h);
    rect(x+w/5*3, y, w/5*2, h);
  }

  void taigy(float r) {
    float an1 = radians( - 90);
    float an2 = radians(  90);

    //stroke(0);
    noStroke();
    fill(255);
    float x = -r/4 * cos(an1);
    float y = -r/4 * sin(an1);
    final float SCALE = 0.95f;
    ellipse(x, y, r/2*SCALE, r/2*SCALE);

    stroke(0);
    fill(255);
    arc(0, 0, r, r, an1, an2);

    fill(0);
    x = r/4 * cos(an1);
    y = r/4 * sin(an1);
    ellipse(x, y, r/2, r/2);

    stroke(255);
    fill(255);
    ellipse(x, y, r/6, r/6);

    noStroke();
    x = -r/4 * cos(an1);
    y = -r/4 * sin(an1);

    fill(0);
    ellipse(x, y, r/6, r/6);
  }
  class Zodiac {
    int choice;
    float w;
    float r;
    int R, g, b;

    Zodiac(int word_choice, float w, float r, int R, int g, int b) {
      this.choice = word_choice;
      this.w = w;
      this.r = r;
      this.R = R;
      this.g = g;
      this.b = b;
    }

    void show(float rr, float a) {
      float x_cen = rr * cos(radians(a-90));
      float y_cen = rr * sin(radians(a-90));

      strokeWeight(this.w);
      noFill();

      float len = this.r/4;
      float len2 = this.r/2;
      float len3 = this.r/1.5;

      float an = radians(a);
      float an1 = radians(a+180);
      float an2 = radians(a-90);
      float an3 = radians(a+90);
      float an4 = radians(a-45);
      float an5 = radians(a+45);
      float an6 = radians(a-135);
      float an7 = radians(a+135);

      if (this.choice < 1 || 8 < this.choice) {
        println("うぎゃあ");
      }

      float k;
      float xp1, xp2, xp3, xp4, xp5, xp6, xp7;
      float yp1, yp2, yp3, yp4, yp5, yp6, yp7;
      if (this.choice == 8) {
        // Virgo  ()
        stroke(this.R, this.g, this.b);

        k = this.r / 2;
        xp1 = x_cen -2 * k;
        xp2 = x_cen - k;
        xp3 = x_cen;
        xp4 = x_cen + k;
        xp5 = x_cen + k* 2;
        xp6 = x_cen + k/2;
        xp7 = x_cen + k/2 + k;

        yp2 = y_cen - k;
        yp3 = y_cen;
        yp4 = y_cen + k;
        yp6 = y_cen + k/2;
        yp7 = y_cen + k/2 + k;

        beginShape();

        curveVertex(xp1, yp2);
        curveVertex(xp1, yp2);
        curveVertex(xp2, yp2);
        curveVertex(xp2, yp4);
        curveVertex(xp2, yp4);
        endShape();

        beginShape();
        curveVertex(xp2, yp2);
        curveVertex(xp2, yp2);
        curveVertex(xp3, yp2);
        curveVertex(xp3, yp4);
        curveVertex(xp3, yp4);
        endShape();

        beginShape();
        curveVertex(xp3, yp2);
        curveVertex(xp3, yp2);
        curveVertex(xp4, yp2);
        curveVertex(xp4, yp4);
        curveVertex(xp5, yp4);
        curveVertex(xp5, yp4);
        endShape();

        beginShape();
        curveVertex(xp5-k/2, yp4-k/2);
        curveVertex(xp5-k/2, yp4-k/2);
        curveVertex(xp5, yp4);
        curveVertex(xp5-k/2, yp4+k/2);
        curveVertex(xp5-k/2, yp4+k/2);
        endShape();
      }

      if (this.choice == 7) {
        // Libra ()

        xp1 = x_cen + len * cos(an3);
        yp1 = y_cen + len * sin(an3);

        xp2 = xp1 + len3 * cos(an1);
        yp2 = yp1 + len3 * sin(an1);

        xp3 = xp1 + len3 * cos(an);
        yp3 = yp1 + len3 * sin(an);

        xp4 = xp2 + len * cos(an3);
        yp4 = yp2 + len * sin(an3);

        xp5 = xp3 + len * cos(an3);
        yp5 = yp3 + len * sin(an3);


        stroke(this.R, this.g, this.b);
        line(xp3, yp3, xp2, yp2);
        line(xp5, yp5, xp4, yp4);
        arc(x_cen, y_cen, this.r*0.8, this.r*0.8, an7+radians(15), an5-radians(15)+TWO_PI);
      }
      if (this.choice == 6) {
        // Virgo  ()
        stroke(this.R, this.g, this.b);

        k = this.r / 2;
        xp1 = x_cen -2 * k;
        xp2 = x_cen - k;
        xp3 = x_cen;
        xp4 = x_cen + k;
        xp5 = x_cen + k* 2;
        xp6 = x_cen + k/2;
        xp7 = x_cen + k/2 + k;

        yp2 = y_cen - k;
        yp3 = y_cen;
        yp4 = y_cen + k;
        yp6 = y_cen + k/2;
        yp7 = y_cen + k/2 + k;

        beginShape();

        curveVertex(xp1, yp2);
        curveVertex(xp1, yp2);
        curveVertex(xp2, yp2);
        curveVertex(xp2, yp4);
        curveVertex(xp2, yp4);
        endShape();

        beginShape();
        curveVertex(xp2, yp2);
        curveVertex(xp2, yp2);
        curveVertex(xp3, yp2);
        curveVertex(xp3, yp4);
        curveVertex(xp3, yp4);
        endShape();

        beginShape();
        curveVertex(xp3, yp2);
        curveVertex(xp3, yp2);
        curveVertex(xp4, yp2);
        curveVertex(xp4, yp4);
        curveVertex(xp5, yp4);
        curveVertex(xp5, yp4);
        endShape();

        beginShape();
        curveVertex(xp6, yp6);
        curveVertex(xp6, yp6);
        curveVertex(xp4, yp3);
        curveVertex(xp7, yp3);
        curveVertex(xp7, yp6);
        curveVertex(xp6, yp7);
        curveVertex(xp6, yp7);
        endShape();
      }
      if (this.choice == 5) {
        // Leo ()

        xp1 = x_cen + len2 * cos(an1);
        yp1 = y_cen + len2 * sin(an1);

        xp2 = x_cen + len2 * cos(radians(a-60));
        yp2 = y_cen + len2 * sin(radians(a-60));

        xp3 = x_cen + len2 * cos(radians(a+60));
        yp3 = y_cen + len2 * sin(radians(a+60));

        xp4 = xp1 + len * cos(an);
        yp4 = yp1 + len * sin(an);

        xp5 = xp2 + len * cos(an1);
        yp5 = yp2 + len * sin(an1);

        xp6 = xp2 + len * cos(an);
        yp6 = yp2 + len * sin(an);

        xp7 = xp3 + len * cos(an1);
        yp7 = yp3 + len * sin(an1);

        stroke(this.R, this.g, this.b);
        ellipse(xp1, yp1, this.r/2, this.r/2);
        line(xp4, yp4, xp5, yp5);
        line(xp6, yp6, xp7, yp7);
        arc(xp2, yp2, this.r/2, this.r/2, an1, an+TWO_PI);
        arc(xp3, yp3, this.r/2, this.r/2, an, an1);
      }
      if (this.choice == 4) {
        // Cancer()

        xp1 = x_cen + len2 * cos(an);
        yp1 = y_cen + len2 * sin(an);

        xp2 = x_cen + len2 * cos(an1);
        yp2 = y_cen + len2 * sin(an1);

        stroke(this.R, this.g, this.b);
        ellipse(xp1, yp1, this.r/2, this.r/2);
        ellipse(xp2, yp2, this.r/2, this.r/2);
        arc(x_cen, y_cen, this.r*1.5, this.r, an, an7);
        arc(x_cen, y_cen, this.r*1.5, this.r, an1, an4+TWO_PI);
      }

      if (this.choice == 3) {
        // Gemini()

        xp1 = x_cen + this.r*1.5 * cos(an2);
        yp1 = y_cen + this.r*1.5 * sin(an2);

        xp2 = x_cen + this.r*1.5 * cos(an3);
        yp2 = y_cen + this.r*1.5 * sin(an3);

        xp3 = xp1 + this.r * cos(radians(a+70));
        yp3 = yp1 + this.r * sin(radians(a+70));

        xp4 = xp1 + this.r * cos(radians(a+110));
        yp4 = yp1 + this.r * sin(radians(a+110));

        xp5 = xp2 + this.r * cos(radians(a-70));
        yp5 = yp2 + this.r * sin(radians(a-70));

        xp6 = xp2 + this.r * cos(radians(a-110));
        yp6 = yp2 + this.r * sin(radians(a-110));

        stroke(this.R, this.g, this.b);
        line(xp3, yp3, xp5, yp5);
        line(xp4, yp4, xp6, yp6);
        arc(xp1, yp1, this.r*2, this.r*2, an5, an7);
        arc(xp2, yp2, this.r*2, this.r*2, an6, an4);
      }

      if (this.choice == 2) {
        // Taurus  ()

        xp1 = x_cen + this.r * cos(an2);
        yp1 = y_cen + this.r * sin(an2);

        stroke(this.R, this.g, this.b);
        ellipse(x_cen, y_cen, this.r, this.r);
        arc(xp1, yp1, this.r, this.r, an, an1);
      }

      if (this.choice == 1) {
        // Aries ()
        float gap = this.r / 800;

        xp1 = x_cen + len2 * cos(an2);
        yp1 = y_cen + len2 * sin(an2);

        xp2 = x_cen + len2 * cos(an3);
        yp2 = y_cen + len2 * sin(an3);

        xp3 = xp1 + len2 * cos(an);
        yp3 = yp1 + len2 * sin(an);

        xp4 = xp1 + len2 * cos(an1);
        yp4 = yp1 + len2 * sin(an1);

        stroke(this.R, this.g, this.b);
        line(xp2, yp2, xp1, yp1);
        float rrr = this.r/2;
        for (int n=180; n<540; n++) {
          float ang = radians( n);
          float x = xp3 + rrr * cos(ang);
          float y = yp3 + rrr * sin(ang);
          point(x, y);
          rrr -= gap;
        }

        rrr = this.r/2;
        for (int n=720; n>360; n--) {
          float ang = radians( n);
          float x = xp4 + rrr * cos(ang);
          float y = yp4 + rrr * sin(ang);
          point(x, y);
          rrr -= gap;
        }
      }
    }
  }
  @Override void mousePressed() {
    gGameStack.change(new GameSceneTitle());
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
