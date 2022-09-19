// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】BUNさん
// 【作品名】sketch_190916b
// https://openprocessing.org/sketch/754126
//

class GameSceneCongratulations298 extends GameSceneCongratulationsBase {
  /*
setup=_=>{c=createGraphics;w=image;createCanvas(S=500,S);H=S/2;g=c(S,S,WEBGL);g.noStroke();t=0}
   draw=_=>{background(0);b(M=255,100,250);m=c(S,S);m.beginShape();i=200;while(i){m.vertex(cos(j=noise(t+i)*TAU*2)*S+H,sin(j)*S+H);--i}m.endShape();s=g.get();s.mask(m);b(150,200,M);w(g,0,0);w(s,0,0);g.rotate(.005,createVector(1,1,.5));t+=.0002}
   b=(j,k,l)=>{g.clear();g.ambientLight(0,10,50);g.pointLight(M,M,200,0,0,H*0.64);g.ambientMaterial(M,j,k,l);g.box(H*0.8)}
  /**/

  float S, H, D, R;
  PGraphics g, s, m;
  PVector v;
  float t;

  @Override void setup() {
    S = width;
    H=S/2.0f;
    D=200;
    R=H*0.8;

    g = createGraphics((int)width, (int)height, P3D);
    s = createGraphics((int)width, (int)height, P3D);

    m = createGraphics((int)width, (int)height, P2D);

    v = new PVector(1, 1, 0.5);
    t = 0;
  }
  @Override void draw() {
    push();
    background(0);

    //setBox(g, 213, 154, 255);
    setBox(g, 220, 160, 255);
    image(g, 0, 0);

    m.beginDraw();
    m.background(0);
    m.noStroke();
    m.beginShape();
    for (float i=0; i<D; ++i) {
      m.vertex(cos(noise(t+i)*TAU*2)*S+H, sin(noise(t+i)*TAU*2)*S+H);
    }
    m.endShape();
    m.endDraw();

    setBox(s, 230, 250, 170);
    s.mask(m);

    image(s, 0, 0);

    //  g.rotate(0.005, v);
    t+=0.0002;
    pop();

    logoRightLower(#ff0000);
  }
  void setBox(PGraphics pg, float j, float k, float l) {
    pg.beginDraw();
    pg.background(0);
    pg.translate(width/2, height/2);
    pg.lightSpecular(255, 255, 255);
    pg.pointLight(255, 255, 200, 0, 0, R);
    pg.rotateY(t*25.0f);
    pg.rotateX(t*25.0f);
    pg.rotateZ(t*25.0f);
    pg.noStroke();
    pg.fill(j, k, l);
    pg.box(R);
    pg.endDraw();
  }
  @Override void mousePressed() {
    gGameStack.change(new GameSceneTitle());
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
