// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】Roni Kaufmanさん
// 【作品名】Strange Vibrations
// https://openprocessing.org/sketch/1051702
//

class GameSceneCongratulations294 extends GameSceneCongratulationsBase {
  // By Roni Kaufman
  // https://ronikaufman.github.io/
  // inspired by https://twitter.com/beesandbombs/status/1343221449218285570?s=09

  class Point {
    float r, theta;
    Point(float r, float theta) {
      this.r = r;
      this.theta = theta;
    }
  }
  ArrayList<Point> points = new ArrayList();

  @Override void setup() {
    noStroke();

    for (float r = 12; r < 200; r += 12) {
      for (float i = 0; i < r/2; i++) {
        float theta = map(i, 0, r/2, 0, TWO_PI);
        points.add(new Point(r, theta));
      }
    }
  }
  @Override void draw() {
    push();
    float f = frameCount/25.0f;
    blendMode(BLEND);
    background(0);
    blendMode(ADD);
    translate(width/2, height/2);
    rotate(PI/2);
    for (Point p : points) {
      float disp = map(p.r, 100, 192, 70, 0);
      if (p.r < 100) {
        disp = map(p.r, 12, 100, 0, 70);
      }
      float cost = cos(p.theta);
      float sint = sin(p.theta);
      float t = f + p.r/70.0f;

      fill(255, 0, 0);
      float val = cos(t)/2+0.5;
      float r = p.r + val*disp;
      circle(r*cost, r*sint, 5);
      fill(0, 255, 0);
      val = cos(t + 0.05)/2+0.5;
      r = p.r + val*disp;
      circle(r*cost, r*sint, 5);
      fill(0, 0, 255);
      val = cos(t + 0.1)/2+0.5;
      r = p.r + val*disp;
      circle(r*cost, r*sint, 5);
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
