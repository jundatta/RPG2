// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】shiyuugoさん
// 【作品名】color loupe
// https://neort.io/art/bi4gp8c3p9f8qviu3dvg
//

class GameSceneCongratulations288 extends GameSceneCongratulationsBase {
  PShader s;

  @Override void setup() {
    noStroke();
    s = loadShader("data/288/neort.glsl");
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
