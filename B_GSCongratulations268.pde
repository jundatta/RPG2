// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】Richard Bourne
// 【作品名】Quadcopter
// https://openprocessing.org/sketch/1369981
//

class GameSceneCongratulations268 extends GameSceneCongratulationsBase {
  PShape cylinder5_10;
  PShape cylinder30_30;
  PShape cylinder4_45;
  PShape cone15_60;
  PShape cylinder5_60;
  PShape torus160_10;

  @Override void setup() {
    background(100);
    noStroke();

    cylinder5_10 = createCan(5, 10, 24, true, true);
    cylinder5_10.setFill(#ff0000);
    cylinder30_30 = createCan(30, 30, 24, true, true);
    cylinder4_45 = createCan(4, 45, 24, true, true);
    cone15_60 = createCone(15, 60);
    cylinder5_60 = createCan(5, 60, 24, true, true);
    torus160_10 = createTorus(160, 10, 24, 24);
  }
  @Override void draw() {
    push();
    translate(width/2, height/2);
    background(180, 220, 255);
    lights();
    push();                    // ground
    fill(50, 200, 50);
    translate(0, 200, 0);
    rotateX(PI/2.0f);
    //  plane(width*2.4, height*2);
    box(width*2.4, height*2, 1);
    pop();
    //  orbitControl();
    translate(0, -100, -50);
    rotateY(frameCount/100.0f);

    rotateX(PI/2.5);
    //  ellipsoid(130, 130, 50);
    push();
    scale(1.0f, 1.0f, 50.0f/130.0f);
    sphere(130);
    pop();
    push();                   // drone camera
    translate(-140, 0, -20);
    //  specularMaterial(0);
    fill(255, 0, 0);
    box(20);
    translate(20, 0, 0);
    box(40, 24, 4);
    translate(-30, 0, 0);
    rotateX(PI/2.0f);
    rotateZ(PI/2.0f);
    //  cylinder(5, 10);
    shape(cylinder5_10);
    pop();
    push();
    translate(0, 0, -20);
    push();
    rotate(PI/4.0f);
    box(600, 20, 10);
    rotate(PI/2.0f);
    box(600, 20, 10);
    pop();
    push();
    translate(-215, -215, -10);
    rotateX(PI/2.0f);
    //  cylinder(30, 30);
    shape(cylinder30_30);
    //  cylinder(4, 45);
    shape(cylinder4_45);
    translate(0, -40, 0);
    rotateX(PI);
    //  cone(15, 60);
    shape(cone15_60);
    //  cylinder(5, 60);
    shape(cylinder5_60);
    pop();
    pop();
    translate(-200, -200);
    push();
    fill(255, 20);
    noStroke();
    //  ellipsoid(140, 140, 3);
    push();
    scale(1.0f, 1.0f, 3.0f/140.0f);
    sphere(140);
    pop();
    pop();
    //  torus(160, 10);
    shape(torus160_10);
    translate(0, 400);
    push();
    translate(0, 0, -30);
    rotateX(PI/2);
    //  cylinder(30, 30);
    shape(cylinder30_30);
    //  cylinder(4, 45);
    shape(cylinder4_45);
    translate(0, -40, 0);
    rotateX(PI);
    //  cone(15, 60);
    shape(cone15_60);
    //  cylinder(5, 60);
    shape(cylinder5_60);
    pop();
    push();
    fill(255, 20);
    noStroke();
    //  ellipsoid(140, 140, 3);
    push();
    scale(1.0f, 1.0f, 3.0f/140.0f);
    sphere(140);
    pop();
    pop();
    //  torus(160, 10);
    shape(torus160_10);
    translate(400, 0);
    push();
    translate(10, 10, -30);
    rotateX(PI/2);
    //  cylinder(30, 30);
    shape(cylinder30_30);
    //  cylinder(4, 45);
    shape(cylinder4_45);
    translate(0, -40, 0);
    rotateX(PI);
    //  cone(15, 60);
    shape(cone15_60);
    //  cylinder(5, 60);
    shape(cylinder5_60);
    pop();
    push();
    fill(255, 30);
    noStroke();
    //  ellipsoid(140, 140, 3);
    push();
    scale(1.0f, 1.0f, 3.0f/140.0f);
    sphere(140);
    pop();
    pop();
    //  torus(160, 10);
    shape(torus160_10);
    translate(0, -400);
    push();
    translate(0, 0, -30);
    rotateX(PI/2);
    //  cylinder(30, 30);
    shape(cylinder30_30);
    //  cylinder(4, 45);
    shape(cylinder4_45);
    translate(0, -40, 0);
    rotateX(PI);
    //  cone(15, 60);
    shape(cone15_60);
    //  cylinder(5, 60);
    shape(cylinder5_60);
    pop();
    push();
    fill(255, 30);
    noStroke();
    //  ellipsoid(140, 140, 3);
    push();
    scale(1.0f, 1.0f, 3.0f/140.0f);
    sphere(140);
    pop();
    pop();
    //  torus(160, 10);
    shape(torus160_10);
    pop();
    
    logoRightUpper(#ff0000);
  }
  @Override void mousePressed() {
    gGameStack.change(new GameSceneTitle());
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
