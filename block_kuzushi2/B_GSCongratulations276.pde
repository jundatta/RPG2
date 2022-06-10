// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】KomaTebeさん
// 【作品名】Shark 3D（Shark test）
// https://openprocessing.org/sketch/1427621
//

class GameSceneCongratulations276 extends GameSceneCongratulationsBase {
  PShape shark1, shark2;
  PGraphics pg;
  float C = 0;

  void preload() {
    shark1 = loadShape("data/276/Shark_LP.obj");
    shark2 = loadShape("data/276/Shark_LP.obj");
    pg = createGraphics(120, 120);
    shark2.setTexture(pg);
  }

  @Override void setup() {
    preload();
    hint(DISABLE_DEPTH_TEST);
  }
  @Override void draw() {
    push();
    translate(width/2, height/2);
    scale(50);

    background(0);
    rotateX(PI);
    rotateY(PI/2 + frameCount * 0.01);
    for (var i=20; i > 1; i -= 1) {
      push();
      scale(i * 1.4);
      colorMode(HSB, 20);
      //emissive(12, 10, (20-i) * 0.5);
      color hsb = color(12, 10, (20-i) * 0.5);
      shark1.setFill(hsb);
      shape(shark1);
      //    glContext.clear(glContext.DEPTH_BUFFER_BIT);
      pop();
    }

    push();
    colorMode(RGB);
    //emissive(255);
    color rgb = color(255);
    shark1.setFill(rgb);
    scale(2); //scale(2.08);
    noFill();
    //stroke(255);
    strokeWeight(5);
    shape(shark1);
    //  glContext.clear(glContext.DEPTH_BUFFER_BIT);
    pop();

    // だいぶオリジナルからかけ離れてしまいましたにゃ＼(^_^)／
    lights();
    ambientLight(255, 255, 255);
    ambientLight(255, 255, 255);
    scale(4);
    //  normalMaterial(); // For effect
    pg.beginDraw();
    pg.background(255);
    pg.noStroke();
    C += 0.0005;
    float size = pg.width / 30;
    for (int y = 0; y < 30; y++) {
      for (int x = 0; x < 30; x++) {
        int n = int(noise(mag(x, y) / width, C) * pow(2, 24));
        pg.fill(red(n), green(n), blue(n));
        pg.rect(x * size, y * size, size * 10.0 / 12.0, size * 10.0 / 12.0);
      }
    }
    pg.endDraw();
    shape(shark2);
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
