// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】yooyooyさん
// 【作品名】Barnsley Fern
// https://openprocessing.org/sketch/1348846
// https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%BC%E3%83%B3%E3%82%BA%E3%83%AA%E3%83%BC%E3%81%AE%E3%82%B7%E3%83%80
//

class GameSceneCongratulations280 extends GameSceneCongratulationsBase {
  float x = 0;
  float y = 0;

  @Override void setup() {
    background(0);
  }

  //range −2.1820 < x < 2.6558 and 0 ≤ y < 9.9983.
  void drawPoint() {
    stroke(255);
    strokeWeight(1);
    float px = map(x, -2.1820, 2.6558, 0, width);
    float py = map(y, 0, 9.9983, height, 0);
    point(px, py);
  }

  void nextPoint() {
    float nextX;
    float nextY;

    float r = random(1);

    if (r < 0.01) {
      //1
      nextX = 0;
      nextY = 0.16 * y;
    } else if (r < 0.86) {
      //2
      nextX = 0.85 * x + 0.04 * y;
      nextY = -0.04 * x + 0.85 * y + 1.60;
    } else if (r < 0.93) {
      //3
      nextX = 0.20 * x + -0.26 * y;
      nextY = 0.23 * x + 0.22 * y + 1.60;
    } else {
      //4
      nextX = -0.15 * x + 0.28 * y;
      nextY = 0.26 * x + 0.24 * y + 0.44;
    }

    x = nextX;
    y = nextY;
  }

  @Override void draw() {
    for (float i = 0; i < 100; i++) {
      drawPoint();
      nextPoint();
    }
    
    logoRightLower(#ff0000);
  }
  @Override void mousePressed() {
    gGameStack.change(new GameSceneTitle());
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
