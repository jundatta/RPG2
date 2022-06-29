// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Rotating number. Draw by openFrameworks
// https://junkiyoshi.com/2022/01/30/
// 【移植】PC-8001(TN8001)さん
// https://gist.github.com/TN8001/2779481c7c3ece358539e0f3511c4b3e
//

class GameSceneCongratulations281 extends GameSceneCongratulationsBase {
  final ArrayList<PVector[][]> words = new ArrayList<>();
  final PVector INSIDE = new PVector(0, 0, -15);
  final PVector OUTSIDE = new PVector(0, 0, 15);

  @Override void setup() {
    var source = new int[]{ 2, 1, 1, 1, 2, 1, 2, 1, 3, 2, };
    for (var n = 0; n < source.length; n++) {
      var outlines = new PVector[source[n]][];
      for (var i = 0; i < outlines.length; i++) {
        outlines[i] = loadOutline("data/281/" + n + "_" + i + ".txt");
      }
      words.add(outlines);
    }
  }
  @Override void draw() {
    push();
    background(0);
    randomSeed(39);
    translate(width/2, height/2);

    for (var baseDeg = 0; baseDeg < 360; baseDeg += 15) {
      for (var y = -120; y <= 180; y += 60) {
        var index = int(map(noise(random(1000), frameCount * 0.01), 0, 1, 0, words.size()));
        for (var vertices : words.get(index)) {
          fill(0);
          stroke(0, 255, 255);
          beginShape(QUAD_STRIP);
          for (var i = 0; i < vertices.length + 1; i++) {
            var baseLocation = new PVector(0, y, 200);
            var noise = noise(y * 0.08, frameCount * 0.01);
            var deg = baseDeg;
            if (noise < 0.45) deg += int(map(noise, 0, 0.45, -360*1.5, 0));
            if (0.55 < noise) deg += int(map(noise, 0.55, 1, 0, 360*1.5));

            var rotation = new PMatrix3D();
            rotation.rotateY(deg * DEG_TO_RAD);
            var location = vertices[i % vertices.length].copy().add(baseLocation);

            var v1 = rotation.mult(PVector.add(location, INSIDE), null);
            vertex(v1.x, v1.y, v1.z);

            var v2 = rotation.mult(PVector.add(location, OUTSIDE), null);
            vertex(v2.x, v2.y, v2.z);
          }
          endShape();
        }
      }
    }
    pop();

    logoRightLower(#ff0000);
  }

  PVector[] loadOutline(String path) {
    var lines = loadStrings(path);
    var v = new PVector[lines.length];
    for (var i = 0; i < v.length; i++) {
      var units = splitTokens(lines[i], ", ");
      v[i] = new PVector(float(units[0]), float(units[1]));
    }
    return v;
  }
  
  @Override void mousePressed() {
    gGameStack.change(new GameSceneTitle());
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
