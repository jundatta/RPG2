// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】aodnawgさん
// 【作品名】海 反射
// https://neort.io/art/bpr34343p9fefb9240sg
//

class GameSceneCongratulations287 extends GameSceneCongratulationsBase {
  PShader s;

  @Override void setup() {
    noStroke();
    s = loadShader("data/287/neort.glsl");
    s.set("resolution", width, height);
  }
  @Override void draw() {
    s.set("time", millis() / 1000.0f);
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
