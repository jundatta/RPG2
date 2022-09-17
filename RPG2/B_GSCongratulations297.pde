// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】ryotakoさん
// 【作品名】磁気コアメモリ
// https://neort.io/art/c8dcs843p9fffhugumv0
//

class GameSceneCongratulations297 extends GameSceneCongratulationsBase {
  PShader s;

  @Override void setup() {
    noStroke();
    s = loadShader("data/297/neort.frag");
    s.set("resolution", width, height);
  }
  @Override void draw() {
    push();
    shader(s);
    rect(0, 0, width, height);
    resetShader();
    pop();

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
