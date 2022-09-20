// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】ScoreCircle
// https://openprocessing.org/sketch/869203
// 【00:00 Studio】https://0000.studio/haukun/
//

class GameSceneCongratulations300 extends GameSceneCongratulationsBase {
  ScoreCircle[] c;
  PGraphics pg;

  @Override void setup() {
    c = new ScoreCircle[6];
    for (int i = 0; i < 6; i++) {
      c[i] = new ScoreCircle(i, random(720), random(720));
    }
    pg = createGraphics(width, height);
    PFont font = createFont("Sans Serif", 75);
    pg.beginDraw();
    pg.textFont(font);
    pg.endDraw();
  }
  @Override void draw() {
    push();
    pg.beginDraw();
    pg.background(255);

    for (int i = 0; i < 6; i++) {
      c[i].draw(pg);
      if (!c[i].live()) {
        randomSeed(frameCount);
        c[i].init(random(999), random(720), random(720));
      }
    }
    pg.endDraw();
    image(pg, 0, 0);
    pop();

    logoRightLower(#ff0000);
  }

  class ScoreCircle {
    float index;
    float x, y;
    float c;
    float f;
    float s;

    ScoreCircle(int i, float x, float y) {
      this.init((float)i, x, y);
    }

    void init(float i, float x, float y) {
      this.index = i;
      this.x = x;
      this.y = y;
      this.c = -random(60);
      this.f = random(120) + 120;
      this.s = random(1) + .5;
    }

    void draw(PGraphics pg) {
      randomSeed((long)this.index);

      this.c++;

      //  Circle Size
      float ratio = this.s;
      if (this.c < 0) {
        return;
      } else if (this.c < 60) {
        ratio *= sin(this.c / 60.0f * PI / 2.0f);
      } else if (this.c > this.f - 60) {
        ratio *= sin((this.f - this.c) / 60.0f * PI / 2.0f);
      }

      pg.push();

      //  Score
      pg.noFill();
      pg.translate(this.x, this.y);
      pg.scale(ratio, ratio);
      for (float i = 5; i > 0; i--) {
        pg.circle(0, 0, i * 28 + 50);
      }
      pg.fill(0);

      //  Score Fin
      pg.push();
      pg.rotate(this.index + PI / 2.0f - this.c * .01);
      //text(String.fromCodePoint(0x1D102), -15, -40);
      // PC-8001（TN8001）さん方式で置き換えた
      pg.text(new String(Character.toChars(0x1D102)), -15, -40);
      pg.pop();

      //  Score Start
      pg.push();
      pg.rotate(this.index + PI / 2.0f + PI / 8.0f - this.c * .01);
      //text(String.fromCodePoint(random(1) < .5 ? 0x1D11E : 0x1D122), -15, -45);
      // PC-8001（TN8001）さん方式で置き換えた
      pg.text(new String(Character.toChars(random(1) < .5 ? 0x1D11E : 0x1D122)), -15, -45);
      pg.pop();

      //  Objects
      for (float r = this.index + PI / 3.0f; r < TAU + this.index - PI / 8.0f; r += PI / 8.0f) {
        pg.push();
        pg.rotate(r + PI / 2.0f - this.c * .01);

        switch(int(random(5)))
        {
          //  Note
        case 0:
        case 1:
        case 2:
          var base = int(random(4));
          for (var i = 0; i < random(2); i++) {
            //text(String.fromCodePoint(0x1D15E + int(random(3))), -15, -25 - base * 7 - i * 14);
            // PC-8001（TN8001）さん方式で置き換えた
            pg.text(new String(Character.toChars(0x1D15E + int(random(3)))), -15, -25 - base * 7 - i * 14);

            //  Accidental
            if (random(1)<.1) {
              pg.push();
              pg.textSize(30);
              //text(String.fromCodePoint(random(1) < .5 ? 0x266F : 0x266D), -35, -25 - base * 7 - i * 14);
              // PC-8001（TN8001）さん方式で置き換えた
              pg.text(new String(Character.toChars(random(1) < .5 ? 0x266F : 0x266D)), -35, -25 - base * 7 - i * 14);
              pg.pop();
            }
          }
          break;
        case 3:  //  Rest
          //text(String.fromCodePoint(0x1D13D + int(random(3))), -15, -36);
          // PC-8001（TN8001）さん方式で置き換えた
          pg.text(new String(Character.toChars(0x1D13D + int(random(3)))), -15, -36);
          break;
        case 4:  //  Space
          break;
        }
        pg.pop();
      }
      pg.pop();
    }

    boolean live() {
      return this.c < this.f;
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
