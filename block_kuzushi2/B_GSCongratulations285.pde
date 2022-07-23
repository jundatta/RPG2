// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】Arnold Cheung
// 【作品名】Ethereal
// https://openprocessing.org/sketch/1180918
//

class GameSceneCongratulations285 extends GameSceneCongratulationsBase {
  final float sphere_radius = 200;
  final float num_rings = 10;
  final float delta_angle = 180 / num_rings;
  final float gap = 2.5;

  ArrayList<line_ring> line_rings = new ArrayList();

  @Override void setup() {
    //  angleMode(DEGREES);
    background(0);

    for (float n=-90 + delta_angle; n<= 90 - 2 * delta_angle; n+=delta_angle) {
      float angle1 = n + gap;
      float angle2 = n + delta_angle - gap;

      float min_n_lines = 5;
      float max_n_lines = 60;

      float inc_t = random(0.1, 1);
      float phase = random(0, 360);
      color c = color(255, 255);

      line_rings.add(new line_ring(angle1, angle2, min_n_lines, max_n_lines, inc_t, phase, c));
    }
    sphereDetail(6, 4);
  }
  @Override void draw() {
    push();
    translate(width/2, height/2);

    background(0);
    //  orbitControl(3, 3, 0.01);

    push();
    stroke(255, 255, 255);
    strokeWeight(2);
    noFill();
    rotateX(radians(0.2 * frameCount));
    rotateY(radians(1 * frameCount));
    rotateZ(radians(0.3 * frameCount));
    //  sphere(80, 6, 4);
    sphere(80);
    pop();

    push();
    rotateX(radians(- 0.1 * frameCount));
    rotateY(radians(- 0.4 * frameCount));
    rotateZ(radians(0.15 * frameCount));
    for (var ring : line_rings) {
      ring.draw();
    }
    pop();
    pop();

    logoRightLower(#ff0000);
  }

  class line_ring {
    float angle1, angle2;
    float min_n_lines, max_n_lines;
    float inc_t;
    float phase;
    color c;
    line_ring(float angle1, float angle2,
      float min_n_lines, float max_n_lines, float inc_t, float phase, color c) {
      this.angle1 = angle1;
      this.angle2 = angle2;
      this.min_n_lines = min_n_lines;
      this.max_n_lines = max_n_lines;
      this.inc_t = inc_t;
      this.phase = phase;
      this.c = c;
    }

    void draw() {
      var n_lines = map(sin(radians(0.2 * this.inc_t * frameCount + this.phase)), -1, 1, this.min_n_lines, this.max_n_lines);
      var a_inc = 360 / n_lines;

      for (var a=0; a<360; a+= a_inc) {
        var y1 = sphere_radius * sin(radians(this.angle1));
        var y2 = sphere_radius * sin(radians(this.angle2));

        var factor = map(sin(radians(frameCount + this.angle1 * 2.5)), -1, 1, 0.5, 1.5);

        var radius1 = sphere_radius * cos(radians(this.angle1)) * factor;
        var radius2 = sphere_radius * cos(radians(this.angle2)) * factor;

        var x1 = radius1 * cos(radians(a));
        var x2 = radius2 * cos(radians(a));

        var z1 = radius1 * sin(radians(a));
        var z2 = radius2 * sin(radians(a));

        push();
        rotateY(radians(map(noise(0.002 * (frameCount) + this.phase), 0.3, 0.7, -180, 180)));
        stroke(this.c);
        strokeWeight(a%8);
        noFill();
        line(x1, y1, z1, x2, y2, z2);
        pop();
      }
    }
  }

  @Override void mousePressed() {
    gGameStack.change(new GameSceneTitle());
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
