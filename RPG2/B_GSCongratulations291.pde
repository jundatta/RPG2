// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】reona396 / レオナさん
// 【作品名】noise circle
// https://neort.io/art/c83roh43p9f3k6tgvn1g
//

class GameSceneCongratulations291 extends GameSceneCongratulationsBase {
  float n = 0;
  float a;
  color c;
  color[] palette = {#A789AA, #DDD4E5, #B7D6F5, #8396CB, #404C70};
  PGraphics pg;
  float s;
  PGraphics pgFrame;
  color bgColor, lineColor;

  @Override void setup() {
    imageMode(CENTER);

    palette = P5JS.shuffle(palette);

    bgColor = palette[0];
    lineColor = palette[1];

    s = min(width, height);
    pg = createGraphics(100, 100);

    pgFrame = createGraphics(100, 100);
    //  pgFrame.background(bgColor);
    //  pgFrame.erase();
    pgFrame.beginDraw();
    pgFrame.background(0);
    pgFrame.noStroke();
    pgFrame.fill(255);
    pgFrame.circle(100 / 2, 100 / 2, 100 * 0.9);
    pgFrame.endDraw();
    //  pgFrame.noErase();

    strokeWeight(12);
    stroke(lineColor);
    noFill();
  }
  @Override void draw() {
    background(bgColor);

    pg.beginDraw();
    pg.background(0);
    //pg.loadPixels();
    for (var i = 0; i < pg.width; i++) {
      for (var j = 0; j < pg.height; j++) {
        n = noise(0.01002503 * i, 0.01003463 * j);
        a = map(n + frameCount * 0.0005, 0, 1, 0, 100);
        c = palette[floor(a % 13) % palette.length];
        pg.set(i, j, color(c));
      }
    }
    //pg.updatePixels();
    pg.endDraw();

    pg.mask(pgFrame);
    image(pg, width / 2, height / 2, s, s);

    //  image(pgFrame, width / 2, height / 2);

    circle(width / 2, height / 2, s * 0.9);
    
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
