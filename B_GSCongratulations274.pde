// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】Ivan Rudnickiさん
// 【作品名】Whirlygig Blossom
// https://openprocessing.org/sketch/1327994
//

class GameSceneCongratulations274 extends GameSceneCongratulationsBase {
  int numcars = 36;
  Car[] cars = new Car[numcars];
  float wSize;
  float av = 0;
  float swing = 5;
  int starget = 0;
  float zoom = 1;
  float ztarget = 1;

  @Override void setup() {
    wSize = height / 5.0f;
    colorMode(HSB, 360);

    for (int i = 0; i < numcars; i += 1) {
      float a = i * TWO_PI / (float)numcars;
      int c = (int)(i*(360/(float)numcars));
      cars[i] = new Car(a, wSize, i, numcars, c);
    }
  }
  @Override void draw() {
    push();
    rectMode(CENTER);
    background(0);
    translate(width / 2, height / 2);
    scale(zoom);
    av = map(mouseX, 0, width, -0.01, 0.01);
    ztarget = map(mouseY, height, 0, 0.5, 2);
    swing = lerp(swing, 1 + starget, 0.05);
    zoom = lerp(zoom, ztarget, 0.05);
    for (Car c : cars) {
      c.show();
      c.move();
    }
    pop();

    logoRightLower(#ff0000);
  }

  class Car {
    float a, ra;
    float s;
    float id;
    int c;
    Car(float a, float s, int id, int num, int c) {
      this.a = a;
      this.ra = 0;
      this.s = s;
      this.id = id * TWO_PI / (float)num;
      this.c = c;
    }
    void show() {
      push();
      noFill();
      rotate(this.a - this.ra);
      translate(this.s / 2.0f, 0);
      stroke(this.c, 300, 360);
      ellipse(0, 0, this.s / 20.0f, this.s / 20.0f);
      line(0, 0, this.s / 1.5, 0);
      translate(this.s / 1.5, 0);
      ellipse(0, 0, this.s / 20.0f, this.s / 20.0f);
      rotate(this.ra);
      line(0, 0, this.s / 2.0f, 0);
      translate(this.s / 2.0f, 0);
      ellipse(0, 0, this.s / 20.0f, this.s / 20.0f);
      rotate(swing * this.a);
      rect(0, 0, this.s / 4.0f, this.s / 4.0f, this.s / 12.0f);
      pop();
    }
    void move() {
      this.ra = (this.id - ((swing * this.a) % TWO_PI)) % TWO_PI;
      this.a += av;
    }
  }

  @Override void mousePressed() {
    starget = (starget + 1) % 13;
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
