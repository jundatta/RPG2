// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】yooyooyさん
// 【作品名】Fibonacci number
// https://openprocessing.org/sketch/1316075
//

class GameSceneCongratulations282 extends GameSceneCongratulationsBase {
  @Override void setup() {
    noStroke();
    colorMode(RGB, 1);
  }
  float cosn(float v) {
    return cos(v * TWO_PI) * 0.5 + 0.5;
  }
  float invCosn(float v) {
    return 1.0f - cosn(v);
  }

  final float radius =  sqrt(0.5); //最も遠いobjの距離（バランスいい）
  final float dotSize = 0.04;
  final float PHI = (1 + sqrt(5.0f)) / 2; //黄金比

  final float frames = 1000.0f;
  float t;

  @Override void draw() {
    push();
    scale(width, height);
    t = P5JS.fract(frameCount / frames); //fractは少数部分
    background(0);

    final float count = 2000;  //（ほぼ）画面内のobj数，upgrade対象
    for (float i=1; i< count; i++) {
      final float f = i / count;
      final float theta = i * PHI * TWO_PI;
      final float dist = f * radius;

      final float x = 0.5 + cos(theta - t) * dist;
      final float y = 0.5 + sin(theta - t) * dist;

      final float sig = pow(cosn(f - t * 6), 2); //sizeの波
      final float r =  f * sig * dotSize;

      final float hue = cosn(f - t * 1.3) / 2.0f;
      final float sat = 0.3;
      final float light = 0.6 * sig + 0.25;
      fill(hue, sat, light);

      circle(x, y, r);
    }
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
