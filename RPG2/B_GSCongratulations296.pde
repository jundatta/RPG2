// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】Claraさん
// 【作品名】party at the end of the universe
// https://openprocessing.org/sketch/1284920
//

class GameSceneCongratulations296 extends GameSceneCongratulationsBase {
  // By Clara Bower
  // https://twitter.com/clarabellum

  // Made for @sableRaph's weekly creative challenge on Twitch (#WCCChallenge)
  // https://www.twitch.tv/sableraph

  // This week: Void

  float ringSize;
  color mainColor;
  color accentColor;
  color streakColor;
  color[] colors = { // manually set to some colors i thought fit the vibe
    #ff3311,
    #1166ff,
    #6633ff,
    #ee6611,
    color(50, 205, 209),
    color(120, 5, 205),
    color(211, 73, 39),
    color(254, 232, 20)
  };

  float rings = 100;
  final float minShift = -100;
  final float maxShift = 100;

  float t; // sin time
  float s; // cosine time
  float aRandomNumber; // for seeds
  PMatrix2D aMatrix; // for weirdness

  float startAngle = 0;

  float shearAmount;

  // despite what it sounds like, this is NOT for cross-browser support!
  // https://twitter.com/clarabellum/status/1442906188576804865
  final boolean forceIE = false;

  @Override void setup() {
    reset();
    blendMode(ADD);
    strokeCap(SQUARE);
  }

  void reset() {
    // seeds and arbitrary stuff
    aRandomNumber = random(1000);
    aMatrix = getMatrix(0.01);
    aMatrix.m00 = 1.0f;
    aMatrix.m01 = 0.0f;
    aMatrix.m02 = 0.0f;
    aMatrix.m10 = 0.0f;
    aMatrix.m11 = 1.0f;
    aMatrix.m12 = 0.0f;

    // stuff about shapes
    rings = random(50, 150);
    ringSize = relSize(random(250, 600));
    startAngle = random(PI*2);

    shearAmount = random(-0.1, 0.1) * PI;

    // stuff about colors
    mainColor = P5JS.random(colors);
    streakColor = P5JS.random(colors);

    accentColor = mainColor;
    while (mainColor == accentColor) {
      accentColor = P5JS.random(colors);
    }

    if (forceIE) {
      mainColor = colors[1];
      accentColor = colors[4];
      streakColor = colors[7];
      shearAmount = -Math.abs(shearAmount);
    }
  }

  void drawRing(float i) {
    ring(i, t, aMatrix, aRandomNumber, rings, ringSize, colors, mainColor);
  }
  void drawFadedArc(float i) {
    fadeRing(i, s, rings, ringSize, colors, mainColor);
  }
  void drawFlecks(float i) {
    flecks(i, t, ringSize, startAngle, accentColor, colors);
  }
  void drawLines(float i) {
    gridLines(i, s, ringSize, startAngle, accentColor);
  }
  void drawStreaks(float i) {
    streaks(i, t, rings, ringSize, streakColor, colors);
  }

  @Override void draw() {
    push();
    clear();
    background(0);
    t = sin(frameCount/80.0f);
    s = cos(frameCount/60.0f);

    // setting the randomSeed to the same arbitrary number every draw
    // is what keeps the randomized elements in the same places
    // without having to save their location
    // you just have to make sure you call random() the same number of times
    randomSeed((long)aRandomNumber);

    shearX(shearAmount);
    translate(width * (-shearAmount/2.0f), 0); // wild that this works

    for (float index = 0; index < rings; index++) {
      push();
      translate(
        map(noise(index/rings, 1), 0, 1, relSize(minShift), relSize(maxShift)),
        map(noise(1, index/rings), 0, 1, relSize(minShift), relSize(maxShift))
        ); // jiggle the canvas around

      drawRing(index);
      drawFadedArc(index);
      drawFadedArc(index+0.5);

      drawFlecks(index);
      drawFlecks(index + 0.5);
      pop();
    }

    // these I don't want jiggled
    // i want them twisted slightly in a consistent way.
    // hence, ...aMatrix.
    //applyMatrix(aMatrix);

    // btw, i think in openProcessing you can just say applyMatrix(aMatrix)
    // but in my env you need to spread the matrix because webpack is stricter I guess

    for (float index = 0; index < rings; index++) {
      drawStreaks(index);
      drawLines(index);
    }
    pop();

    logoRightLower(#ff0000);
  }
  @Override void mousePressed() {
    if (millis() - lapse > 200) {
      clear();
      noiseSeed((long)random(1000));
      reset();
      redraw();
    }
    lapse = millis();
  }
  // いい感じに輝かせるにゃー
  final float THRESHOLD = 10.0f;

  // this would better be described as highlight arcs
  void ring(float i, float t, PMatrix2D aMatrix,
    float aRandomNumber, float rings, float ringSize, color[] colors, color c) {
    c = random(1) < 0.3 ? P5JS.random(colors) : c;
    // この方が輝いてる感がでたにゃー♪
    float alpha = 4.0f;
    if (i < THRESHOLD) {
      alpha = map(1/rings, 0, 0.2, 0, 40);
    }
    c = color(red(c), green(c), blue(c), alpha);

    stroke(c);
    noFill();

    applyMatrix(aMatrix);
    strokeWeight(map(noise(i/rings, t), 0, 1, relSize(1), relSize(20)));

    float arcStart = noise(5, i/rings) * PI*2;
    float arcEnd = arcStart + noise(aRandomNumber + i)*PI*2;

    if (arcEnd < arcStart) {
      arcEnd += TWO_PI;
    }
    arc(width/2, height/2, ringSize, ringSize, arcStart, arcEnd);
  }

  // the main blurry shape
  void fadeRing(float i, float s, float rings, float ringSize, color[] colors, color c) {
    float arcStart = noise(i, i / rings) * PI * 2;
    float arcEnd = arcStart - random(PI * 0.5);
    c = random(1) < 0.3 ? P5JS.random(colors) : c;
    final float r = map(noise(s+i), 0, 1, ringSize*0.75, ringSize*1.25);

    // この方が輝いてる感がでたにゃー♪
    float alpha = 4.0f;
    if (i < THRESHOLD) {
      alpha = 100/rings;
    }
    c = color(red(c), green(c), blue(c), alpha);

    stroke(c);
    strokeWeight(map(noise(i), 0, 1, relSize(1), relSize(200)));
    if (arcEnd < arcStart) {
      arcEnd += TWO_PI;
    }
    arc(width / 2, height / 2, r, r, arcStart, arcEnd);
  }

  // look, i know glitter lost, but, glitter
  void flecks(float i, float t, float ringSize, float startAngle, color c, color[] colors) {
    final PVector v = new PVector(0, ringSize/2);
    // why didn't anyone tell me circle math is so much easier with vectors
    v.rotate((noise(i/5.0f) * 3*PI)+ startAngle);
    v.setMag(P5JS.randomGaussian(ringSize/2, ringSize/10.0f));
    v.add(width/2, height/2);

    c = random(1) > 0.3 ? c : P5JS.random(colors);
    c = color(red(c), green(c), blue(c), 255 - (noise(i/5.0f + 1) * 255));

    fill(c);
    noStroke();
    final float r = map(noise(i/5.0f + 0.1), 0, 1, relSize(0.5), relSize(25));

    push();
    rectMode(CENTER);
    translate(v.x, v.y);
    rotate(PI/4.0f);

    if (noise(i*5, t*5) > 0.2) {
      ellipse(0, 0, r, r);
    }

    if (noise(i*5, t*5) > 0.65) {
      rect(0, 0, r*0.6, r*0.6);
    }
    pop();
  }

  // the "ridges" so to speak
  void streaks(float i, float t, float rings, float ringSize, color c, color[] colors) {
    final float streakOffset = 40;
    push();
    final float ringIndex = floor(i/25.0f);
    final float offsetX = map(noise(ringIndex), 0, 1, -relSize(streakOffset), relSize(streakOffset));
    final float offsetY = map(noise(1000 + ringIndex), 0, 1, -relSize(streakOffset), relSize(streakOffset));
    translate(offsetX, offsetY);
    c = random(1) < 0.1 ? P5JS.random(colors) : c;
    c = color(red(c), green(c), blue(c), 100);
    stroke(c);
    strokeWeight(map(noise(i/rings), 0, 1, relSize(1), relSize(4)));
    noFill();

    float arcStart = (noise(5, ringIndex)+ P5JS.fract(t / ringIndex)/3.0f) * PI*2;
    float arcEnd = arcStart + (PI * 2 * noise(20, ringIndex));

    final float rs = ringSize * (noise(ringIndex) + 0.5);

    if (arcEnd < arcStart) {
      arcEnd += TWO_PI;
    }
    arc(width/2, height/2, P5JS.randomGaussian(rs, relSize(15)), P5JS.randomGaussian(rs, relSize(15)), arcStart, arcEnd);
    pop();
  }


  // the "grid lines" so to speak
  void gridLines(float i, float s, float ringSize, float startAngle, color c) {
    final PVector v = new PVector(0, ringSize/2.0f);
    v.rotate((P5JS.fract(i/130.0f) * 2*PI) + floor(startAngle * s/3.0f));
    v.setMag(map(noise(floor(i/12.0f), s), 0, 1, ringSize/10.0f, ringSize*0.85));

    final PVector v2 = v.copy();
    v2.mult(random(1) > 0.1 ? 0.8 : 1.2);

    v.add(width/2, height/2);
    v2.add(width/2, height/2);

    c = color(red(c), green(c), blue(c), 255 - (noise(i/5.0f + 1) * 255));

    noFill();
    stroke(c);
    final float w = map(noise(i/5.0f + 0.1), 0, 1, relSize(0.5), relSize(5));
    strokeWeight(w);
    line(v.x, v.y, v2.x, v2.y);
  }
  
  // "hey clara what are all these funcitons you're not using?"
  //
  // well
  // funny story
  //
  // i usually write these in a webpacked environment
  // and then copy them over to OpenProcessing.
  // so i have a list of utils i just like to have on hand, in one file
  // i don't use all of them in every project
  // but sorting through which ones i use and which ones I don't is a pain
  // so I just dump the whole file in here because i'm lazy

  boolean isPaused = false;
  int lapse = 0;
  int frameStandard = 300;

  PMatrix2D getMatrix(float matrixVariation) {
    return new PMatrix2D( // a very slightly messed up identity matrix
      1 + random(-matrixVariation, matrixVariation),
      random(-matrixVariation, matrixVariation),
      random(-matrixVariation, matrixVariation),
      1 + random(-matrixVariation, matrixVariation),
      random(-matrixVariation, matrixVariation),
      random(-matrixVariation, matrixVariation)
      );
  }

  float relSize(float pixelsIsh) {
    // this assumes square. my stuff is always square tho
    return width * (pixelsIsh / 1000.0f);
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
