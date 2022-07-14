// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】midorigokeさん
// 【作品名】360
// https://openprocessing.org/sketch/947901
//

class GameSceneCongratulations283 extends GameSceneCongratulationsBase {
  float h = -125 + 90, v = 20 - 45;
  PImage tex;
  PShape sphere;

  @Override void setup() {
    tex = loadImage("data/283/360.png");
    sphere = createShape(SPHERE, 1000);
    sphere.setTexture(tex);
    sphere.setStrokeWeight(0);
  }
  @Override void draw() {
    translate(width/2, height/2);
    background(0);
    noStroke();
    //  camera(0, 0, 0, 0, 0, 1, 0, 1, 0);
    final float sc = 3.0f;
    scale(-sc, sc, sc);
    rotateX(radians(v));
    rotateY(radians(h));

    //  texture(tex);
    //sphere(1000);
    shape(sphere);

    if (mousePressed) {
      h -= (mouseX - width / 2) / (float)width;
      v = min(90, max(-90, v + (mouseY - height / 2) / (float)height));
    }
  }
  @Override void mousePressed() {
    //gGameStack.change(new GameSceneTitle());
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
