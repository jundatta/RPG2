// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】ayametakuyaさん
// 【作品名】無限出口
// https://neort.io/art/c84clgs3p9f3k6tgvq4g
//

class GameSceneCongratulations267 extends GameSceneCongratulationsBase {
  PImage img;
  float size;
  float x_num = 1;
  float y_num = 1;

  void preload() {
    img = loadImage("data/267/c84cksk3p9f3k6tgvq3g.png");
  }

  @Override void setup() {
    preload();
    image(img, 0, 0, width, height);
  }
  @Override void draw() {
    float x_size = width / x_num;
    float y_size = height / y_num;

    for (float i = 0; i < width; i += x_size) {
      for (float j = 0; j < height; j += y_size) {
        image(img, i, j, x_size, y_size);
      }
    }

    if (x_num < 100) {
      x_num += x_num * x_num * 0.002;
    } else {
      x_num = 1;
    }

    if (y_num < 1000) {
      y_num += y_num * y_num * 0.002;
    } else {
      y_num = 1;
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
