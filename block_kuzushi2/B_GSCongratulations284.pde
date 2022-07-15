// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】kaiware styleさん
// 【作品名】Anti Mosquito Spiral 3D
// https://neort.io/art/bl6seic3p9fafudebpe0
//

class GameSceneCongratulations284 extends GameSceneCongratulationsBase {
  PShader s;
  int startMSec;
  final int AFTER_MSEC = 120*1000;  // 2分先

  @Override void setup() {
    noStroke();
    noStroke();
    s = loadShader("data/284/neort.frag");
    s.set("resolution", width, height);
    startMSec = millis();
  }
  @Override void draw() {
    s.set("time", (millis() + AFTER_MSEC - startMSec) / 1000.0f);
    shader(s);
    rect(0, 0, width, height);
    resetShader();

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
