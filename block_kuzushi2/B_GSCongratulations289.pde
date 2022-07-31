// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】Kohei Nakadaさん
// 【作品名】Color Pallet Gallery
// https://neort.io/art/bkocti43p9f7drq1jj3g
//

class GameSceneCongratulations289 extends GameSceneCongratulationsBase {
  PShader s;

  @Override void setup() {
    noStroke();
    s = loadShader("data/289/neort.glsl");
    s.set("resolution", width, height);
  }
  @Override void draw() {
    s.set("time", millis() / 1000.0f);
    shader(s);
    rect(0, 0, width, height);
    resetShader();

    logoRightLower(#ff0000);
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
