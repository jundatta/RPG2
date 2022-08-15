// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】KomaTebeさん
// 【作品名】ArchiSketch
// https://openprocessing.org/sketch/1251077
//

class GameSceneCongratulations292 extends GameSceneCongratulationsBase {
  class Models {
    ArrayList<Floor> floor;
    ArrayList<Trees> trees;
    ArrayList<Base> base;
    ArrayList<Door> door;
    ArrayList<Win> win;
    ArrayList<Roof> roof;
    ArrayList<Roofaddon> roofaddon;
    ArrayList<Top> top;
  }
  Models models = new Models();

  class Arch {
    int floor;
    int trees;
    int base;
    int door;
    int win;
    int roof;
    int roofaddon;
    int top;
  }
  Arch arch;

  ArrayList<IntList> materials;
  color bgCol = color(234, 219, 200);
  color strCol = color(0);

  @Override void setup() {
    models.floor = getFloorData();
    models.trees = getTreesData();
    models.base = getBaseData();
    models.door = getBasedoorData();
    models.win = getBasewinsData();
    models.roof = getRoofData();
    models.roofaddon = getRoofaddonData();
    models.top = getTopData();
    materials = getMaterialsData();

    generate();
  }

  void generate() {
    arch = new Arch();

    arch.floor = 0; //Math.floor(Math.random() * models.floor.length);

    arch.trees = 1000;
    if (0 < models.floor.get(arch.floor).next.trees.size()) {
      arch.trees = getNextTrees(models.floor.get(arch.floor).next.trees, models.trees);
    }

    arch.base = (int)Math.floor(Math.random() * models.base.size());

    arch.door = 1000;
    if (0 < models.base.get(arch.base).next.door.size()) {
      arch.door = getNextDoor(models.base.get(arch.base).next.door, models.door);
    }
    arch.win = 1000;
    if (0 < models.base.get(arch.base).next.win.size()) {
      arch.win = getNextWin(models.base.get(arch.base).next.win, models.win);
    }
    arch.roof = 1000;
    if (0 < models.base.get(arch.base).next.roof.size()) {
      arch.roof = getNextRoof(models.base.get(arch.base).next.roof, models.roof);
    }

    arch.roofaddon = 1000;
    if (0 < models.roof.get(arch.roof).next.roofaddon.size()) {
      arch.roofaddon = getNextRoofaddon(models.roof.get(arch.roof).next.roofaddon, models.roofaddon);
    }
    arch.top = 1000;
    if (0 < models.roof.get(arch.roof).next.top.size()) {
      arch.top = getNextTop(models.roof.get(arch.roof).next.top, models.top);
    }
  }

  int getNextTrees(ArrayList<String> pArray, ArrayList<Trees> model) {
    String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
    int myIdx = 1000;
    for (int i = 0; i < model.size(); i += 1) {
      if (model.get(i).id.equals(myName)) {
        myIdx = i;
        break;
      }
    }
    return myIdx;
  }
  int getNextDoor(ArrayList<String> pArray, ArrayList<Door> model) {
    String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
    int myIdx = 1000;
    for (int i = 0; i < model.size(); i += 1) {
      if (model.get(i).id.equals(myName)) {
        myIdx = i;
        break;
      }
    }
    return myIdx;
  }
  int getNextWin(ArrayList<String> pArray, ArrayList<Win> model) {
    String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
    int myIdx = 1000;
    for (int i = 0; i < model.size(); i += 1) {
      if (model.get(i).id.equals(myName)) {
        myIdx = i;
        break;
      }
    }
    return myIdx;
  }
  int getNextRoof(ArrayList<String> pArray, ArrayList<Roof> model) {
    String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
    int myIdx = 1000;
    for (int i = 0; i < model.size(); i += 1) {
      if (model.get(i).id.equals(myName)) {
        myIdx = i;
        break;
      }
    }
    return myIdx;
  }
  int getNextRoofaddon(ArrayList<String> pArray, ArrayList<Roofaddon> model) {
    String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
    int myIdx = 1000;
    for (int i = 0; i < model.size(); i += 1) {
      if (model.get(i).id.equals(myName)) {
        myIdx = i;
        break;
      }
    }
    return myIdx;
  }
  int getNextTop(ArrayList<String> pArray, ArrayList<Top> model) {
    String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
    int myIdx = 1000;
    for (int i = 0; i < model.size(); i += 1) {
      if (model.get(i).id.equals(myName)) {
        myIdx = i;
        break;
      }
    }
    return myIdx;
  }

  @Override void draw() {
    push();
    //translate(width/2, height/2);

    //rotateX(-PI/6.0f);
    //rotateY(PI/6.0f);
    
    camera(-500, -500, 1000, 0, 0, 0, 0, 1, 0);

    background(bgCol);
    //orbitControl(3, 2, 0);
    if (arch.floor < 1000) drawShape(models.floor.get(arch.floor).data);
    if (arch.trees < 1000) drawShape(models.trees.get(arch.trees).data);
    if (arch.base < 1000) drawShape(models.base.get(arch.base).data);
    if (arch.door < 1000) drawShape(models.door.get(arch.door).data);
    if (arch.win < 1000) drawShape(models.win.get(arch.win).data);
    if (arch.roof < 1000) drawShape(models.roof.get(arch.roof).data);
    if (arch.roofaddon < 1000) drawShape(models.roofaddon.get(arch.roofaddon).data);
    if (arch.top < 1000) drawShape(models.top.get(arch.top).data);
    pop();
    logoRightLower(#ff0000);
  }

  void drawShape(ArrayList<Data> pShape) {
    float m = 70;
    noStroke();
    for (int i = 0; i < pShape.size(); i += 1) {
      beginShape();
      for (int j = 0; j < pShape.get(i).vertices.size(); j += 1) {
        color myMat = materials.get(0).get(pShape.get(i).mat);
        fill(myMat);
        if (pShape.get(i).mat == 0) noFill();
        PVector v = pShape.get(i).vertices.get(j);
        vertex(v.x * m, v.y * m, v.z * m);
      }
      endShape();
    }

    for (int i = 0; i < pShape.size(); i += 1) {
      Data data = pShape.get(i);
      data.vertices.add(data.vertices.get(0));
      for (int j = 0; j < data.vertices.size() - 1; j += 1) {
        push();
        strokeWeight(3);
        stroke(strCol);
        PVector vj0 = data.vertices.get(j);
        PVector p1 = new PVector(vj0.x * m, vj0.y * m, vj0.z * m);
        PVector vj1 = data.vertices.get(j+1);
        PVector p2 = new PVector(vj1.x * m, vj1.y * m, vj1.z * m);
        PVector p3 = PVector.sub(p2, p1);
        float rnd = 0.15;
        rnd = random(1) * 0.15;
        PVector prnd1 = new PVector(random(1) * 2 - 1, random(1) * 2 - 1, random(1) * 2 - 1);
        PVector prnd2 = new PVector(random(1) * 2 - 1, random(1) * 2 - 1, random(1) * 2 - 1);

        p1.add(prnd1);
        p2.add(prnd2);
        p3.mult(rnd);
        p2.add(p3);
        p1.sub(p3);

        line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
        pop();
      }
      data.vertices.remove(0);
    }
  }
  @Override void mousePressed() {
    generate();
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }

  ArrayList<IntList> getMaterialsData() {
    ArrayList<IntList> cc = new ArrayList();

    IntList c;

    c = new IntList();
    c.append(color(255, 255, 255, 0));
    c.append(color(255, 255, 255, 255));
    c.append(color(255, 245, 233, 255));
    c.append(color(211, 195, 174, 255));
    c.append(color(248, 235, 216, 255));
    c.append(color(211, 195, 174, 255));
    cc.add(c);

    c = new IntList();
    c.append(color(255, 255, 255, 0));
    c.append(color(255, 255, 255, 255));
    c.append(color(255, 255, 255, 255));
    c.append(color(255, 255, 255, 255));
    c.append(color(255, 255, 255, 255));
    c.append(color(255, 255, 255, 255));
    cc.add(c);

    c = new IntList();
    c.append(color(234, 219, 200, 0));
    c.append(color(234, 219, 200, 255));
    c.append(color(234, 219, 200, 255));
    c.append(color(234, 219, 200, 255));
    c.append(color(234, 219, 200, 255));
    c.append(color(234, 219, 200, 255));
    cc.add(c);

    c = new IntList();
    c.append(color(255, 255, 255, 0));
    c.append(color(37, 73, 99, 255));
    c.append(color(41, 82, 112, 255));
    c.append(color(47, 93, 127, 255));
    c.append(color(54, 107, 145, 255));
    c.append(color(63, 126, 171, 255));
    cc.add(c);

    return cc;
  }

  class BaseNext {
    ArrayList<String> door;
    ArrayList<String> win;
    ArrayList<String> roof;
    BaseNext(ArrayList<String> door, ArrayList<String> win, ArrayList<String> roof) {
      this.door = door;
      this.win = win;
      this.roof = roof;
    }
  }

  class Base {
    String id;
    BaseNext next;
    ArrayList<Data> data;
    Base(String id, BaseNext next, ArrayList<Data> data) {
      this.id = id;
      this.next = next;
      this.data = data;
    }
  }

  ArrayList<Base> getBaseData() {
    ArrayList<String> door;
    ArrayList<String> win;
    ArrayList<String> roof;
    ArrayList<Data> dd;
    BaseNext n;
    ArrayList<PVector> v;
    Data d;
    Base base;

    ArrayList<Base> p = new ArrayList();

    door = new ArrayList();
    door.add("basedoor-0");
    door.add("basedoor-1");
    door.add("basedoor-2");
    door.add("basedoor-3");
    door.add("basedoor-4");
    door.add("basedoor-5");
    win = new ArrayList();
    win.add("basewins-0");
    win.add("basewins-1");
    win.add("basewins-2");
    win.add("basewins-3");
    win.add("basewins-4");
    roof = new ArrayList();
    roof.add("roof-0");
    roof.add("roof-1");
    roof.add("roof-2");
    roof.add("roof-3");
    roof.add("roof-4");
    n = new BaseNext(door, win, roof);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.0, -0.0, -2.0));
    v.add(new PVector(-2.0, -0.0, -2.0));
    v.add(new PVector(-2.0, 0.0, 2.0));
    v.add(new PVector(2.0, 0.0, 2.0));
    d = new Data("base-0_Cube.005", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.0, -2.0));
    v.add(new PVector(2.0, -2.0, -2.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    d = new Data("base-0.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, 0.0, 2.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(2.0, -2.0, -2.0));
    v.add(new PVector(2.0, -0.0, -2.0));
    d = new Data("base-0.002_Cube.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -0.0, -2.0));
    v.add(new PVector(2.0, -2.0, -2.0));
    v.add(new PVector(-2.0, -2.0, -2.0));
    v.add(new PVector(-2.0, -0.0, -2.0));
    d = new Data("base-0.003_Cube.003", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, 0.0, 2.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(2.0, 0.0, 2.0));
    d = new Data("base-0.004_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -0.0, -2.0));
    v.add(new PVector(-2.0, -2.0, -2.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    v.add(new PVector(-2.0, 0.0, 2.0));
    d = new Data("base-0.005_Cube.006", 4, v);
    dd.add(d);

    base = new Base("base-0", n, dd);
    p.add(base);


    door = new ArrayList();
    door.add("basedoor-0");
    door.add("basedoor-1");
    door.add("basedoor-2");
    door.add("basedoor-3");
    door.add("basedoor-4");
    door.add("basedoor-5");
    win = new ArrayList();
    win.add("basewins-0");
    win.add("basewins-1");
    win.add("basewins-2");
    win.add("basewins-3");
    win.add("basewins-4");
    roof = new ArrayList();
    roof.add("roof-0");
    roof.add("roof-1");
    roof.add("roof-2");
    roof.add("roof-3");
    n = new BaseNext(door, win, roof);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-1.719448, 0.0, 1.99702));
    v.add(new PVector(-1.719448, -1.719448, 1.99702));
    v.add(new PVector(1.719448, -1.719448, 1.99702));
    v.add(new PVector(1.719448, 0.0, 1.99702));
    d = new Data("base-1_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -0.0, -1.565068));
    v.add(new PVector(2.0, -2.0, -2.044687));
    v.add(new PVector(-2.0, -2.0, -2.044687));
    v.add(new PVector(-2.0, -0.0, -1.565068));
    d = new Data("base-1.001_Cube.002", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -0.0, -1.565068));
    v.add(new PVector(-2.0, -2.0, -2.044687));
    v.add(new PVector(-2.0, -2.0, 2.518059));
    v.add(new PVector(-2.0, 0.0, 2.109744));
    d = new Data("base-1.002_Cube.003", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, 0.0, 2.109744));
    v.add(new PVector(2.0, -2.0, 2.518059));
    v.add(new PVector(2.0, -2.0, -2.044687));
    v.add(new PVector(2.0, -0.0, -1.565068));
    d = new Data("base-1.003_Cube.004", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -0.0, -1.565068));
    v.add(new PVector(-2.0, -0.0, -1.565068));
    v.add(new PVector(-2.0, 0.0, 2.109744));
    v.add(new PVector(-1.719448, 0.0, 2.109744));
    v.add(new PVector(-1.719448, 0.0, 1.99702));
    v.add(new PVector(1.719448, 0.0, 1.99702));
    v.add(new PVector(1.719448, 0.0, 2.109744));
    v.add(new PVector(2.0, 0.0, 2.109744));
    d = new Data("base-1.004_Cube.005", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.719448, 0.0, 1.99702));
    v.add(new PVector(1.719448, -1.719448, 1.99702));
    v.add(new PVector(1.719448, -1.719448, 2.460782));
    v.add(new PVector(1.719448, 0.0, 2.109744));
    d = new Data("base-1.005_Cube.006", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.719448, -1.719448, 2.460782));
    v.add(new PVector(-1.719448, -1.719448, 1.99702));
    v.add(new PVector(-1.719448, 0.0, 1.99702));
    v.add(new PVector(-1.719448, 0.0, 2.109744));
    d = new Data("base-1.006_Cube.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.719448, -0.0, -1.989295));
    v.add(new PVector(-1.719448, -0.0, -1.583288));
    v.add(new PVector(-1.719448, -1.719448, -1.989295));
    d = new Data("base-1.007_Cube.008", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.719448, -0.0, -1.989295));
    v.add(new PVector(1.719448, -1.719448, -1.989295));
    v.add(new PVector(1.719448, -0.0, -1.583288));
    d = new Data("base-1.008_Cube.009", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.719448, -0.0, -1.989295));
    v.add(new PVector(-1.719448, -1.719448, -1.989295));
    v.add(new PVector(1.719448, -1.719448, -1.989295));
    v.add(new PVector(1.719448, -0.0, -1.989295));
    d = new Data("base-1.009_Cube.010", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.719448, -0.0, -1.583288));
    v.add(new PVector(-1.719448, -0.0, -1.583288));
    v.add(new PVector(-1.719448, -0.0, -1.989295));
    v.add(new PVector(1.719448, -0.0, -1.989295));
    d = new Data("base-1.010_Cube.011", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.719448, -1.719448, 1.99702));
    v.add(new PVector(-1.719448, -1.719448, 2.460782));
    v.add(new PVector(1.719448, -1.719448, 2.460782));
    v.add(new PVector(1.719448, -1.719448, 1.99702));
    d = new Data("base-1.012_Cube.013", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.0, -2.044687));
    v.add(new PVector(2.0, -2.0, -2.044687));
    v.add(new PVector(2.0, -2.0, 2.518059));
    v.add(new PVector(-2.0, -2.0, 2.518059));
    d = new Data("base-1.014_Cube.015", 1, v);
    dd.add(d);

    base = new Base("base-1", n, dd);
    p.add(base);


    door = new ArrayList();
    door.add("basedoor-0");
    door.add("basedoor-1");
    door.add("basedoor-2");
    door.add("basedoor-3");
    door.add("basedoor-4");
    door.add("basedoor-5");
    win = new ArrayList();
    win.add("basewins-0");
    win.add("basewins-1");
    win.add("basewins-2");
    win.add("basewins-3");
    win.add("basewins-4");
    roof = new ArrayList();
    roof.add("roof-0");
    roof.add("roof-1");
    roof.add("roof-2");
    roof.add("roof-3");
    roof.add("roof-4");
    n = new BaseNext(door, win, roof);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(1.5, -0.0, -2.0));
    v.add(new PVector(1.5, -2.0, -2.0));
    v.add(new PVector(-1.5, -2.0, -2.0));
    v.add(new PVector(-1.5, -0.0, -2.0));
    d = new Data("base-2_Cube.004", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.5, -2.0, -1.5));
    v.add(new PVector(-1.5, -2.0, -2.0));
    v.add(new PVector(1.5, -2.0, -2.0));
    v.add(new PVector(1.5, -2.0, -1.5));
    v.add(new PVector(2.0, -2.0, -1.5));
    v.add(new PVector(2.0, -2.0, 1.5));
    v.add(new PVector(1.5, -2.0, 1.5));
    v.add(new PVector(1.5, -2.0, 2.0));
    v.add(new PVector(-1.5, -2.0, 2.0));
    v.add(new PVector(-1.5, -2.0, 1.5));
    v.add(new PVector(-2.0, -2.0, 1.5));
    v.add(new PVector(-2.0, -2.0, -1.5));
    d = new Data("base-2.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.5, -2.0, -1.5));
    v.add(new PVector(1.5, -0.0, -1.5));
    v.add(new PVector(2.0, -0.0, -1.5));
    v.add(new PVector(2.0, -2.0, -1.5));
    d = new Data("base-2.002_Cube.002", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.5, -2.0, -1.5));
    v.add(new PVector(-1.5, -0.0, -1.5));
    v.add(new PVector(-1.5, -0.0, -2.0));
    v.add(new PVector(-1.5, -2.0, -2.0));
    d = new Data("base-2.003_Cube.003", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -0.0, -1.5));
    v.add(new PVector(-2.0, -2.0, -1.5));
    v.add(new PVector(-2.0, -2.0, 1.5));
    v.add(new PVector(-2.0, 0.0, 1.5));
    d = new Data("base-2.004_Cube.005", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.5, -2.0, 1.5));
    v.add(new PVector(-1.5, 0.0, 1.5));
    v.add(new PVector(-2.0, 0.0, 1.5));
    v.add(new PVector(-2.0, -2.0, 1.5));
    d = new Data("base-2.005_Cube.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.5, 0.0, 1.5));
    v.add(new PVector(-1.5, -2.0, 1.5));
    v.add(new PVector(-1.5, -2.0, 2.0));
    v.add(new PVector(-1.5, 0.0, 2.0));
    d = new Data("base-2.006_Cube.007", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.5, -2.0, 1.5));
    v.add(new PVector(1.5, 0.0, 1.5));
    v.add(new PVector(1.5, 0.0, 2.0));
    v.add(new PVector(1.5, -2.0, 2.0));
    d = new Data("base-2.007_Cube.008", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.5, 0.0, 2.0));
    v.add(new PVector(-1.5, -2.0, 2.0));
    v.add(new PVector(1.5, -2.0, 2.0));
    v.add(new PVector(1.5, 0.0, 2.0));
    d = new Data("base-2.008_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, 0.0, 1.5));
    v.add(new PVector(2.0, -2.0, 1.5));
    v.add(new PVector(2.0, -2.0, -1.5));
    v.add(new PVector(2.0, -0.0, -1.5));
    d = new Data("base-2.009_Cube.011", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.5, -0.0, -1.5));
    v.add(new PVector(1.5, -2.0, -1.5));
    v.add(new PVector(1.5, -2.0, -2.0));
    v.add(new PVector(1.5, -0.0, -2.0));
    d = new Data("base-2.010_Cube.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.5, -0.0, -1.5));
    v.add(new PVector(1.5, -0.0, -2.0));
    v.add(new PVector(-1.5, -0.0, -2.0));
    v.add(new PVector(-1.5, -0.0, -1.5));
    v.add(new PVector(-2.0, -0.0, -1.5));
    v.add(new PVector(-2.0, 0.0, 1.5));
    v.add(new PVector(-1.5, 0.0, 1.5));
    v.add(new PVector(-1.5, 0.0, 2.0));
    v.add(new PVector(1.5, 0.0, 2.0));
    v.add(new PVector(1.5, 0.0, 1.5));
    v.add(new PVector(2.0, 0.0, 1.5));
    v.add(new PVector(2.0, -0.0, -1.5));
    d = new Data("base-2.011_Cube.013", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.5, -0.0, -1.5));
    v.add(new PVector(-1.5, -2.0, -1.5));
    v.add(new PVector(-2.0, -2.0, -1.5));
    v.add(new PVector(-2.0, -0.0, -1.5));
    d = new Data("base-2.012_Cube.014", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.5, 0.0, 1.5));
    v.add(new PVector(1.5, -2.0, 1.5));
    v.add(new PVector(2.0, -2.0, 1.5));
    v.add(new PVector(2.0, 0.0, 1.5));
    d = new Data("base-2.013_Cube.015", 1, v);
    dd.add(d);

    base = new Base("base-2", n, dd);
    p.add(base);


    door = new ArrayList();
    door.add("basedoor-0");
    door.add("basedoor-1");
    door.add("basedoor-2");
    door.add("basedoor-3");
    door.add("basedoor-4");
    door.add("basedoor-5");
    win = new ArrayList();
    win.add("basewins-1");
    win.add("basewins-3");
    win.add("basewins-5");
    win.add("basewins-6");
    roof = new ArrayList();
    roof.add("roof-0");
    roof.add("roof-1");
    roof.add("roof-2");
    roof.add("roof-3");
    roof.add("roof-4");
    roof.add("roof-5");
    n = new BaseNext(door, win, roof);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-2.0, 0.0, 2.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(2.0, 0.0, 2.0));
    d = new Data("base-3_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -2.0, 0.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    v.add(new PVector(-2.0, -2.0, 0.0));
    v.add(new PVector(-4.0, -2.0, 0.0));
    v.add(new PVector(-4.0, -2.0, -2.0));
    v.add(new PVector(-2.0, -2.0, -2.0));
    v.add(new PVector(2.0, -2.0, -2.0));
    d = new Data("base-3.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -0.0, -2.0));
    v.add(new PVector(2.0, -2.0, -2.0));
    v.add(new PVector(-2.0, -2.0, -2.0));
    v.add(new PVector(-4.0, -2.0, -2.0));
    v.add(new PVector(-4.0, -0.0, -2.0));
    v.add(new PVector(-2.0, -0.0, -2.0));
    d = new Data("base-3.002_Cube.002", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -2.0, 0.0));
    v.add(new PVector(2.0, -2.0, -2.0));
    v.add(new PVector(2.0, -0.0, -2.0));
    v.add(new PVector(2.0, 0.0, 0.0));
    v.add(new PVector(2.0, 0.0, 2.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    d = new Data("base-3.003_Cube.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.0, 0.0));
    v.add(new PVector(-2.0, 0.0, 0.0));
    v.add(new PVector(-4.0, 0.0, 0.0));
    v.add(new PVector(-4.0, -2.0, 0.0));
    d = new Data("base-3.004_Cube.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, 0.0, 0.0));
    v.add(new PVector(-2.0, 0.0, 2.0));
    v.add(new PVector(2.0, 0.0, 2.0));
    v.add(new PVector(2.0, 0.0, 0.0));
    v.add(new PVector(2.0, -0.0, -2.0));
    v.add(new PVector(-2.0, -0.0, -2.0));
    v.add(new PVector(-4.0, -0.0, -2.0));
    v.add(new PVector(-4.0, 0.0, 0.0));
    d = new Data("base-3.005_Cube.006", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, 0.0, 0.0));
    v.add(new PVector(-2.0, -2.0, 0.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    v.add(new PVector(-2.0, 0.0, 2.0));
    d = new Data("base-3.006_Cube.007", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.0, -0.0, -2.0));
    v.add(new PVector(-4.0, -2.0, -2.0));
    v.add(new PVector(-4.0, -2.0, 0.0));
    v.add(new PVector(-4.0, 0.0, 0.0));
    d = new Data("base-3.007_Cube.008", 4, v);
    dd.add(d);

    base = new Base("base-3", n, dd);
    p.add(base);


    door = new ArrayList();
    door.add("basedoor-0");
    door.add("basedoor-1");
    door.add("basedoor-2");
    door.add("basedoor-3");
    door.add("basedoor-4");
    door.add("basedoor-5");
    win = new ArrayList();
    win.add("basewins-1");
    win.add("basewins-3");
    win.add("basewins-7");
    win.add("basewins-8");
    roof = new ArrayList();
    roof.add("roof-0");
    roof.add("roof-1");
    roof.add("roof-2");
    roof.add("roof-3");
    roof.add("roof-4");
    roof.add("roof-5");
    n = new BaseNext(door, win, roof);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.0, 0.0, 2.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    v.add(new PVector(-2.0, 0.0, 2.0));
    d = new Data("base-4_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.0, 0.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(2.0, -2.0, 0.0));
    v.add(new PVector(4.0, -2.0, 0.0));
    v.add(new PVector(4.0, -2.0, -2.0));
    v.add(new PVector(2.0, -2.0, -2.0));
    v.add(new PVector(-2.0, -2.0, -2.0));
    d = new Data("base-4.001_Cube.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -0.0, -2.0));
    v.add(new PVector(-2.0, -2.0, -2.0));
    v.add(new PVector(2.0, -2.0, -2.0));
    v.add(new PVector(4.0, -2.0, -2.0));
    v.add(new PVector(4.0, -0.0, -2.0));
    v.add(new PVector(2.0, -0.0, -2.0));
    d = new Data("base-4.002_Cube.003", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.0, 0.0));
    v.add(new PVector(-2.0, -2.0, -2.0));
    v.add(new PVector(-2.0, -0.0, -2.0));
    v.add(new PVector(-2.0, 0.0, 0.0));
    v.add(new PVector(-2.0, 0.0, 2.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    d = new Data("base-4.003_Cube.004", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -2.0, 0.0));
    v.add(new PVector(2.0, 0.0, 0.0));
    v.add(new PVector(4.0, 0.0, 0.0));
    v.add(new PVector(4.0, -2.0, 0.0));
    d = new Data("base-4.004_Cube.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, 0.0, 0.0));
    v.add(new PVector(2.0, 0.0, 2.0));
    v.add(new PVector(-2.0, 0.0, 2.0));
    v.add(new PVector(-2.0, 0.0, 0.0));
    v.add(new PVector(-2.0, -0.0, -2.0));
    v.add(new PVector(2.0, -0.0, -2.0));
    v.add(new PVector(4.0, -0.0, -2.0));
    v.add(new PVector(4.0, 0.0, 0.0));
    d = new Data("base-4.005_Cube.006", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, 0.0, 0.0));
    v.add(new PVector(2.0, -2.0, 0.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(2.0, 0.0, 2.0));
    d = new Data("base-4.006_Cube.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.0, -0.0, -2.0));
    v.add(new PVector(4.0, -2.0, -2.0));
    v.add(new PVector(4.0, -2.0, 0.0));
    v.add(new PVector(4.0, 0.0, 0.0));
    d = new Data("base-4.007_Cube.008", 2, v);
    dd.add(d);

    base = new Base("base-4", n, dd);
    p.add(base);


    door = new ArrayList();
    door.add("basedoor-0");
    door.add("basedoor-1");
    door.add("basedoor-2");
    door.add("basedoor-3");
    door.add("basedoor-4");
    door.add("basedoor-5");
    win = new ArrayList();
    win.add("basewins-1");
    win.add("basewins-3");
    win.add("basewins-9");
    win.add("basewins-10");
    roof = new ArrayList();
    roof.add("roof-0");
    roof.add("roof-1");
    roof.add("roof-2");
    roof.add("roof-3");
    roof.add("roof-4");
    roof.add("roof-5");
    n = new BaseNext(door, win, roof);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.0, 0.0, 0.0));
    v.add(new PVector(4.0, 0.0, 0.0));
    v.add(new PVector(4.0, -0.0, -2.0));
    v.add(new PVector(-4.0, -0.0, -2.0));
    v.add(new PVector(-4.0, 0.0, 0.0));
    v.add(new PVector(-2.0, 0.0, 0.0));
    v.add(new PVector(-2.0, 0.0, 2.0));
    v.add(new PVector(2.0, 0.0, 2.0));
    d = new Data("base-5_Cube.013", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, 0.0, 2.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(2.0, -2.0, 0.0));
    v.add(new PVector(2.0, 0.0, 0.0));
    d = new Data("base-5.001_Cube.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.0, 0.0));
    v.add(new PVector(-4.0, -2.0, 0.0));
    v.add(new PVector(-4.0, -2.0, -2.0));
    v.add(new PVector(4.0, -2.0, -2.0));
    v.add(new PVector(4.0, -2.0, 0.0));
    v.add(new PVector(2.0, -2.0, 0.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    d = new Data("base-5.002_Cube.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, 0.0, 0.0));
    v.add(new PVector(2.0, -2.0, 0.0));
    v.add(new PVector(4.0, -2.0, 0.0));
    v.add(new PVector(4.0, 0.0, 0.0));
    d = new Data("base-5.003_Cube.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.0, 0.0));
    v.add(new PVector(-2.0, 0.0, 0.0));
    v.add(new PVector(-4.0, 0.0, 0.0));
    v.add(new PVector(-4.0, -2.0, 0.0));
    d = new Data("base-5.004_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.0, -0.0, -2.0));
    v.add(new PVector(4.0, -0.0, -2.0));
    v.add(new PVector(4.0, -2.0, -2.0));
    v.add(new PVector(-4.0, -2.0, -2.0));
    d = new Data("base-5.005_Cube.005", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.0, 0.0, 0.0));
    v.add(new PVector(4.0, -2.0, 0.0));
    v.add(new PVector(4.0, -2.0, -2.0));
    v.add(new PVector(4.0, -0.0, -2.0));
    d = new Data("base-5.006_Cube.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, 0.0, 2.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    v.add(new PVector(2.0, -2.0, 2.0));
    v.add(new PVector(2.0, 0.0, 2.0));
    d = new Data("base-5.007_Cube.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, 0.0, 0.0));
    v.add(new PVector(-2.0, -2.0, 0.0));
    v.add(new PVector(-2.0, -2.0, 2.0));
    v.add(new PVector(-2.0, 0.0, 2.0));
    d = new Data("base-5.008_Cube.008", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.0, -0.0, -2.0));
    v.add(new PVector(-4.0, -2.0, -2.0));
    v.add(new PVector(-4.0, -2.0, 0.0));
    v.add(new PVector(-4.0, 0.0, 0.0));
    d = new Data("base-5.009_Cube.010", 4, v);
    dd.add(d);

    base = new Base("base-5", n, dd);
    p.add(base);


    return p;
  }

  class Door {
    String id;
    ArrayList<Data> data;
    Door(String id, ArrayList<Data> data) {
      this.id = id;
      this.data = data;
    }
  }

  ArrayList<Door> getBasedoorData() {
    ArrayList<Data> dd;
    ArrayList<PVector> v;
    Data d;
    Door door;

    ArrayList<Door> p = new ArrayList();

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-1.000001, -0.000574, 2.013742));
    v.add(new PVector(0.999999, -0.000574, 2.013742));
    v.add(new PVector(0.999999, -1.54063, 2.013742));
    v.add(new PVector(-1.000001, -1.54063, 2.013742));
    d = new Data("basedoor-0_Plane.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.029073, -0.040897, 2.026572));
    v.add(new PVector(0.944677, -0.040897, 2.026572));
    v.add(new PVector(0.944677, -1.490588, 2.026572));
    v.add(new PVector(0.029073, -1.490588, 2.026572));
    d = new Data("basedoor-0.001_Plane.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.945348, -0.040897, 2.026572));
    v.add(new PVector(-0.029744, -0.040897, 2.026572));
    v.add(new PVector(-0.029744, -1.490588, 2.026572));
    v.add(new PVector(-0.945348, -1.490588, 2.026572));
    d = new Data("basedoor-0.002_Plane.002", 2, v);
    dd.add(d);

    door = new Door("basedoor-0", dd);
    p.add(door);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(1.0, 0.0, 2.014716));
    v.add(new PVector(-1.0, 0.0, 2.014716));
    v.add(new PVector(-1.0, 0.0, 2.688803));
    v.add(new PVector(1.0, 0.0, 2.688803));
    d = new Data("basedoor-1_Cube.002", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.0, -0.1, 2.014716));
    v.add(new PVector(1.0, -0.1, 2.014716));
    v.add(new PVector(1.0, -0.1, 2.688803));
    v.add(new PVector(-1.0, -0.1, 2.688803));
    d = new Data("basedoor-1.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.0, 0.0, 2.014716));
    v.add(new PVector(-1.0, -0.1, 2.014716));
    v.add(new PVector(-1.0, -0.1, 2.688803));
    v.add(new PVector(-1.0, 0.0, 2.688803));
    d = new Data("basedoor-1.002_Cube.003", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.843642, -1.426263, 2.007854));
    v.add(new PVector(0.843642, -1.426263, 2.548479));
    v.add(new PVector(0.643642, -1.694169, 2.007854));
    d = new Data("basedoor-1.003_Cube.004", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.643642, -1.694173, 2.00785));
    v.add(new PVector(0.643642, -1.694169, 2.007854));
    v.add(new PVector(0.843642, -1.426263, 2.548479));
    v.add(new PVector(-0.843642, -1.426263, 2.548479));
    d = new Data("basedoor-1.004_Cube.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.843642, -1.426263, 2.007854));
    v.add(new PVector(-0.843642, -1.426263, 2.007854));
    v.add(new PVector(-0.843642, -1.426263, 2.548479));
    v.add(new PVector(0.843642, -1.426263, 2.548479));
    d = new Data("basedoor-1.005_Cube.006", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.843642, -1.426263, 2.007854));
    v.add(new PVector(-0.643642, -1.694173, 2.00785));
    v.add(new PVector(-0.843642, -1.426263, 2.548479));
    d = new Data("basedoor-1.006_Cube.007", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.589526, -0.108107, 2.148788));
    v.add(new PVector(-0.589526, -1.419787, 2.148788));
    v.add(new PVector(-0.455698, -1.419787, 2.148788));
    v.add(new PVector(-0.455698, -0.108107, 2.148788));
    d = new Data("basedoor-1.007_Cube.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.455698, -0.108107, 2.148788));
    v.add(new PVector(-0.455698, -1.419787, 2.148788));
    v.add(new PVector(-0.455698, -1.419787, 2.014959));
    v.add(new PVector(-0.455698, -0.108107, 2.014959));
    d = new Data("basedoor-1.008_Cube.010", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.589526, -0.108107, 2.014959));
    v.add(new PVector(-0.589526, -1.419787, 2.014959));
    v.add(new PVector(-0.589526, -1.419787, 2.148788));
    v.add(new PVector(-0.589526, -0.108107, 2.148788));
    d = new Data("basedoor-1.009_Cube.011", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.589526, -0.108107, 2.148788));
    v.add(new PVector(0.589526, -1.419787, 2.148788));
    v.add(new PVector(0.455698, -1.419787, 2.148788));
    v.add(new PVector(0.455698, -0.108107, 2.148788));
    d = new Data("basedoor-1.010_Cube.012", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.455698, -0.108107, 2.148788));
    v.add(new PVector(0.455698, -1.419787, 2.148788));
    v.add(new PVector(0.455698, -1.419787, 2.01496));
    v.add(new PVector(0.455698, -0.108107, 2.01496));
    d = new Data("basedoor-1.011_Cube.013", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.589526, -0.108107, 2.01496));
    v.add(new PVector(0.589526, -1.419787, 2.01496));
    v.add(new PVector(0.589526, -1.419787, 2.148788));
    v.add(new PVector(0.589526, -0.108107, 2.148788));
    d = new Data("basedoor-1.012_Cube.014", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.406754, -0.157001, 2.01052));
    v.add(new PVector(0.352954, -0.157001, 2.01052));
    v.add(new PVector(0.352954, -1.379243, 2.01052));
    v.add(new PVector(0.406754, -1.379243, 2.01052));
    d = new Data("basedoor-1.013_Cube.015", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.299154, -0.157001, 2.01052));
    v.add(new PVector(0.245354, -0.157001, 2.01052));
    v.add(new PVector(0.245354, -1.379243, 2.01052));
    v.add(new PVector(0.299154, -1.379243, 2.01052));
    d = new Data("basedoor-1.014_Cube.016", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.191554, -0.157001, 2.01052));
    v.add(new PVector(0.137754, -0.157001, 2.01052));
    v.add(new PVector(0.137754, -1.379243, 2.01052));
    v.add(new PVector(0.191554, -1.379243, 2.01052));
    d = new Data("basedoor-1.015_Cube.017", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.083954, -0.157001, 2.01052));
    v.add(new PVector(0.030154, -0.157001, 2.01052));
    v.add(new PVector(0.030154, -1.379243, 2.01052));
    v.add(new PVector(0.083954, -1.379243, 2.01052));
    d = new Data("basedoor-1.016_Cube.018", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.023646, -0.157001, 2.01052));
    v.add(new PVector(-0.077446, -0.157001, 2.01052));
    v.add(new PVector(-0.077446, -1.379243, 2.01052));
    v.add(new PVector(-0.023646, -1.379243, 2.01052));
    d = new Data("basedoor-1.017_Cube.019", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.131246, -0.157001, 2.01052));
    v.add(new PVector(-0.185046, -0.157001, 2.01052));
    v.add(new PVector(-0.185046, -1.379243, 2.01052));
    v.add(new PVector(-0.131246, -1.379243, 2.01052));
    d = new Data("basedoor-1.018_Cube.020", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.238845, -0.157001, 2.01052));
    v.add(new PVector(-0.292645, -0.157001, 2.01052));
    v.add(new PVector(-0.292645, -1.379243, 2.01052));
    v.add(new PVector(-0.238845, -1.379243, 2.01052));
    d = new Data("basedoor-1.019_Cube.021", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.346445, -0.157001, 2.01052));
    v.add(new PVector(-0.400245, -0.157001, 2.01052));
    v.add(new PVector(-0.400245, -1.379243, 2.01052));
    v.add(new PVector(-0.346445, -1.379243, 2.01052));
    d = new Data("basedoor-1.020_Cube.022", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.0, 0.0, 2.688803));
    v.add(new PVector(1.0, -0.1, 2.688803));
    v.add(new PVector(1.0, -0.1, 2.014716));
    v.add(new PVector(1.0, 0.0, 2.014716));
    d = new Data("basedoor-1.021_Cube.023", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.0, 0.0, 2.688803));
    v.add(new PVector(-1.0, -0.1, 2.688803));
    v.add(new PVector(1.0, -0.1, 2.688803));
    v.add(new PVector(1.0, 0.0, 2.688803));
    d = new Data("basedoor-1.022_Cube.024", 1, v);
    dd.add(d);

    door = new Door("basedoor-1", dd);
    p.add(door);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-1.000001, -0.000574, 2.013742));
    v.add(new PVector(0.999999, -0.000574, 2.013742));
    v.add(new PVector(0.999999, -1.54063, 2.013742));
    v.add(new PVector(-1.000001, -1.54063, 2.013742));
    d = new Data("basedoor-2_Plane.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.029073, -0.040897, 2.026572));
    v.add(new PVector(0.944677, -0.040897, 2.026572));
    v.add(new PVector(0.944677, -0.3371, 2.026572));
    v.add(new PVector(0.029073, -0.3371, 2.026572));
    d = new Data("basedoor-2.001_Plane.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.945348, -0.040897, 2.026572));
    v.add(new PVector(-0.029744, -0.040897, 2.026572));
    v.add(new PVector(-0.029744, -0.3371, 2.026572));
    v.add(new PVector(-0.945348, -0.3371, 2.026572));
    d = new Data("basedoor-2.002_Plane.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.945348, -1.271753, 2.026572));
    v.add(new PVector(-0.029744, -1.271753, 2.026572));
    v.add(new PVector(-0.029744, -1.476521, 2.026572));
    v.add(new PVector(-0.945348, -1.476521, 2.026572));
    d = new Data("basedoor-2.003_Plane.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.029073, -1.271753, 2.026572));
    v.add(new PVector(0.944677, -1.271753, 2.026572));
    v.add(new PVector(0.944677, -1.476521, 2.026572));
    v.add(new PVector(0.029073, -1.476521, 2.026572));
    d = new Data("basedoor-2.004_Plane.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.029073, -0.396087, 2.026572));
    v.add(new PVector(0.944677, -0.396087, 2.026572));
    v.add(new PVector(0.944677, -1.212766, 2.026572));
    v.add(new PVector(0.029073, -1.212766, 2.026572));
    d = new Data("basedoor-2.005_Plane.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.945348, -0.396087, 2.026572));
    v.add(new PVector(-0.029744, -0.396087, 2.026572));
    v.add(new PVector(-0.029744, -1.212766, 2.026572));
    v.add(new PVector(-0.945348, -1.212766, 2.026572));
    d = new Data("basedoor-2.006_Plane.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.476375, -0.396087, 2.026572));
    v.add(new PVector(-1.204332, -0.396087, 2.026572));
    v.add(new PVector(-1.204332, -1.212766, 2.026572));
    v.add(new PVector(-1.476375, -1.212766, 2.026572));
    d = new Data("basedoor-2.007_Plane.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.189309, -0.396087, 2.026572));
    v.add(new PVector(1.461351, -0.396087, 2.026572));
    v.add(new PVector(1.461351, -1.212766, 2.026572));
    v.add(new PVector(1.189309, -1.212766, 2.026572));
    d = new Data("basedoor-2.008_Plane.009", 1, v);
    dd.add(d);

    door = new Door("basedoor-2", dd);
    p.add(door);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(0.75353, 0.0, 2.014716));
    v.add(new PVector(-0.753531, 0.0, 2.014716));
    v.add(new PVector(-0.753531, 0.0, 2.688803));
    v.add(new PVector(0.753531, 0.0, 2.688803));
    d = new Data("basedoor-3_Cube.003", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.753531, -0.1, 2.014716));
    v.add(new PVector(0.75353, -0.1, 2.014716));
    v.add(new PVector(0.753531, -0.1, 2.688803));
    v.add(new PVector(-0.753531, -0.1, 2.688803));
    d = new Data("basedoor-3.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.753531, 0.0, 2.014716));
    v.add(new PVector(-0.753531, -0.1, 2.014716));
    v.add(new PVector(-0.753531, -0.1, 2.688803));
    v.add(new PVector(-0.753531, 0.0, 2.688803));
    d = new Data("basedoor-3.002_Cube.002", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.687845, -1.536244, 2.014716));
    v.add(new PVector(0.687845, -1.536244, 2.014716));
    v.add(new PVector(0.687845, -1.536244, 2.470034));
    v.add(new PVector(-0.687845, -1.536244, 2.470034));
    d = new Data("basedoor-3.003_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.687845, -1.436244, 2.014716));
    v.add(new PVector(-0.687845, -1.436244, 2.014716));
    v.add(new PVector(-0.687845, -1.436244, 2.470034));
    v.add(new PVector(0.687845, -1.436244, 2.470034));
    d = new Data("basedoor-3.004_Cube.005", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.687845, -1.436244, 2.470034));
    v.add(new PVector(0.687845, -1.536244, 2.470034));
    v.add(new PVector(0.687845, -1.536244, 2.014716));
    v.add(new PVector(0.687845, -1.436244, 2.014716));
    d = new Data("basedoor-3.005_Cube.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.589526, -0.108107, 2.148788));
    v.add(new PVector(-0.589526, -1.419787, 2.148788));
    v.add(new PVector(-0.455698, -1.419787, 2.148788));
    v.add(new PVector(-0.455698, -0.108107, 2.148788));
    d = new Data("basedoor-3.006_Cube.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.455698, -0.108107, 2.148788));
    v.add(new PVector(-0.455698, -1.419787, 2.148788));
    v.add(new PVector(-0.455698, -1.419787, 2.014959));
    v.add(new PVector(-0.455698, -0.108107, 2.014959));
    d = new Data("basedoor-3.007_Cube.008", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.589526, -0.108107, 2.014959));
    v.add(new PVector(-0.589526, -1.419787, 2.014959));
    v.add(new PVector(-0.589526, -1.419787, 2.148788));
    v.add(new PVector(-0.589526, -0.108107, 2.148788));
    d = new Data("basedoor-3.008_Cube.010", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.589526, -0.108107, 2.148788));
    v.add(new PVector(0.589526, -1.419787, 2.148788));
    v.add(new PVector(0.455698, -1.419787, 2.148788));
    v.add(new PVector(0.455698, -0.108107, 2.148788));
    d = new Data("basedoor-3.009_Cube.011", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.455698, -0.108107, 2.148788));
    v.add(new PVector(0.455698, -1.419787, 2.148788));
    v.add(new PVector(0.455698, -1.419787, 2.01496));
    v.add(new PVector(0.455698, -0.108107, 2.01496));
    d = new Data("basedoor-3.010_Cube.012", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.589526, -0.108107, 2.01496));
    v.add(new PVector(0.589526, -1.419787, 2.01496));
    v.add(new PVector(0.589526, -1.419787, 2.148788));
    v.add(new PVector(0.589526, -0.108107, 2.148788));
    d = new Data("basedoor-3.011_Cube.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.397962, -0.157001, 2.01052));
    v.add(new PVector(-0.397283, -0.157001, 2.01052));
    v.add(new PVector(-0.397283, -1.379243, 2.01052));
    v.add(new PVector(0.397962, -1.379243, 2.01052));
    d = new Data("basedoor-3.012_Cube.014", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.687845, -1.436244, 2.014716));
    v.add(new PVector(-0.687845, -1.536244, 2.014716));
    v.add(new PVector(-0.687845, -1.536244, 2.470034));
    v.add(new PVector(-0.687845, -1.436244, 2.470034));
    d = new Data("basedoor-3.013_Cube.015", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.753531, 0.0, 2.688803));
    v.add(new PVector(0.753531, -0.1, 2.688803));
    v.add(new PVector(0.75353, -0.1, 2.014716));
    v.add(new PVector(0.75353, 0.0, 2.014716));
    d = new Data("basedoor-3.014_Cube.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.753531, 0.0, 2.688803));
    v.add(new PVector(-0.753531, -0.1, 2.688803));
    v.add(new PVector(0.753531, -0.1, 2.688803));
    v.add(new PVector(0.753531, 0.0, 2.688803));
    d = new Data("basedoor-3.015_Cube.017", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.687845, -1.436244, 2.470034));
    v.add(new PVector(-0.687845, -1.536244, 2.470034));
    v.add(new PVector(0.687845, -1.536244, 2.470034));
    v.add(new PVector(0.687845, -1.436244, 2.470034));
    d = new Data("basedoor-3.016_Cube.018", 1, v);
    dd.add(d);

    door = new Door("basedoor-3", dd);
    p.add(door);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(0.507551, 0.0, 2.014716));
    v.add(new PVector(-0.507551, 0.0, 2.014716));
    v.add(new PVector(-0.507551, 0.0, 2.393707));
    v.add(new PVector(0.507551, 0.0, 2.393707));
    d = new Data("basedoor-4_Cube.011", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.507551, -0.064385, 2.014716));
    v.add(new PVector(0.507551, -0.064385, 2.014716));
    v.add(new PVector(0.507551, -0.064385, 2.393707));
    v.add(new PVector(-0.507551, -0.064385, 2.393707));
    d = new Data("basedoor-4.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.507551, 0.0, 2.014716));
    v.add(new PVector(-0.507551, -0.064385, 2.014716));
    v.add(new PVector(-0.507551, -0.064385, 2.393707));
    v.add(new PVector(-0.507551, 0.0, 2.393707));
    d = new Data("basedoor-4.002_Cube.002", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.444742, -0.072926, 2.014716));
    v.add(new PVector(-0.444742, -0.137311, 2.014716));
    v.add(new PVector(-0.444742, -0.137311, 2.305517));
    v.add(new PVector(-0.444742, -0.072926, 2.305517));
    d = new Data("basedoor-4.003_Cube.003", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.444742, -0.137311, 2.014716));
    v.add(new PVector(0.444742, -0.137311, 2.014716));
    v.add(new PVector(0.444742, -0.137311, 2.305517));
    v.add(new PVector(-0.444742, -0.137311, 2.305517));
    d = new Data("basedoor-4.004_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.444742, -0.072926, 2.305517));
    v.add(new PVector(0.444742, -0.137311, 2.305517));
    v.add(new PVector(0.444742, -0.137311, 2.014716));
    v.add(new PVector(0.444742, -0.072926, 2.014716));
    d = new Data("basedoor-4.005_Cube.005", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.349769, -0.455924, 2.024087));
    v.add(new PVector(0.295969, -0.455924, 2.024087));
    v.add(new PVector(0.295969, -1.379243, 2.024087));
    v.add(new PVector(0.349769, -1.379243, 2.024087));
    d = new Data("basedoor-4.006_Cube.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.24217, -0.455924, 2.024087));
    v.add(new PVector(0.18837, -0.455924, 2.024087));
    v.add(new PVector(0.18837, -1.379243, 2.024087));
    v.add(new PVector(0.24217, -1.379243, 2.024087));
    d = new Data("basedoor-4.007_Cube.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.13457, -0.455924, 2.024087));
    v.add(new PVector(0.08077, -0.455924, 2.024087));
    v.add(new PVector(0.08077, -1.379243, 2.024087));
    v.add(new PVector(0.13457, -1.379243, 2.024087));
    d = new Data("basedoor-4.008_Cube.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.02697, -0.455924, 2.024087));
    v.add(new PVector(-0.02683, -0.455924, 2.024087));
    v.add(new PVector(-0.02683, -1.379243, 2.024087));
    v.add(new PVector(0.02697, -1.379243, 2.024087));
    d = new Data("basedoor-4.009_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.08063, -0.455924, 2.024087));
    v.add(new PVector(-0.13443, -0.455924, 2.024087));
    v.add(new PVector(-0.13443, -1.379243, 2.024087));
    v.add(new PVector(-0.08063, -1.379243, 2.024087));
    d = new Data("basedoor-4.010_Cube.012", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.18823, -0.455924, 2.024087));
    v.add(new PVector(-0.24203, -0.455924, 2.024087));
    v.add(new PVector(-0.24203, -1.379243, 2.024087));
    v.add(new PVector(-0.18823, -1.379243, 2.024087));
    d = new Data("basedoor-4.011_Cube.013", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.29583, -0.455924, 2.024087));
    v.add(new PVector(-0.34963, -0.455924, 2.024087));
    v.add(new PVector(-0.34963, -1.379243, 2.024087));
    v.add(new PVector(-0.29583, -1.379243, 2.024087));
    d = new Data("basedoor-4.012_Cube.014", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.404166, -0.115973, 2.01052));
    v.add(new PVector(-0.403909, -0.115973, 2.01052));
    v.add(new PVector(-0.403909, -1.434924, 2.01052));
    v.add(new PVector(0.404166, -1.434924, 2.01052));
    d = new Data("basedoor-4.013_Cube.015", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.507551, 0.0, 2.393707));
    v.add(new PVector(0.507551, -0.064385, 2.393707));
    v.add(new PVector(0.507551, -0.064385, 2.014716));
    v.add(new PVector(0.507551, 0.0, 2.014716));
    d = new Data("basedoor-4.014_Cube.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.507551, 0.0, 2.393707));
    v.add(new PVector(-0.507551, -0.064385, 2.393707));
    v.add(new PVector(0.507551, -0.064385, 2.393707));
    v.add(new PVector(0.507551, 0.0, 2.393707));
    d = new Data("basedoor-4.015_Cube.017", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.444742, -0.072926, 2.305517));
    v.add(new PVector(-0.444742, -0.137311, 2.305517));
    v.add(new PVector(0.444742, -0.137311, 2.305517));
    v.add(new PVector(0.444742, -0.072926, 2.305517));
    d = new Data("basedoor-4.016_Cube.018", 1, v);
    dd.add(d);

    door = new Door("basedoor-4", dd);
    p.add(door);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-1.357608, -0.000574, 2.013742));
    v.add(new PVector(1.357612, -0.000574, 2.013742));
    v.add(new PVector(1.357612, -1.54063, 2.013742));
    v.add(new PVector(-1.357608, -1.54063, 2.013742));
    d = new Data("basedoor-5_Plane.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.025671, -0.040897, 2.026572));
    v.add(new PVector(0.834055, -0.040897, 2.026572));
    v.add(new PVector(0.834055, -1.490588, 2.026572));
    v.add(new PVector(0.025671, -1.490588, 2.026572));
    d = new Data("basedoor-5.001_Plane.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.834642, -0.040897, 2.026572));
    v.add(new PVector(-0.026258, -0.040897, 2.026572));
    v.add(new PVector(-0.026258, -1.490588, 2.026572));
    v.add(new PVector(-0.834642, -1.490588, 2.026572));
    d = new Data("basedoor-5.002_Plane.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.31039, -0.040897, 2.026572));
    v.add(new PVector(-0.87934, -0.040897, 2.026572));
    v.add(new PVector(-0.87934, -1.490588, 2.026572));
    v.add(new PVector(-1.31039, -1.490588, 2.026572));
    d = new Data("basedoor-5.003_Plane.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.880041, -0.040897, 2.026572));
    v.add(new PVector(1.311092, -0.040897, 2.026572));
    v.add(new PVector(1.311092, -1.490588, 2.026572));
    v.add(new PVector(0.880041, -1.490588, 2.026572));
    d = new Data("basedoor-5.004_Plane.004", 1, v);
    dd.add(d);

    door = new Door("basedoor-5", dd);
    p.add(door);


    return p;
  }

  class Win {
    String id;
    ArrayList<Data> data;
    Win(String id, ArrayList<Data> data) {
      this.id = id;
      this.data = data;
    }
  }

  ArrayList<Win> getBasewinsData() {
    ArrayList<Data> dd;
    ArrayList<PVector> v;
    Data d;
    Win win;

    ArrayList<Win> p = new ArrayList();

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.013742, -0.470761, 1.000001));
    v.add(new PVector(2.013742, -0.470761, -0.999999));
    v.add(new PVector(2.013742, -1.54063, -0.999999));
    v.add(new PVector(2.013742, -1.54063, 1.000001));
    d = new Data("basewins-0_Plane.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.026572, -0.511084, -0.029073));
    v.add(new PVector(2.026572, -0.511084, -0.944677));
    v.add(new PVector(2.026572, -1.490588, -0.944677));
    v.add(new PVector(2.026572, -1.490588, -0.029073));
    d = new Data("basewins-0.001_Plane.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.026572, -0.511084, 0.945348));
    v.add(new PVector(2.026572, -0.511084, 0.029744));
    v.add(new PVector(2.026572, -1.490588, 0.029744));
    v.add(new PVector(2.026572, -1.490588, 0.945348));
    d = new Data("basewins-0.002_Plane.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.013742, -0.470761, -1.000001));
    v.add(new PVector(-2.013742, -0.470761, 0.999999));
    v.add(new PVector(-2.013742, -1.54063, 0.999999));
    v.add(new PVector(-2.013742, -1.54063, -1.000001));
    d = new Data("basewins-0.003_Plane.004", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.026572, -0.511084, 0.029073));
    v.add(new PVector(-2.026572, -0.511084, 0.944677));
    v.add(new PVector(-2.026572, -1.490588, 0.944677));
    v.add(new PVector(-2.026572, -1.490588, 0.029073));
    d = new Data("basewins-0.004_Plane.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.026572, -0.511084, -0.945348));
    v.add(new PVector(-2.026572, -0.511084, -0.029744));
    v.add(new PVector(-2.026572, -1.490588, -0.029744));
    v.add(new PVector(-2.026572, -1.490588, -0.945348));
    d = new Data("basewins-0.005_Plane.006", 1, v);
    dd.add(d);

    win = new Win("basewins-0", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(1.360655, -0.574471, -2.027518));
    v.add(new PVector(-1.360652, -0.574471, -2.027519));
    v.add(new PVector(-1.360652, -1.459144, -2.027519));
    v.add(new PVector(1.360655, -1.459144, -2.027518));
    d = new Data("basewins-1_Plane.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.43664, -0.000574, -2.013741));
    v.add(new PVector(-1.436638, -0.000574, -2.013743));
    v.add(new PVector(-1.436638, -1.54063, -2.013743));
    v.add(new PVector(1.43664, -1.54063, -2.013741));
    d = new Data("basewins-1.001_Plane.002", 3, v);
    dd.add(d);

    win = new Win("basewins-1", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-2.014716, -1.500815, 0.002315));
    v.add(new PVector(-2.014716, -1.500815, -1.324665));
    v.add(new PVector(-2.233035, -1.500815, -1.324665));
    v.add(new PVector(-2.233036, -1.500815, 0.002315));
    d = new Data("basewins-2_Cube.006", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -1.600815, -1.324665));
    v.add(new PVector(-2.014716, -1.600815, 0.002315));
    v.add(new PVector(-2.233036, -1.600815, 0.002315));
    v.add(new PVector(-2.233035, -1.600815, -1.324665));
    d = new Data("basewins-2.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -1.500815, -1.324665));
    v.add(new PVector(-2.014716, -1.600815, -1.324665));
    v.add(new PVector(-2.233035, -1.600815, -1.324665));
    v.add(new PVector(-2.233035, -1.500815, -1.324665));
    d = new Data("basewins-2.002_Cube.002", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148787, -0.457598, -1.250701));
    v.add(new PVector(-2.148787, -1.490684, -1.250701));
    v.add(new PVector(-2.148787, -1.490684, -1.116873));
    v.add(new PVector(-2.148787, -0.457598, -1.116873));
    d = new Data("basewins-2.003_Cube.003", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148787, -0.457598, -1.116873));
    v.add(new PVector(-2.148787, -1.490684, -1.116873));
    v.add(new PVector(-2.014959, -1.490684, -1.116873));
    v.add(new PVector(-2.014959, -0.457598, -1.116873));
    d = new Data("basewins-2.004_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014959, -0.457598, -1.250701));
    v.add(new PVector(-2.014959, -1.490684, -1.250701));
    v.add(new PVector(-2.148787, -1.490684, -1.250701));
    v.add(new PVector(-2.148787, -0.457598, -1.250701));
    d = new Data("basewins-2.005_Cube.005", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148788, -0.457598, -0.071648));
    v.add(new PVector(-2.148788, -0.457598, -0.205476));
    v.add(new PVector(-2.148788, -1.490684, -0.205476));
    v.add(new PVector(-2.148788, -1.490684, -0.071648));
    d = new Data("basewins-2.006_Cube.007", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148788, -0.457598, -0.205476));
    v.add(new PVector(-2.01496, -0.457598, -0.205476));
    v.add(new PVector(-2.01496, -1.490684, -0.205476));
    v.add(new PVector(-2.148788, -1.490684, -0.205476));
    d = new Data("basewins-2.007_Cube.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01496, -0.457598, -0.071648));
    v.add(new PVector(-2.148788, -0.457598, -0.071648));
    v.add(new PVector(-2.148788, -1.490684, -0.071648));
    v.add(new PVector(-2.01496, -1.490684, -0.071648));
    d = new Data("basewins-2.008_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.254421));
    v.add(new PVector(-2.01052, -1.45014, -0.254421));
    v.add(new PVector(-2.01052, -1.45014, -0.308221));
    v.add(new PVector(-2.01052, -0.492075, -0.308221));
    d = new Data("basewins-2.009_Cube.011", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.362021));
    v.add(new PVector(-2.01052, -0.492075, -0.415821));
    v.add(new PVector(-2.01052, -1.45014, -0.415821));
    v.add(new PVector(-2.01052, -1.45014, -0.362021));
    d = new Data("basewins-2.010_Cube.012", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.469621));
    v.add(new PVector(-2.01052, -1.45014, -0.469621));
    v.add(new PVector(-2.01052, -1.45014, -0.523421));
    v.add(new PVector(-2.01052, -0.492075, -0.523421));
    d = new Data("basewins-2.011_Cube.013", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.577221));
    v.add(new PVector(-2.01052, -0.492075, -0.631021));
    v.add(new PVector(-2.01052, -1.45014, -0.631021));
    v.add(new PVector(-2.01052, -1.45014, -0.577221));
    d = new Data("basewins-2.012_Cube.014", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.684821));
    v.add(new PVector(-2.01052, -0.492075, -0.73862));
    v.add(new PVector(-2.01052, -1.45014, -0.73862));
    v.add(new PVector(-2.01052, -1.45014, -0.684821));
    d = new Data("basewins-2.013_Cube.015", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.79242));
    v.add(new PVector(-2.01052, -1.45014, -0.79242));
    v.add(new PVector(-2.01052, -1.45014, -0.84622));
    v.add(new PVector(-2.01052, -0.492075, -0.84622));
    d = new Data("basewins-2.014_Cube.016", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.90002));
    v.add(new PVector(-2.01052, -1.45014, -0.90002));
    v.add(new PVector(-2.01052, -1.45014, -0.95382));
    v.add(new PVector(-2.01052, -0.492075, -0.95382));
    d = new Data("basewins-2.015_Cube.017", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -1.00762));
    v.add(new PVector(-2.010519, -0.492075, -1.06142));
    v.add(new PVector(-2.010519, -1.45014, -1.06142));
    v.add(new PVector(-2.01052, -1.45014, -1.00762));
    d = new Data("basewins-2.016_Cube.018", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -0.345974, 0.002315));
    v.add(new PVector(-2.014716, -0.345974, -1.324665));
    v.add(new PVector(-2.233036, -0.345974, -1.324665));
    v.add(new PVector(-2.233036, -0.345974, 0.002315));
    d = new Data("basewins-2.017_Cube.019", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -0.445974, -1.324665));
    v.add(new PVector(-2.014716, -0.445974, 0.002315));
    v.add(new PVector(-2.233036, -0.445974, 0.002315));
    v.add(new PVector(-2.233036, -0.445974, -1.324665));
    d = new Data("basewins-2.018_Cube.020", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -0.345974, -1.324665));
    v.add(new PVector(-2.014716, -0.445974, -1.324665));
    v.add(new PVector(-2.233036, -0.445974, -1.324665));
    v.add(new PVector(-2.233036, -0.345974, -1.324665));
    d = new Data("basewins-2.019_Cube.021", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.339493, -1.500815, -2.014716));
    v.add(new PVector(-0.012512, -1.500815, -2.014716));
    v.add(new PVector(-0.012512, -1.500815, -2.233035));
    v.add(new PVector(-1.339492, -1.500815, -2.233036));
    d = new Data("basewins-2.020_Cube.022", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -1.600815, -2.014716));
    v.add(new PVector(-1.339493, -1.600815, -2.014716));
    v.add(new PVector(-1.339492, -1.600815, -2.233036));
    v.add(new PVector(-0.012512, -1.600815, -2.233035));
    d = new Data("basewins-2.021_Cube.023", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -1.500815, -2.014716));
    v.add(new PVector(-0.012512, -1.600815, -2.014716));
    v.add(new PVector(-0.012512, -1.600815, -2.233035));
    v.add(new PVector(-0.012512, -1.500815, -2.233035));
    d = new Data("basewins-2.022_Cube.024", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.086476, -0.457598, -2.148787));
    v.add(new PVector(-0.086476, -1.490684, -2.148787));
    v.add(new PVector(-0.220304, -1.490684, -2.148787));
    v.add(new PVector(-0.220304, -0.457598, -2.148787));
    d = new Data("basewins-2.023_Cube.025", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.220304, -0.457598, -2.148787));
    v.add(new PVector(-0.220304, -1.490684, -2.148787));
    v.add(new PVector(-0.220304, -1.490684, -2.014959));
    v.add(new PVector(-0.220304, -0.457598, -2.014959));
    d = new Data("basewins-2.024_Cube.026", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.086476, -0.457598, -2.014959));
    v.add(new PVector(-0.086476, -1.490684, -2.014959));
    v.add(new PVector(-0.086476, -1.490684, -2.148787));
    v.add(new PVector(-0.086476, -0.457598, -2.148787));
    d = new Data("basewins-2.025_Cube.027", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.265529, -0.457598, -2.148788));
    v.add(new PVector(-1.131701, -0.457598, -2.148788));
    v.add(new PVector(-1.131701, -1.490684, -2.148788));
    v.add(new PVector(-1.265529, -1.490684, -2.148788));
    d = new Data("basewins-2.026_Cube.028", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.131701, -0.457598, -2.148788));
    v.add(new PVector(-1.131701, -0.457598, -2.01496));
    v.add(new PVector(-1.131701, -1.490684, -2.01496));
    v.add(new PVector(-1.131701, -1.490684, -2.148788));
    d = new Data("basewins-2.027_Cube.029", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.265529, -0.457598, -2.01496));
    v.add(new PVector(-1.265529, -0.457598, -2.148788));
    v.add(new PVector(-1.265529, -1.490684, -2.148788));
    v.add(new PVector(-1.265529, -1.490684, -2.01496));
    d = new Data("basewins-2.028_Cube.030", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.082756, -0.492075, -2.01052));
    v.add(new PVector(-1.028956, -0.492075, -2.01052));
    v.add(new PVector(-1.028956, -1.45014, -2.01052));
    v.add(new PVector(-1.082756, -1.45014, -2.01052));
    d = new Data("basewins-2.029_Cube.031", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.975156, -0.492075, -2.01052));
    v.add(new PVector(-0.921356, -0.492075, -2.01052));
    v.add(new PVector(-0.921356, -1.45014, -2.01052));
    v.add(new PVector(-0.975156, -1.45014, -2.01052));
    d = new Data("basewins-2.030_Cube.032", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.867556, -0.492075, -2.01052));
    v.add(new PVector(-0.867556, -1.45014, -2.01052));
    v.add(new PVector(-0.813756, -1.45014, -2.01052));
    v.add(new PVector(-0.813756, -0.492075, -2.01052));
    d = new Data("basewins-2.031_Cube.033", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.759956, -0.492075, -2.01052));
    v.add(new PVector(-0.706156, -0.492075, -2.01052));
    v.add(new PVector(-0.706156, -1.45014, -2.01052));
    v.add(new PVector(-0.759956, -1.45014, -2.01052));
    d = new Data("basewins-2.032_Cube.034", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.652357, -0.492075, -2.01052));
    v.add(new PVector(-0.598557, -0.492075, -2.01052));
    v.add(new PVector(-0.598557, -1.45014, -2.01052));
    v.add(new PVector(-0.652357, -1.45014, -2.01052));
    d = new Data("basewins-2.033_Cube.035", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.544757, -0.492075, -2.01052));
    v.add(new PVector(-0.544757, -1.45014, -2.01052));
    v.add(new PVector(-0.490957, -1.45014, -2.01052));
    v.add(new PVector(-0.490957, -0.492075, -2.01052));
    d = new Data("basewins-2.034_Cube.036", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.437157, -0.492075, -2.01052));
    v.add(new PVector(-0.437157, -1.45014, -2.01052));
    v.add(new PVector(-0.383357, -1.45014, -2.01052));
    v.add(new PVector(-0.383357, -0.492075, -2.01052));
    d = new Data("basewins-2.035_Cube.037", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.329557, -0.492075, -2.01052));
    v.add(new PVector(-0.329557, -1.45014, -2.01052));
    v.add(new PVector(-0.275757, -1.45014, -2.010519));
    v.add(new PVector(-0.275757, -0.492075, -2.010519));
    d = new Data("basewins-2.036_Cube.038", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.339493, -0.345974, -2.014716));
    v.add(new PVector(-0.012512, -0.345974, -2.014716));
    v.add(new PVector(-0.012512, -0.345974, -2.233036));
    v.add(new PVector(-1.339492, -0.345974, -2.233036));
    d = new Data("basewins-2.037_Cube.039", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -0.445974, -2.014716));
    v.add(new PVector(-1.339493, -0.445974, -2.014716));
    v.add(new PVector(-1.339492, -0.445974, -2.233036));
    v.add(new PVector(-0.012512, -0.445974, -2.233036));
    d = new Data("basewins-2.038_Cube.040", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -0.345974, -2.014716));
    v.add(new PVector(-0.012512, -0.445974, -2.014716));
    v.add(new PVector(-0.012512, -0.445974, -2.233036));
    v.add(new PVector(-0.012512, -0.345974, -2.233036));
    d = new Data("basewins-2.039_Cube.041", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.500815, -1.330741));
    v.add(new PVector(2.014716, -1.500815, -0.00376));
    v.add(new PVector(2.233035, -1.500815, -0.00376));
    v.add(new PVector(2.233036, -1.500815, -1.33074));
    d = new Data("basewins-2.040_Cube.042", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.600815, -0.00376));
    v.add(new PVector(2.014716, -1.600815, -1.330741));
    v.add(new PVector(2.233036, -1.600815, -1.33074));
    v.add(new PVector(2.233035, -1.600815, -0.00376));
    d = new Data("basewins-2.041_Cube.043", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.500815, -0.00376));
    v.add(new PVector(2.014716, -1.600815, -0.00376));
    v.add(new PVector(2.233035, -1.600815, -0.00376));
    v.add(new PVector(2.233035, -1.500815, -0.00376));
    d = new Data("basewins-2.042_Cube.044", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148787, -0.457598, -0.077724));
    v.add(new PVector(2.148787, -1.490684, -0.077724));
    v.add(new PVector(2.148787, -1.490684, -0.211552));
    v.add(new PVector(2.148787, -0.457598, -0.211552));
    d = new Data("basewins-2.043_Cube.045", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148787, -0.457598, -0.211552));
    v.add(new PVector(2.148787, -1.490684, -0.211552));
    v.add(new PVector(2.014959, -1.490684, -0.211552));
    v.add(new PVector(2.014959, -0.457598, -0.211552));
    d = new Data("basewins-2.044_Cube.046", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014959, -0.457598, -0.077724));
    v.add(new PVector(2.014959, -1.490684, -0.077724));
    v.add(new PVector(2.148787, -1.490684, -0.077724));
    v.add(new PVector(2.148787, -0.457598, -0.077724));
    d = new Data("basewins-2.045_Cube.047", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148788, -0.457598, -1.256777));
    v.add(new PVector(2.148788, -0.457598, -1.122949));
    v.add(new PVector(2.148788, -1.490684, -1.122949));
    v.add(new PVector(2.148788, -1.490684, -1.256777));
    d = new Data("basewins-2.046_Cube.048", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148788, -0.457598, -1.122949));
    v.add(new PVector(2.01496, -0.457598, -1.122949));
    v.add(new PVector(2.01496, -1.490684, -1.122949));
    v.add(new PVector(2.148788, -1.490684, -1.122949));
    d = new Data("basewins-2.047_Cube.049", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01496, -0.457598, -1.256777));
    v.add(new PVector(2.148788, -0.457598, -1.256777));
    v.add(new PVector(2.148788, -1.490684, -1.256777));
    v.add(new PVector(2.01496, -1.490684, -1.256777));
    d = new Data("basewins-2.048_Cube.050", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -1.074004));
    v.add(new PVector(2.01052, -0.492075, -1.020204));
    v.add(new PVector(2.01052, -1.45014, -1.020204));
    v.add(new PVector(2.01052, -1.45014, -1.074004));
    d = new Data("basewins-2.049_Cube.051", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.966404));
    v.add(new PVector(2.01052, -0.492075, -0.912604));
    v.add(new PVector(2.01052, -1.45014, -0.912604));
    v.add(new PVector(2.01052, -1.45014, -0.966404));
    d = new Data("basewins-2.050_Cube.052", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.858804));
    v.add(new PVector(2.01052, -1.45014, -0.858804));
    v.add(new PVector(2.01052, -1.45014, -0.805004));
    v.add(new PVector(2.01052, -0.492075, -0.805004));
    d = new Data("basewins-2.051_Cube.053", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.751204));
    v.add(new PVector(2.01052, -0.492075, -0.697405));
    v.add(new PVector(2.01052, -1.45014, -0.697405));
    v.add(new PVector(2.01052, -1.45014, -0.751204));
    d = new Data("basewins-2.052_Cube.054", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.643605));
    v.add(new PVector(2.01052, -0.492075, -0.589805));
    v.add(new PVector(2.01052, -1.45014, -0.589805));
    v.add(new PVector(2.01052, -1.45014, -0.643605));
    d = new Data("basewins-2.053_Cube.055", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.536005));
    v.add(new PVector(2.01052, -1.45014, -0.536005));
    v.add(new PVector(2.01052, -1.45014, -0.482205));
    v.add(new PVector(2.01052, -0.492075, -0.482205));
    d = new Data("basewins-2.054_Cube.056", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.428405));
    v.add(new PVector(2.01052, -1.45014, -0.428405));
    v.add(new PVector(2.01052, -1.45014, -0.374605));
    v.add(new PVector(2.01052, -0.492075, -0.374605));
    d = new Data("basewins-2.055_Cube.057", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.320805));
    v.add(new PVector(2.01052, -1.45014, -0.320805));
    v.add(new PVector(2.010519, -1.45014, -0.267005));
    v.add(new PVector(2.010519, -0.492075, -0.267005));
    d = new Data("basewins-2.056_Cube.058", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.345974, -1.330741));
    v.add(new PVector(2.014716, -0.345974, -0.00376));
    v.add(new PVector(2.233036, -0.345974, -0.00376));
    v.add(new PVector(2.233036, -0.345974, -1.33074));
    d = new Data("basewins-2.057_Cube.059", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.445974, -0.00376));
    v.add(new PVector(2.014716, -0.445974, -1.330741));
    v.add(new PVector(2.233036, -0.445974, -1.33074));
    v.add(new PVector(2.233036, -0.445974, -0.00376));
    d = new Data("basewins-2.058_Cube.060", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.345974, -0.00376));
    v.add(new PVector(2.014716, -0.445974, -0.00376));
    v.add(new PVector(2.233036, -0.445974, -0.00376));
    v.add(new PVector(2.233036, -0.345974, -0.00376));
    d = new Data("basewins-2.059_Cube.061", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233036, -1.500815, 0.002315));
    v.add(new PVector(-2.233036, -1.600815, 0.002315));
    v.add(new PVector(-2.014716, -1.600815, 0.002315));
    v.add(new PVector(-2.014716, -1.500815, 0.002315));
    d = new Data("basewins-2.060_Cube.062", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233035, -1.500815, -1.324665));
    v.add(new PVector(-2.233035, -1.600815, -1.324665));
    v.add(new PVector(-2.233036, -1.600815, 0.002315));
    v.add(new PVector(-2.233036, -1.500815, 0.002315));
    d = new Data("basewins-2.061_Cube.063", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233036, -0.345974, 0.002315));
    v.add(new PVector(-2.233036, -0.445974, 0.002315));
    v.add(new PVector(-2.014716, -0.445974, 0.002315));
    v.add(new PVector(-2.014716, -0.345974, 0.002315));
    d = new Data("basewins-2.062_Cube.064", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233036, -0.345974, -1.324665));
    v.add(new PVector(-2.233036, -0.445974, -1.324665));
    v.add(new PVector(-2.233036, -0.445974, 0.002315));
    v.add(new PVector(-2.233036, -0.345974, 0.002315));
    d = new Data("basewins-2.063_Cube.065", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.339492, -1.500815, -2.233036));
    v.add(new PVector(-1.339492, -1.600815, -2.233036));
    v.add(new PVector(-1.339493, -1.600815, -2.014716));
    v.add(new PVector(-1.339493, -1.500815, -2.014716));
    d = new Data("basewins-2.064_Cube.066", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -1.500815, -2.233035));
    v.add(new PVector(-0.012512, -1.600815, -2.233035));
    v.add(new PVector(-1.339492, -1.600815, -2.233036));
    v.add(new PVector(-1.339492, -1.500815, -2.233036));
    d = new Data("basewins-2.065_Cube.067", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.339492, -0.345974, -2.233036));
    v.add(new PVector(-1.339492, -0.445974, -2.233036));
    v.add(new PVector(-1.339493, -0.445974, -2.014716));
    v.add(new PVector(-1.339493, -0.345974, -2.014716));
    d = new Data("basewins-2.066_Cube.068", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -0.345974, -2.233036));
    v.add(new PVector(-0.012512, -0.445974, -2.233036));
    v.add(new PVector(-1.339492, -0.445974, -2.233036));
    v.add(new PVector(-1.339492, -0.345974, -2.233036));
    d = new Data("basewins-2.067_Cube.069", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -1.500815, -1.33074));
    v.add(new PVector(2.233036, -1.600815, -1.33074));
    v.add(new PVector(2.014716, -1.600815, -1.330741));
    v.add(new PVector(2.014716, -1.500815, -1.330741));
    d = new Data("basewins-2.068_Cube.070", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233035, -1.500815, -0.00376));
    v.add(new PVector(2.233035, -1.600815, -0.00376));
    v.add(new PVector(2.233036, -1.600815, -1.33074));
    v.add(new PVector(2.233036, -1.500815, -1.33074));
    d = new Data("basewins-2.069_Cube.071", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -0.345974, -1.33074));
    v.add(new PVector(2.233036, -0.445974, -1.33074));
    v.add(new PVector(2.014716, -0.445974, -1.330741));
    v.add(new PVector(2.014716, -0.345974, -1.330741));
    d = new Data("basewins-2.070_Cube.072", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -0.345974, -0.00376));
    v.add(new PVector(2.233036, -0.445974, -0.00376));
    v.add(new PVector(2.233036, -0.445974, -1.33074));
    v.add(new PVector(2.233036, -0.345974, -1.33074));
    d = new Data("basewins-2.071_Cube.073", 2, v);
    dd.add(d);

    win = new Win("basewins-2", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-0.035399, -0.882847, -2.013742));
    v.add(new PVector(-1.325516, -0.882847, -2.013742));
    v.add(new PVector(-1.325516, -1.551483, -2.013742));
    v.add(new PVector(-0.035399, -1.551483, -2.013742));
    d = new Data("basewins-3_Plane.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.699211, -0.917264, -2.026572));
    v.add(new PVector(-1.28983, -0.917264, -2.026572));
    v.add(new PVector(-1.28983, -1.51601, -2.026572));
    v.add(new PVector(-0.699211, -1.51601, -2.026572));
    d = new Data("basewins-3.001_Plane.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.070653, -0.917264, -2.026572));
    v.add(new PVector(-0.661271, -0.917264, -2.026572));
    v.add(new PVector(-0.661271, -1.51601, -2.026572));
    v.add(new PVector(-0.070653, -1.51601, -2.026572));
    d = new Data("basewins-3.002_Plane.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.013742, -0.882847, 1.325517));
    v.add(new PVector(2.013742, -0.882847, 0.4354));
    v.add(new PVector(2.013742, -1.551483, 0.4354));
    v.add(new PVector(2.013742, -1.551483, 1.325517));
    d = new Data("basewins-3.003_Plane.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.026572, -0.917264, 0.861704));
    v.add(new PVector(2.026572, -0.917264, 0.471086));
    v.add(new PVector(2.026572, -1.51601, 0.471086));
    v.add(new PVector(2.026572, -1.51601, 0.861704));
    d = new Data("basewins-3.004_Plane.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.026572, -0.917264, 1.290263));
    v.add(new PVector(2.026572, -0.917264, 0.899644));
    v.add(new PVector(2.026572, -1.51601, 0.899644));
    v.add(new PVector(2.026572, -1.51601, 1.290263));
    d = new Data("basewins-3.005_Plane.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.013742, -0.882847, 0.435399));
    v.add(new PVector(-2.013742, -0.882847, 1.325516));
    v.add(new PVector(-2.013742, -1.551483, 1.325516));
    v.add(new PVector(-2.013742, -1.551483, 0.435399));
    d = new Data("basewins-3.006_Plane.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.026572, -0.917264, 0.899212));
    v.add(new PVector(-2.026572, -0.917264, 1.28983));
    v.add(new PVector(-2.026572, -1.51601, 1.28983));
    v.add(new PVector(-2.026572, -1.51601, 0.899212));
    d = new Data("basewins-3.007_Plane.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.026572, -0.917264, 0.470653));
    v.add(new PVector(-2.026572, -0.917264, 0.861271));
    v.add(new PVector(-2.026572, -1.51601, 0.861271));
    v.add(new PVector(-2.026572, -1.51601, 0.470653));
    d = new Data("basewins-3.008_Plane.009", 1, v);
    dd.add(d);

    win = new Win("basewins-3", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-0.035399, -0.882847, -2.013742));
    v.add(new PVector(-1.325516, -0.882847, -2.013742));
    v.add(new PVector(-1.325516, -1.551483, -2.013742));
    v.add(new PVector(-0.035399, -1.551483, -2.013742));
    d = new Data("basewins-4_Plane.009", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.699211, -0.917264, -2.026572));
    v.add(new PVector(-1.28983, -0.917264, -2.026572));
    v.add(new PVector(-1.28983, -1.51601, -2.026572));
    v.add(new PVector(-0.699211, -1.51601, -2.026572));
    d = new Data("basewins-4.001_Plane.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.070653, -0.917264, -2.026572));
    v.add(new PVector(-0.661271, -0.917264, -2.026572));
    v.add(new PVector(-0.661271, -1.51601, -2.026572));
    v.add(new PVector(-0.070653, -1.51601, -2.026572));
    d = new Data("basewins-4.002_Plane.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.013742, -0.882847, -0.37389));
    v.add(new PVector(2.013742, -0.882847, -1.264007));
    v.add(new PVector(2.013742, -1.551483, -1.264007));
    v.add(new PVector(2.013742, -1.551483, -0.37389));
    d = new Data("basewins-4.003_Plane.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.026572, -0.917264, -0.837703));
    v.add(new PVector(2.026572, -0.917264, -1.228321));
    v.add(new PVector(2.026572, -1.51601, -1.228321));
    v.add(new PVector(2.026572, -1.51601, -0.837703));
    d = new Data("basewins-4.004_Plane.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.026572, -0.917264, -0.409144));
    v.add(new PVector(2.026572, -0.917264, -0.799762));
    v.add(new PVector(2.026572, -1.51601, -0.799762));
    v.add(new PVector(2.026572, -1.51601, -0.409144));
    d = new Data("basewins-4.005_Plane.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.013742, -0.882847, -1.264008));
    v.add(new PVector(-2.013742, -0.882847, -0.373891));
    v.add(new PVector(-2.013742, -1.551483, -0.373891));
    v.add(new PVector(-2.013742, -1.551483, -1.264008));
    d = new Data("basewins-4.006_Plane.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.026572, -0.917264, -0.800195));
    v.add(new PVector(-2.026572, -0.917264, -0.409577));
    v.add(new PVector(-2.026572, -1.51601, -0.409577));
    v.add(new PVector(-2.026572, -1.51601, -0.800195));
    d = new Data("basewins-4.007_Plane.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.026572, -0.917264, -1.228754));
    v.add(new PVector(-2.026572, -0.917264, -0.838136));
    v.add(new PVector(-2.026572, -1.51601, -0.838136));
    v.add(new PVector(-2.026572, -1.51601, -1.228754));
    d = new Data("basewins-4.008_Plane.008", 1, v);
    dd.add(d);

    win = new Win("basewins-4", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(1.104486, -0.882847, -2.013742));
    v.add(new PVector(-0.185631, -0.882847, -2.013742));
    v.add(new PVector(-0.185631, -1.551483, -2.013742));
    v.add(new PVector(1.104486, -1.551483, -2.013742));
    d = new Data("basewins-5_Plane.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.440674, -0.917264, -2.026572));
    v.add(new PVector(-0.149945, -0.917264, -2.026572));
    v.add(new PVector(-0.149945, -1.51601, -2.026572));
    v.add(new PVector(0.440674, -1.51601, -2.026572));
    d = new Data("basewins-5.001_Plane.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.069232, -0.917264, -2.026572));
    v.add(new PVector(0.478614, -0.917264, -2.026572));
    v.add(new PVector(0.478614, -1.51601, -2.026572));
    v.add(new PVector(1.069232, -1.51601, -2.026572));
    d = new Data("basewins-5.002_Plane.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.013742, -0.355609, -0.37389));
    v.add(new PVector(2.013742, -0.355609, -1.264007));
    v.add(new PVector(2.013742, -1.551483, -1.264007));
    v.add(new PVector(2.013742, -1.551483, -0.37389));
    d = new Data("basewins-5.003_Plane.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.026572, -0.390026, -0.837703));
    v.add(new PVector(2.026572, -0.390026, -1.228321));
    v.add(new PVector(2.026572, -1.51601, -1.228321));
    v.add(new PVector(2.026572, -1.51601, -0.837703));
    d = new Data("basewins-5.004_Plane.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.026572, -0.390026, -0.409144));
    v.add(new PVector(2.026572, -0.390026, -0.799762));
    v.add(new PVector(2.026572, -1.51601, -0.799762));
    v.add(new PVector(2.026572, -1.51601, -0.409144));
    d = new Data("basewins-5.005_Plane.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.011862, -0.355609, -1.264008));
    v.add(new PVector(-4.011862, -0.355609, -0.373891));
    v.add(new PVector(-4.011862, -1.551483, -0.373891));
    v.add(new PVector(-4.011862, -1.551483, -1.264008));
    d = new Data("basewins-5.006_Plane.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.024692, -0.390026, -0.800195));
    v.add(new PVector(-4.024692, -0.390026, -0.409577));
    v.add(new PVector(-4.024692, -1.51601, -0.409577));
    v.add(new PVector(-4.024691, -1.51601, -0.800195));
    d = new Data("basewins-5.007_Plane.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.024692, -0.390026, -1.228754));
    v.add(new PVector(-4.024692, -0.390026, -0.838136));
    v.add(new PVector(-4.024692, -1.51601, -0.838136));
    v.add(new PVector(-4.024691, -1.51601, -1.228754));
    d = new Data("basewins-5.008_Plane.008", 1, v);
    dd.add(d);

    win = new Win("basewins-5", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-2.014716, -1.500815, 1.703856));
    v.add(new PVector(-2.014716, -1.500815, 0.376876));
    v.add(new PVector(-2.233035, -1.500815, 0.376876));
    v.add(new PVector(-2.233036, -1.500815, 1.703856));
    d = new Data("basewins-6_Cube.014", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -1.600815, 0.376876));
    v.add(new PVector(-2.014716, -1.600815, 1.703856));
    v.add(new PVector(-2.233036, -1.600815, 1.703856));
    v.add(new PVector(-2.233035, -1.600815, 0.376876));
    d = new Data("basewins-6.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -1.500815, 0.376876));
    v.add(new PVector(-2.014716, -1.600815, 0.376876));
    v.add(new PVector(-2.233035, -1.600815, 0.376876));
    v.add(new PVector(-2.233035, -1.500815, 0.376876));
    d = new Data("basewins-6.002_Cube.002", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148787, -0.457598, 0.45084));
    v.add(new PVector(-2.148787, -1.490684, 0.45084));
    v.add(new PVector(-2.148787, -1.490684, 0.584667));
    v.add(new PVector(-2.148787, -0.457598, 0.584667));
    d = new Data("basewins-6.003_Cube.003", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148787, -0.457598, 0.584667));
    v.add(new PVector(-2.148787, -1.490684, 0.584667));
    v.add(new PVector(-2.014959, -1.490684, 0.584668));
    v.add(new PVector(-2.014959, -0.457598, 0.584668));
    d = new Data("basewins-6.004_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014959, -0.457598, 0.45084));
    v.add(new PVector(-2.014959, -1.490684, 0.45084));
    v.add(new PVector(-2.148787, -1.490684, 0.45084));
    v.add(new PVector(-2.148787, -0.457598, 0.45084));
    d = new Data("basewins-6.005_Cube.005", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148788, -0.457598, 1.629892));
    v.add(new PVector(-2.148788, -0.457598, 1.496064));
    v.add(new PVector(-2.148788, -1.490684, 1.496064));
    v.add(new PVector(-2.148788, -1.490684, 1.629892));
    d = new Data("basewins-6.006_Cube.006", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148788, -0.457598, 1.496064));
    v.add(new PVector(-2.01496, -0.457598, 1.496064));
    v.add(new PVector(-2.01496, -1.490684, 1.496064));
    v.add(new PVector(-2.148788, -1.490684, 1.496064));
    d = new Data("basewins-6.007_Cube.007", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01496, -0.457598, 1.629892));
    v.add(new PVector(-2.148788, -0.457598, 1.629892));
    v.add(new PVector(-2.148788, -1.490684, 1.629892));
    v.add(new PVector(-2.01496, -1.490684, 1.629892));
    d = new Data("basewins-6.008_Cube.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, 1.447119));
    v.add(new PVector(-2.01052, -1.45014, 1.447119));
    v.add(new PVector(-2.01052, -1.45014, 1.39332));
    v.add(new PVector(-2.01052, -0.492075, 1.39332));
    d = new Data("basewins-6.009_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, 1.33952));
    v.add(new PVector(-2.01052, -0.492075, 1.28572));
    v.add(new PVector(-2.01052, -1.45014, 1.28572));
    v.add(new PVector(-2.01052, -1.45014, 1.33952));
    d = new Data("basewins-6.010_Cube.011", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, 1.23192));
    v.add(new PVector(-2.01052, -1.45014, 1.23192));
    v.add(new PVector(-2.01052, -1.45014, 1.17812));
    v.add(new PVector(-2.01052, -0.492075, 1.17812));
    d = new Data("basewins-6.011_Cube.012", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, 1.12432));
    v.add(new PVector(-2.01052, -0.492075, 1.07052));
    v.add(new PVector(-2.01052, -1.45014, 1.07052));
    v.add(new PVector(-2.01052, -1.45014, 1.12432));
    d = new Data("basewins-6.012_Cube.013", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, 1.01672));
    v.add(new PVector(-2.01052, -0.492075, 0.96292));
    v.add(new PVector(-2.01052, -1.45014, 0.96292));
    v.add(new PVector(-2.01052, -1.45014, 1.01672));
    d = new Data("basewins-6.013_Cube.015", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, 0.90912));
    v.add(new PVector(-2.01052, -1.45014, 0.90912));
    v.add(new PVector(-2.01052, -1.45014, 0.85532));
    v.add(new PVector(-2.01052, -0.492075, 0.85532));
    d = new Data("basewins-6.014_Cube.016", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, 0.801521));
    v.add(new PVector(-2.01052, -1.45014, 0.801521));
    v.add(new PVector(-2.01052, -1.45014, 0.74772));
    v.add(new PVector(-2.01052, -0.492075, 0.74772));
    d = new Data("basewins-6.015_Cube.017", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, 0.693921));
    v.add(new PVector(-2.010519, -0.492075, 0.640121));
    v.add(new PVector(-2.010519, -1.45014, 0.640121));
    v.add(new PVector(-2.01052, -1.45014, 0.693921));
    d = new Data("basewins-6.016_Cube.018", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -0.345974, 1.703856));
    v.add(new PVector(-2.014716, -0.345974, 0.376876));
    v.add(new PVector(-2.233036, -0.345974, 0.376876));
    v.add(new PVector(-2.233036, -0.345974, 1.703856));
    d = new Data("basewins-6.017_Cube.019", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -0.445974, 0.376876));
    v.add(new PVector(-2.014716, -0.445974, 1.703856));
    v.add(new PVector(-2.233036, -0.445974, 1.703856));
    v.add(new PVector(-2.233036, -0.445974, 0.376876));
    d = new Data("basewins-6.018_Cube.020", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -0.345974, 0.376876));
    v.add(new PVector(-2.014716, -0.445974, 0.376876));
    v.add(new PVector(-2.233036, -0.445974, 0.376876));
    v.add(new PVector(-2.233036, -0.345974, 0.376876));
    d = new Data("basewins-6.019_Cube.021", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.339493, -1.500815, -2.014716));
    v.add(new PVector(-0.012512, -1.500815, -2.014716));
    v.add(new PVector(-0.012512, -1.500815, -2.233035));
    v.add(new PVector(-1.339492, -1.500815, -2.233036));
    d = new Data("basewins-6.020_Cube.022", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -1.600815, -2.014716));
    v.add(new PVector(-1.339493, -1.600815, -2.014716));
    v.add(new PVector(-1.339492, -1.600815, -2.233036));
    v.add(new PVector(-0.012512, -1.600815, -2.233035));
    d = new Data("basewins-6.021_Cube.023", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -1.500815, -2.014716));
    v.add(new PVector(-0.012512, -1.600815, -2.014716));
    v.add(new PVector(-0.012512, -1.600815, -2.233035));
    v.add(new PVector(-0.012512, -1.500815, -2.233035));
    d = new Data("basewins-6.022_Cube.024", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.086476, -0.457598, -2.148787));
    v.add(new PVector(-0.086476, -1.490684, -2.148787));
    v.add(new PVector(-0.220304, -1.490684, -2.148787));
    v.add(new PVector(-0.220304, -0.457598, -2.148787));
    d = new Data("basewins-6.023_Cube.025", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.220304, -0.457598, -2.148787));
    v.add(new PVector(-0.220304, -1.490684, -2.148787));
    v.add(new PVector(-0.220304, -1.490684, -2.014959));
    v.add(new PVector(-0.220304, -0.457598, -2.014959));
    d = new Data("basewins-6.024_Cube.026", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.086476, -0.457598, -2.014959));
    v.add(new PVector(-0.086476, -1.490684, -2.014959));
    v.add(new PVector(-0.086476, -1.490684, -2.148787));
    v.add(new PVector(-0.086476, -0.457598, -2.148787));
    d = new Data("basewins-6.025_Cube.027", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.265529, -0.457598, -2.148788));
    v.add(new PVector(-1.131701, -0.457598, -2.148788));
    v.add(new PVector(-1.131701, -1.490684, -2.148788));
    v.add(new PVector(-1.265529, -1.490684, -2.148788));
    d = new Data("basewins-6.026_Cube.028", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.131701, -0.457598, -2.148788));
    v.add(new PVector(-1.131701, -0.457598, -2.01496));
    v.add(new PVector(-1.131701, -1.490684, -2.01496));
    v.add(new PVector(-1.131701, -1.490684, -2.148788));
    d = new Data("basewins-6.027_Cube.029", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.265529, -0.457598, -2.01496));
    v.add(new PVector(-1.265529, -0.457598, -2.148788));
    v.add(new PVector(-1.265529, -1.490684, -2.148788));
    v.add(new PVector(-1.265529, -1.490684, -2.01496));
    d = new Data("basewins-6.028_Cube.030", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.082756, -0.492075, -2.01052));
    v.add(new PVector(-1.028956, -0.492075, -2.01052));
    v.add(new PVector(-1.028956, -1.45014, -2.01052));
    v.add(new PVector(-1.082756, -1.45014, -2.01052));
    d = new Data("basewins-6.029_Cube.031", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.975156, -0.492075, -2.01052));
    v.add(new PVector(-0.921356, -0.492075, -2.01052));
    v.add(new PVector(-0.921356, -1.45014, -2.01052));
    v.add(new PVector(-0.975156, -1.45014, -2.01052));
    d = new Data("basewins-6.030_Cube.032", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.867556, -0.492075, -2.01052));
    v.add(new PVector(-0.867556, -1.45014, -2.01052));
    v.add(new PVector(-0.813756, -1.45014, -2.01052));
    v.add(new PVector(-0.813756, -0.492075, -2.01052));
    d = new Data("basewins-6.031_Cube.033", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.759956, -0.492075, -2.01052));
    v.add(new PVector(-0.706156, -0.492075, -2.01052));
    v.add(new PVector(-0.706156, -1.45014, -2.01052));
    v.add(new PVector(-0.759956, -1.45014, -2.01052));
    d = new Data("basewins-6.032_Cube.034", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.652357, -0.492075, -2.01052));
    v.add(new PVector(-0.598557, -0.492075, -2.01052));
    v.add(new PVector(-0.598557, -1.45014, -2.01052));
    v.add(new PVector(-0.652357, -1.45014, -2.01052));
    d = new Data("basewins-6.033_Cube.035", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.544757, -0.492075, -2.01052));
    v.add(new PVector(-0.544757, -1.45014, -2.01052));
    v.add(new PVector(-0.490957, -1.45014, -2.01052));
    v.add(new PVector(-0.490957, -0.492075, -2.01052));
    d = new Data("basewins-6.034_Cube.036", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.437157, -0.492075, -2.01052));
    v.add(new PVector(-0.437157, -1.45014, -2.01052));
    v.add(new PVector(-0.383357, -1.45014, -2.01052));
    v.add(new PVector(-0.383357, -0.492075, -2.01052));
    d = new Data("basewins-6.035_Cube.037", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.329557, -0.492075, -2.01052));
    v.add(new PVector(-0.329557, -1.45014, -2.01052));
    v.add(new PVector(-0.275757, -1.45014, -2.010519));
    v.add(new PVector(-0.275757, -0.492075, -2.010519));
    d = new Data("basewins-6.036_Cube.038", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.339493, -0.345974, -2.014716));
    v.add(new PVector(-0.012512, -0.345974, -2.014716));
    v.add(new PVector(-0.012512, -0.345974, -2.233036));
    v.add(new PVector(-1.339492, -0.345974, -2.233036));
    d = new Data("basewins-6.037_Cube.039", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -0.445974, -2.014716));
    v.add(new PVector(-1.339493, -0.445974, -2.014716));
    v.add(new PVector(-1.339492, -0.445974, -2.233036));
    v.add(new PVector(-0.012512, -0.445974, -2.233036));
    d = new Data("basewins-6.038_Cube.040", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -0.345974, -2.014716));
    v.add(new PVector(-0.012512, -0.445974, -2.014716));
    v.add(new PVector(-0.012512, -0.445974, -2.233036));
    v.add(new PVector(-0.012512, -0.345974, -2.233036));
    d = new Data("basewins-6.039_Cube.041", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.500815, -1.330741));
    v.add(new PVector(2.014716, -1.500815, -0.00376));
    v.add(new PVector(2.233035, -1.500815, -0.00376));
    v.add(new PVector(2.233036, -1.500815, -1.33074));
    d = new Data("basewins-6.040_Cube.042", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.600815, -0.00376));
    v.add(new PVector(2.014716, -1.600815, -1.330741));
    v.add(new PVector(2.233036, -1.600815, -1.33074));
    v.add(new PVector(2.233035, -1.600815, -0.00376));
    d = new Data("basewins-6.041_Cube.043", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.500815, -0.00376));
    v.add(new PVector(2.014716, -1.600815, -0.00376));
    v.add(new PVector(2.233035, -1.600815, -0.00376));
    v.add(new PVector(2.233035, -1.500815, -0.00376));
    d = new Data("basewins-6.042_Cube.044", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148787, -0.457598, -0.077724));
    v.add(new PVector(2.148787, -1.490684, -0.077724));
    v.add(new PVector(2.148787, -1.490684, -0.211552));
    v.add(new PVector(2.148787, -0.457598, -0.211552));
    d = new Data("basewins-6.043_Cube.045", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148787, -0.457598, -0.211552));
    v.add(new PVector(2.148787, -1.490684, -0.211552));
    v.add(new PVector(2.014959, -1.490684, -0.211552));
    v.add(new PVector(2.014959, -0.457598, -0.211552));
    d = new Data("basewins-6.044_Cube.046", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014959, -0.457598, -0.077724));
    v.add(new PVector(2.014959, -1.490684, -0.077724));
    v.add(new PVector(2.148787, -1.490684, -0.077724));
    v.add(new PVector(2.148787, -0.457598, -0.077724));
    d = new Data("basewins-6.045_Cube.047", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148788, -0.457598, -1.256777));
    v.add(new PVector(2.148788, -0.457598, -1.122949));
    v.add(new PVector(2.148788, -1.490684, -1.122949));
    v.add(new PVector(2.148788, -1.490684, -1.256777));
    d = new Data("basewins-6.046_Cube.048", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148788, -0.457598, -1.122949));
    v.add(new PVector(2.01496, -0.457598, -1.122949));
    v.add(new PVector(2.01496, -1.490684, -1.122949));
    v.add(new PVector(2.148788, -1.490684, -1.122949));
    d = new Data("basewins-6.047_Cube.049", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01496, -0.457598, -1.256777));
    v.add(new PVector(2.148788, -0.457598, -1.256777));
    v.add(new PVector(2.148788, -1.490684, -1.256777));
    v.add(new PVector(2.01496, -1.490684, -1.256777));
    d = new Data("basewins-6.048_Cube.050", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -1.074004));
    v.add(new PVector(2.01052, -0.492075, -1.020204));
    v.add(new PVector(2.01052, -1.45014, -1.020204));
    v.add(new PVector(2.01052, -1.45014, -1.074004));
    d = new Data("basewins-6.049_Cube.051", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.966404));
    v.add(new PVector(2.01052, -0.492075, -0.912604));
    v.add(new PVector(2.01052, -1.45014, -0.912604));
    v.add(new PVector(2.01052, -1.45014, -0.966404));
    d = new Data("basewins-6.050_Cube.052", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.858804));
    v.add(new PVector(2.01052, -1.45014, -0.858804));
    v.add(new PVector(2.01052, -1.45014, -0.805004));
    v.add(new PVector(2.01052, -0.492075, -0.805004));
    d = new Data("basewins-6.051_Cube.053", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.751204));
    v.add(new PVector(2.01052, -0.492075, -0.697405));
    v.add(new PVector(2.01052, -1.45014, -0.697405));
    v.add(new PVector(2.01052, -1.45014, -0.751204));
    d = new Data("basewins-6.052_Cube.054", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.643605));
    v.add(new PVector(2.01052, -0.492075, -0.589805));
    v.add(new PVector(2.01052, -1.45014, -0.589805));
    v.add(new PVector(2.01052, -1.45014, -0.643605));
    d = new Data("basewins-6.053_Cube.055", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.536005));
    v.add(new PVector(2.01052, -1.45014, -0.536005));
    v.add(new PVector(2.01052, -1.45014, -0.482205));
    v.add(new PVector(2.01052, -0.492075, -0.482205));
    d = new Data("basewins-6.054_Cube.056", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.428405));
    v.add(new PVector(2.01052, -1.45014, -0.428405));
    v.add(new PVector(2.01052, -1.45014, -0.374605));
    v.add(new PVector(2.01052, -0.492075, -0.374605));
    d = new Data("basewins-6.055_Cube.057", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, -0.320805));
    v.add(new PVector(2.01052, -1.45014, -0.320805));
    v.add(new PVector(2.010519, -1.45014, -0.267005));
    v.add(new PVector(2.010519, -0.492075, -0.267005));
    d = new Data("basewins-6.056_Cube.058", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.345974, -1.330741));
    v.add(new PVector(2.014716, -0.345974, -0.00376));
    v.add(new PVector(2.233036, -0.345974, -0.00376));
    v.add(new PVector(2.233036, -0.345974, -1.33074));
    d = new Data("basewins-6.057_Cube.059", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.445974, -0.00376));
    v.add(new PVector(2.014716, -0.445974, -1.330741));
    v.add(new PVector(2.233036, -0.445974, -1.33074));
    v.add(new PVector(2.233036, -0.445974, -0.00376));
    d = new Data("basewins-6.058_Cube.060", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.345974, -0.00376));
    v.add(new PVector(2.014716, -0.445974, -0.00376));
    v.add(new PVector(2.233036, -0.445974, -0.00376));
    v.add(new PVector(2.233036, -0.345974, -0.00376));
    d = new Data("basewins-6.059_Cube.061", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233036, -1.500815, 1.703856));
    v.add(new PVector(-2.233036, -1.600815, 1.703856));
    v.add(new PVector(-2.014716, -1.600815, 1.703856));
    v.add(new PVector(-2.014716, -1.500815, 1.703856));
    d = new Data("basewins-6.060_Cube.062", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233035, -1.500815, 0.376876));
    v.add(new PVector(-2.233035, -1.600815, 0.376876));
    v.add(new PVector(-2.233036, -1.600815, 1.703856));
    v.add(new PVector(-2.233036, -1.500815, 1.703856));
    d = new Data("basewins-6.061_Cube.063", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233036, -0.345974, 1.703856));
    v.add(new PVector(-2.233036, -0.445974, 1.703856));
    v.add(new PVector(-2.014716, -0.445974, 1.703856));
    v.add(new PVector(-2.014716, -0.345974, 1.703856));
    d = new Data("basewins-6.062_Cube.064", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233036, -0.345974, 0.376876));
    v.add(new PVector(-2.233036, -0.445974, 0.376876));
    v.add(new PVector(-2.233036, -0.445974, 1.703856));
    v.add(new PVector(-2.233036, -0.345974, 1.703856));
    d = new Data("basewins-6.063_Cube.065", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.339492, -1.500815, -2.233036));
    v.add(new PVector(-1.339492, -1.600815, -2.233036));
    v.add(new PVector(-1.339493, -1.600815, -2.014716));
    v.add(new PVector(-1.339493, -1.500815, -2.014716));
    d = new Data("basewins-6.064_Cube.066", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -1.500815, -2.233035));
    v.add(new PVector(-0.012512, -1.600815, -2.233035));
    v.add(new PVector(-1.339492, -1.600815, -2.233036));
    v.add(new PVector(-1.339492, -1.500815, -2.233036));
    d = new Data("basewins-6.065_Cube.067", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.339492, -0.345974, -2.233036));
    v.add(new PVector(-1.339492, -0.445974, -2.233036));
    v.add(new PVector(-1.339493, -0.445974, -2.014716));
    v.add(new PVector(-1.339493, -0.345974, -2.014716));
    d = new Data("basewins-6.066_Cube.068", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.012512, -0.345974, -2.233036));
    v.add(new PVector(-0.012512, -0.445974, -2.233036));
    v.add(new PVector(-1.339492, -0.445974, -2.233036));
    v.add(new PVector(-1.339492, -0.345974, -2.233036));
    d = new Data("basewins-6.067_Cube.069", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -1.500815, -1.33074));
    v.add(new PVector(2.233036, -1.600815, -1.33074));
    v.add(new PVector(2.014716, -1.600815, -1.330741));
    v.add(new PVector(2.014716, -1.500815, -1.330741));
    d = new Data("basewins-6.068_Cube.070", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233035, -1.500815, -0.00376));
    v.add(new PVector(2.233035, -1.600815, -0.00376));
    v.add(new PVector(2.233036, -1.600815, -1.33074));
    v.add(new PVector(2.233036, -1.500815, -1.33074));
    d = new Data("basewins-6.069_Cube.071", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -0.345974, -1.33074));
    v.add(new PVector(2.233036, -0.445974, -1.33074));
    v.add(new PVector(2.014716, -0.445974, -1.330741));
    v.add(new PVector(2.014716, -0.345974, -1.330741));
    d = new Data("basewins-6.070_Cube.072", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -0.345974, -0.00376));
    v.add(new PVector(2.233036, -0.445974, -0.00376));
    v.add(new PVector(2.233036, -0.445974, -1.33074));
    v.add(new PVector(2.233036, -0.345974, -1.33074));
    d = new Data("basewins-6.071_Cube.073", 2, v);
    dd.add(d);

    win = new Win("basewins-6", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-1.104486, -0.882847, -2.013742));
    v.add(new PVector(0.185631, -0.882847, -2.013742));
    v.add(new PVector(0.185631, -1.551483, -2.013742));
    v.add(new PVector(-1.104486, -1.551483, -2.013742));
    d = new Data("basewins-7_Plane.011", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.440673, -0.917264, -2.026572));
    v.add(new PVector(0.149945, -0.917264, -2.026572));
    v.add(new PVector(0.149945, -1.51601, -2.026572));
    v.add(new PVector(-0.440673, -1.51601, -2.026572));
    d = new Data("basewins-7.001_Plane.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.069232, -0.917264, -2.026572));
    v.add(new PVector(-0.478614, -0.917264, -2.026572));
    v.add(new PVector(-0.478614, -1.51601, -2.026572));
    v.add(new PVector(-1.069232, -1.51601, -2.026572));
    d = new Data("basewins-7.002_Plane.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.013742, -0.355609, -0.37389));
    v.add(new PVector(-2.013742, -0.355609, -1.264007));
    v.add(new PVector(-2.013742, -1.551483, -1.264007));
    v.add(new PVector(-2.013742, -1.551483, -0.37389));
    d = new Data("basewins-7.003_Plane.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.026572, -0.390026, -0.837703));
    v.add(new PVector(-2.026572, -0.390026, -1.228321));
    v.add(new PVector(-2.026572, -1.51601, -1.228321));
    v.add(new PVector(-2.026572, -1.51601, -0.837703));
    d = new Data("basewins-7.004_Plane.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.026572, -0.390026, -0.409144));
    v.add(new PVector(-2.026572, -0.390026, -0.799763));
    v.add(new PVector(-2.026572, -1.51601, -0.799763));
    v.add(new PVector(-2.026572, -1.51601, -0.409144));
    d = new Data("basewins-7.005_Plane.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.011862, -0.355609, -1.264008));
    v.add(new PVector(4.011862, -0.355609, -0.373891));
    v.add(new PVector(4.011862, -1.551483, -0.373891));
    v.add(new PVector(4.011862, -1.551483, -1.264008));
    d = new Data("basewins-7.006_Plane.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.024692, -0.390026, -0.800195));
    v.add(new PVector(4.024692, -0.390026, -0.409577));
    v.add(new PVector(4.024692, -1.51601, -0.409577));
    v.add(new PVector(4.024691, -1.51601, -0.800195));
    d = new Data("basewins-7.007_Plane.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.024692, -0.390026, -1.228754));
    v.add(new PVector(4.024692, -0.390026, -0.838135));
    v.add(new PVector(4.024692, -1.51601, -0.838135));
    v.add(new PVector(4.024691, -1.51601, -1.228754));
    d = new Data("basewins-7.008_Plane.008", 1, v);
    dd.add(d);

    win = new Win("basewins-7", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.500815, 1.703856));
    v.add(new PVector(2.014716, -1.500815, 0.376876));
    v.add(new PVector(2.233035, -1.500815, 0.376876));
    v.add(new PVector(2.233036, -1.500815, 1.703856));
    d = new Data("basewins-8_Cube.015", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.600815, 0.376876));
    v.add(new PVector(2.014716, -1.600815, 1.703856));
    v.add(new PVector(2.233036, -1.600815, 1.703856));
    v.add(new PVector(2.233035, -1.600815, 0.376876));
    d = new Data("basewins-8.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.500815, 0.376876));
    v.add(new PVector(2.014716, -1.600815, 0.376876));
    v.add(new PVector(2.233035, -1.600815, 0.376876));
    v.add(new PVector(2.233035, -1.500815, 0.376876));
    d = new Data("basewins-8.002_Cube.002", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148787, -0.457598, 0.45084));
    v.add(new PVector(2.148787, -1.490684, 0.45084));
    v.add(new PVector(2.148787, -1.490684, 0.584667));
    v.add(new PVector(2.148787, -0.457598, 0.584667));
    d = new Data("basewins-8.003_Cube.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148787, -0.457598, 0.584667));
    v.add(new PVector(2.148787, -1.490684, 0.584667));
    v.add(new PVector(2.014959, -1.490684, 0.584668));
    v.add(new PVector(2.014959, -0.457598, 0.584668));
    d = new Data("basewins-8.004_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014959, -0.457598, 0.45084));
    v.add(new PVector(2.014959, -1.490684, 0.45084));
    v.add(new PVector(2.148787, -1.490684, 0.45084));
    v.add(new PVector(2.148787, -0.457598, 0.45084));
    d = new Data("basewins-8.005_Cube.005", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148788, -0.457598, 1.629892));
    v.add(new PVector(2.148788, -0.457598, 1.496064));
    v.add(new PVector(2.148788, -1.490684, 1.496064));
    v.add(new PVector(2.148788, -1.490684, 1.629892));
    d = new Data("basewins-8.006_Cube.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148788, -0.457598, 1.496064));
    v.add(new PVector(2.01496, -0.457598, 1.496064));
    v.add(new PVector(2.01496, -1.490684, 1.496064));
    v.add(new PVector(2.148788, -1.490684, 1.496064));
    d = new Data("basewins-8.007_Cube.007", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01496, -0.457598, 1.629892));
    v.add(new PVector(2.148788, -0.457598, 1.629892));
    v.add(new PVector(2.148788, -1.490684, 1.629892));
    v.add(new PVector(2.01496, -1.490684, 1.629892));
    d = new Data("basewins-8.008_Cube.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.447119));
    v.add(new PVector(2.01052, -1.45014, 1.447119));
    v.add(new PVector(2.01052, -1.45014, 1.39332));
    v.add(new PVector(2.01052, -0.492075, 1.39332));
    d = new Data("basewins-8.009_Cube.010", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.33952));
    v.add(new PVector(2.01052, -0.492075, 1.28572));
    v.add(new PVector(2.01052, -1.45014, 1.28572));
    v.add(new PVector(2.01052, -1.45014, 1.33952));
    d = new Data("basewins-8.010_Cube.011", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.23192));
    v.add(new PVector(2.01052, -1.45014, 1.23192));
    v.add(new PVector(2.01052, -1.45014, 1.17812));
    v.add(new PVector(2.01052, -0.492075, 1.17812));
    d = new Data("basewins-8.011_Cube.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.12432));
    v.add(new PVector(2.01052, -0.492075, 1.07052));
    v.add(new PVector(2.01052, -1.45014, 1.07052));
    v.add(new PVector(2.01052, -1.45014, 1.12432));
    d = new Data("basewins-8.012_Cube.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.01672));
    v.add(new PVector(2.01052, -0.492075, 0.96292));
    v.add(new PVector(2.01052, -1.45014, 0.96292));
    v.add(new PVector(2.01052, -1.45014, 1.01672));
    d = new Data("basewins-8.013_Cube.014", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 0.90912));
    v.add(new PVector(2.01052, -1.45014, 0.90912));
    v.add(new PVector(2.01052, -1.45014, 0.85532));
    v.add(new PVector(2.01052, -0.492075, 0.85532));
    d = new Data("basewins-8.014_Cube.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 0.801521));
    v.add(new PVector(2.01052, -1.45014, 0.801521));
    v.add(new PVector(2.01052, -1.45014, 0.74772));
    v.add(new PVector(2.01052, -0.492075, 0.74772));
    d = new Data("basewins-8.015_Cube.017", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 0.693921));
    v.add(new PVector(2.010519, -0.492075, 0.640121));
    v.add(new PVector(2.010519, -1.45014, 0.640121));
    v.add(new PVector(2.01052, -1.45014, 0.693921));
    d = new Data("basewins-8.016_Cube.018", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.345974, 1.703856));
    v.add(new PVector(2.014716, -0.345974, 0.376876));
    v.add(new PVector(2.233036, -0.345974, 0.376876));
    v.add(new PVector(2.233036, -0.345974, 1.703856));
    d = new Data("basewins-8.017_Cube.019", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.445974, 0.376876));
    v.add(new PVector(2.014716, -0.445974, 1.703856));
    v.add(new PVector(2.233036, -0.445974, 1.703856));
    v.add(new PVector(2.233036, -0.445974, 0.376876));
    d = new Data("basewins-8.018_Cube.020", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.345974, 0.376876));
    v.add(new PVector(2.014716, -0.445974, 0.376876));
    v.add(new PVector(2.233036, -0.445974, 0.376876));
    v.add(new PVector(2.233036, -0.345974, 0.376876));
    d = new Data("basewins-8.019_Cube.021", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.339493, -1.500815, -2.014716));
    v.add(new PVector(0.012512, -1.500815, -2.014716));
    v.add(new PVector(0.012512, -1.500815, -2.233035));
    v.add(new PVector(1.339492, -1.500815, -2.233036));
    d = new Data("basewins-8.020_Cube.022", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.012512, -1.600815, -2.014716));
    v.add(new PVector(1.339493, -1.600815, -2.014716));
    v.add(new PVector(1.339492, -1.600815, -2.233036));
    v.add(new PVector(0.012512, -1.600815, -2.233035));
    d = new Data("basewins-8.021_Cube.023", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.012512, -1.500815, -2.014716));
    v.add(new PVector(0.012512, -1.600815, -2.014716));
    v.add(new PVector(0.012512, -1.600815, -2.233035));
    v.add(new PVector(0.012512, -1.500815, -2.233035));
    d = new Data("basewins-8.022_Cube.024", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.086476, -0.457598, -2.148787));
    v.add(new PVector(0.086476, -1.490684, -2.148787));
    v.add(new PVector(0.220304, -1.490684, -2.148787));
    v.add(new PVector(0.220304, -0.457598, -2.148787));
    d = new Data("basewins-8.023_Cube.025", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.220304, -0.457598, -2.148787));
    v.add(new PVector(0.220304, -1.490684, -2.148787));
    v.add(new PVector(0.220304, -1.490684, -2.014959));
    v.add(new PVector(0.220304, -0.457598, -2.014959));
    d = new Data("basewins-8.024_Cube.026", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.086476, -0.457598, -2.014959));
    v.add(new PVector(0.086476, -1.490684, -2.014959));
    v.add(new PVector(0.086476, -1.490684, -2.148787));
    v.add(new PVector(0.086476, -0.457598, -2.148787));
    d = new Data("basewins-8.025_Cube.027", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.265529, -0.457598, -2.148788));
    v.add(new PVector(1.131701, -0.457598, -2.148788));
    v.add(new PVector(1.131701, -1.490684, -2.148788));
    v.add(new PVector(1.265529, -1.490684, -2.148788));
    d = new Data("basewins-8.026_Cube.028", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.131701, -0.457598, -2.148788));
    v.add(new PVector(1.131701, -0.457598, -2.01496));
    v.add(new PVector(1.131701, -1.490684, -2.01496));
    v.add(new PVector(1.131701, -1.490684, -2.148788));
    d = new Data("basewins-8.027_Cube.029", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.265529, -0.457598, -2.01496));
    v.add(new PVector(1.265529, -0.457598, -2.148788));
    v.add(new PVector(1.265529, -1.490684, -2.148788));
    v.add(new PVector(1.265529, -1.490684, -2.01496));
    d = new Data("basewins-8.028_Cube.030", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.082756, -0.492075, -2.01052));
    v.add(new PVector(1.028956, -0.492075, -2.01052));
    v.add(new PVector(1.028956, -1.45014, -2.01052));
    v.add(new PVector(1.082756, -1.45014, -2.01052));
    d = new Data("basewins-8.029_Cube.031", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.975156, -0.492075, -2.01052));
    v.add(new PVector(0.921356, -0.492075, -2.01052));
    v.add(new PVector(0.921356, -1.45014, -2.01052));
    v.add(new PVector(0.975156, -1.45014, -2.01052));
    d = new Data("basewins-8.030_Cube.032", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.867556, -0.492075, -2.01052));
    v.add(new PVector(0.867556, -1.45014, -2.01052));
    v.add(new PVector(0.813756, -1.45014, -2.01052));
    v.add(new PVector(0.813756, -0.492075, -2.01052));
    d = new Data("basewins-8.031_Cube.033", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.759956, -0.492075, -2.01052));
    v.add(new PVector(0.706156, -0.492075, -2.01052));
    v.add(new PVector(0.706156, -1.45014, -2.01052));
    v.add(new PVector(0.759956, -1.45014, -2.01052));
    d = new Data("basewins-8.032_Cube.034", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.652357, -0.492075, -2.01052));
    v.add(new PVector(0.598557, -0.492075, -2.01052));
    v.add(new PVector(0.598557, -1.45014, -2.01052));
    v.add(new PVector(0.652357, -1.45014, -2.01052));
    d = new Data("basewins-8.033_Cube.035", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.544757, -0.492075, -2.01052));
    v.add(new PVector(0.544757, -1.45014, -2.01052));
    v.add(new PVector(0.490957, -1.45014, -2.01052));
    v.add(new PVector(0.490957, -0.492075, -2.01052));
    d = new Data("basewins-8.034_Cube.036", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.437157, -0.492075, -2.01052));
    v.add(new PVector(0.437157, -1.45014, -2.01052));
    v.add(new PVector(0.383357, -1.45014, -2.01052));
    v.add(new PVector(0.383357, -0.492075, -2.01052));
    d = new Data("basewins-8.035_Cube.037", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.329557, -0.492075, -2.01052));
    v.add(new PVector(0.329557, -1.45014, -2.01052));
    v.add(new PVector(0.275757, -1.45014, -2.010519));
    v.add(new PVector(0.275757, -0.492075, -2.010519));
    d = new Data("basewins-8.036_Cube.038", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.339493, -0.345974, -2.014716));
    v.add(new PVector(0.012512, -0.345974, -2.014716));
    v.add(new PVector(0.012512, -0.345974, -2.233036));
    v.add(new PVector(1.339492, -0.345974, -2.233036));
    d = new Data("basewins-8.037_Cube.039", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.012512, -0.445974, -2.014716));
    v.add(new PVector(1.339493, -0.445974, -2.014716));
    v.add(new PVector(1.339492, -0.445974, -2.233036));
    v.add(new PVector(0.012512, -0.445974, -2.233036));
    d = new Data("basewins-8.038_Cube.040", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.012512, -0.345974, -2.014716));
    v.add(new PVector(0.012512, -0.445974, -2.014716));
    v.add(new PVector(0.012512, -0.445974, -2.233036));
    v.add(new PVector(0.012512, -0.345974, -2.233036));
    d = new Data("basewins-8.039_Cube.041", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -1.500815, -1.330741));
    v.add(new PVector(-2.014716, -1.500815, -0.00376));
    v.add(new PVector(-2.233035, -1.500815, -0.00376));
    v.add(new PVector(-2.233036, -1.500815, -1.33074));
    d = new Data("basewins-8.040_Cube.042", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -1.600815, -0.00376));
    v.add(new PVector(-2.014716, -1.600815, -1.330741));
    v.add(new PVector(-2.233036, -1.600815, -1.33074));
    v.add(new PVector(-2.233035, -1.600815, -0.00376));
    d = new Data("basewins-8.041_Cube.043", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -1.500815, -0.00376));
    v.add(new PVector(-2.014716, -1.600815, -0.00376));
    v.add(new PVector(-2.233035, -1.600815, -0.00376));
    v.add(new PVector(-2.233035, -1.500815, -0.00376));
    d = new Data("basewins-8.042_Cube.044", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148787, -0.457598, -0.077724));
    v.add(new PVector(-2.148787, -1.490684, -0.077724));
    v.add(new PVector(-2.148787, -1.490684, -0.211552));
    v.add(new PVector(-2.148787, -0.457598, -0.211552));
    d = new Data("basewins-8.043_Cube.045", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148787, -0.457598, -0.211552));
    v.add(new PVector(-2.148787, -1.490684, -0.211552));
    v.add(new PVector(-2.014959, -1.490684, -0.211552));
    v.add(new PVector(-2.014959, -0.457598, -0.211552));
    d = new Data("basewins-8.044_Cube.046", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014959, -0.457598, -0.077724));
    v.add(new PVector(-2.014959, -1.490684, -0.077724));
    v.add(new PVector(-2.148787, -1.490684, -0.077724));
    v.add(new PVector(-2.148787, -0.457598, -0.077724));
    d = new Data("basewins-8.045_Cube.047", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148788, -0.457598, -1.256777));
    v.add(new PVector(-2.148788, -0.457598, -1.122949));
    v.add(new PVector(-2.148788, -1.490684, -1.122949));
    v.add(new PVector(-2.148788, -1.490684, -1.256777));
    d = new Data("basewins-8.046_Cube.048", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.148788, -0.457598, -1.122949));
    v.add(new PVector(-2.01496, -0.457598, -1.122949));
    v.add(new PVector(-2.01496, -1.490684, -1.122949));
    v.add(new PVector(-2.148788, -1.490684, -1.122949));
    d = new Data("basewins-8.047_Cube.049", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01496, -0.457598, -1.256777));
    v.add(new PVector(-2.148788, -0.457598, -1.256777));
    v.add(new PVector(-2.148788, -1.490684, -1.256777));
    v.add(new PVector(-2.01496, -1.490684, -1.256777));
    d = new Data("basewins-8.048_Cube.050", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -1.074004));
    v.add(new PVector(-2.01052, -0.492075, -1.020204));
    v.add(new PVector(-2.01052, -1.45014, -1.020204));
    v.add(new PVector(-2.01052, -1.45014, -1.074004));
    d = new Data("basewins-8.049_Cube.051", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.966404));
    v.add(new PVector(-2.01052, -0.492075, -0.912604));
    v.add(new PVector(-2.01052, -1.45014, -0.912604));
    v.add(new PVector(-2.01052, -1.45014, -0.966404));
    d = new Data("basewins-8.050_Cube.052", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.858804));
    v.add(new PVector(-2.01052, -1.45014, -0.858804));
    v.add(new PVector(-2.01052, -1.45014, -0.805004));
    v.add(new PVector(-2.01052, -0.492075, -0.805004));
    d = new Data("basewins-8.051_Cube.053", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.751204));
    v.add(new PVector(-2.01052, -0.492075, -0.697405));
    v.add(new PVector(-2.01052, -1.45014, -0.697405));
    v.add(new PVector(-2.01052, -1.45014, -0.751204));
    d = new Data("basewins-8.052_Cube.054", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.643605));
    v.add(new PVector(-2.01052, -0.492075, -0.589805));
    v.add(new PVector(-2.01052, -1.45014, -0.589805));
    v.add(new PVector(-2.01052, -1.45014, -0.643605));
    d = new Data("basewins-8.053_Cube.055", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.536005));
    v.add(new PVector(-2.01052, -1.45014, -0.536005));
    v.add(new PVector(-2.01052, -1.45014, -0.482205));
    v.add(new PVector(-2.01052, -0.492075, -0.482205));
    d = new Data("basewins-8.054_Cube.056", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.428405));
    v.add(new PVector(-2.01052, -1.45014, -0.428405));
    v.add(new PVector(-2.01052, -1.45014, -0.374605));
    v.add(new PVector(-2.01052, -0.492075, -0.374605));
    d = new Data("basewins-8.055_Cube.057", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.01052, -0.492075, -0.320805));
    v.add(new PVector(-2.01052, -1.45014, -0.320805));
    v.add(new PVector(-2.010519, -1.45014, -0.267005));
    v.add(new PVector(-2.010519, -0.492075, -0.267005));
    d = new Data("basewins-8.056_Cube.058", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -0.345974, -1.330741));
    v.add(new PVector(-2.014716, -0.345974, -0.00376));
    v.add(new PVector(-2.233036, -0.345974, -0.00376));
    v.add(new PVector(-2.233036, -0.345974, -1.33074));
    d = new Data("basewins-8.057_Cube.059", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -0.445974, -0.00376));
    v.add(new PVector(-2.014716, -0.445974, -1.330741));
    v.add(new PVector(-2.233036, -0.445974, -1.33074));
    v.add(new PVector(-2.233036, -0.445974, -0.00376));
    d = new Data("basewins-8.058_Cube.060", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.014716, -0.345974, -0.00376));
    v.add(new PVector(-2.014716, -0.445974, -0.00376));
    v.add(new PVector(-2.233036, -0.445974, -0.00376));
    v.add(new PVector(-2.233036, -0.345974, -0.00376));
    d = new Data("basewins-8.059_Cube.061", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -1.500815, 1.703856));
    v.add(new PVector(2.233036, -1.600815, 1.703856));
    v.add(new PVector(2.014716, -1.600815, 1.703856));
    v.add(new PVector(2.014716, -1.500815, 1.703856));
    d = new Data("basewins-8.060_Cube.062", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233035, -1.500815, 0.376876));
    v.add(new PVector(2.233035, -1.600815, 0.376876));
    v.add(new PVector(2.233036, -1.600815, 1.703856));
    v.add(new PVector(2.233036, -1.500815, 1.703856));
    d = new Data("basewins-8.061_Cube.063", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -0.345974, 1.703856));
    v.add(new PVector(2.233036, -0.445974, 1.703856));
    v.add(new PVector(2.014716, -0.445974, 1.703856));
    v.add(new PVector(2.014716, -0.345974, 1.703856));
    d = new Data("basewins-8.062_Cube.064", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -0.345974, 0.376876));
    v.add(new PVector(2.233036, -0.445974, 0.376876));
    v.add(new PVector(2.233036, -0.445974, 1.703856));
    v.add(new PVector(2.233036, -0.345974, 1.703856));
    d = new Data("basewins-8.063_Cube.065", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.339492, -1.500815, -2.233036));
    v.add(new PVector(1.339492, -1.600815, -2.233036));
    v.add(new PVector(1.339493, -1.600815, -2.014716));
    v.add(new PVector(1.339493, -1.500815, -2.014716));
    d = new Data("basewins-8.064_Cube.066", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.012512, -1.500815, -2.233035));
    v.add(new PVector(0.012512, -1.600815, -2.233035));
    v.add(new PVector(1.339492, -1.600815, -2.233036));
    v.add(new PVector(1.339492, -1.500815, -2.233036));
    d = new Data("basewins-8.065_Cube.067", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.339492, -0.345974, -2.233036));
    v.add(new PVector(1.339492, -0.445974, -2.233036));
    v.add(new PVector(1.339493, -0.445974, -2.014716));
    v.add(new PVector(1.339493, -0.345974, -2.014716));
    d = new Data("basewins-8.066_Cube.068", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.012512, -0.345974, -2.233036));
    v.add(new PVector(0.012512, -0.445974, -2.233036));
    v.add(new PVector(1.339492, -0.445974, -2.233036));
    v.add(new PVector(1.339492, -0.345974, -2.233036));
    d = new Data("basewins-8.067_Cube.069", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233036, -1.500815, -1.33074));
    v.add(new PVector(-2.233036, -1.600815, -1.33074));
    v.add(new PVector(-2.014716, -1.600815, -1.330741));
    v.add(new PVector(-2.014716, -1.500815, -1.330741));
    d = new Data("basewins-8.068_Cube.070", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233035, -1.500815, -0.00376));
    v.add(new PVector(-2.233035, -1.600815, -0.00376));
    v.add(new PVector(-2.233036, -1.600815, -1.33074));
    v.add(new PVector(-2.233036, -1.500815, -1.33074));
    d = new Data("basewins-8.069_Cube.071", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233036, -0.345974, -1.33074));
    v.add(new PVector(-2.233036, -0.445974, -1.33074));
    v.add(new PVector(-2.014716, -0.445974, -1.330741));
    v.add(new PVector(-2.014716, -0.345974, -1.330741));
    d = new Data("basewins-8.070_Cube.072", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.233036, -0.345974, -0.00376));
    v.add(new PVector(-2.233036, -0.445974, -0.00376));
    v.add(new PVector(-2.233036, -0.445974, -1.33074));
    v.add(new PVector(-2.233036, -0.345974, -1.33074));
    d = new Data("basewins-8.071_Cube.073", 4, v);
    dd.add(d);

    win = new Win("basewins-8", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-3.310514, -0.882847, -2.013742));
    v.add(new PVector(-2.020397, -0.882847, -2.013742));
    v.add(new PVector(-2.020397, -1.551483, -2.013742));
    v.add(new PVector(-3.310514, -1.551483, -2.013742));
    d = new Data("basewins-9_Plane.012", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.646701, -0.917264, -2.026572));
    v.add(new PVector(-2.056083, -0.917264, -2.026572));
    v.add(new PVector(-2.056083, -1.51601, -2.026572));
    v.add(new PVector(-2.646701, -1.51601, -2.026572));
    d = new Data("basewins-9.001_Plane.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.275259, -0.917264, -2.026572));
    v.add(new PVector(-2.684641, -0.917264, -2.026572));
    v.add(new PVector(-2.684641, -1.51601, -2.026572));
    v.add(new PVector(-3.275259, -1.51601, -2.026572));
    d = new Data("basewins-9.002_Plane.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.009762, -0.355609, -0.37389));
    v.add(new PVector(-4.009762, -0.355609, -1.264007));
    v.add(new PVector(-4.009762, -1.551483, -1.264007));
    v.add(new PVector(-4.009762, -1.551483, -0.37389));
    d = new Data("basewins-9.003_Plane.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.022592, -0.390026, -0.837703));
    v.add(new PVector(-4.022592, -0.390026, -1.228321));
    v.add(new PVector(-4.022592, -1.51601, -1.228321));
    v.add(new PVector(-4.022592, -1.51601, -0.837703));
    d = new Data("basewins-9.004_Plane.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.022592, -0.390026, -0.409144));
    v.add(new PVector(-4.022592, -0.390026, -0.799763));
    v.add(new PVector(-4.022592, -1.51601, -0.799763));
    v.add(new PVector(-4.022592, -1.51601, -0.409144));
    d = new Data("basewins-9.005_Plane.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.011862, -0.355609, -1.264008));
    v.add(new PVector(4.011862, -0.355609, -0.373891));
    v.add(new PVector(4.011862, -1.551483, -0.373891));
    v.add(new PVector(4.011862, -1.551483, -1.264008));
    d = new Data("basewins-9.006_Plane.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.024692, -0.390026, -0.800195));
    v.add(new PVector(4.024692, -0.390026, -0.409577));
    v.add(new PVector(4.024692, -1.51601, -0.409577));
    v.add(new PVector(4.024691, -1.51601, -0.800195));
    d = new Data("basewins-9.007_Plane.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.024692, -0.390026, -1.228754));
    v.add(new PVector(4.024692, -0.390026, -0.838135));
    v.add(new PVector(4.024692, -1.51601, -0.838135));
    v.add(new PVector(4.024691, -1.51601, -1.228754));
    d = new Data("basewins-9.008_Plane.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.012884, -0.882847, -2.013742));
    v.add(new PVector(3.303001, -0.882847, -2.013742));
    v.add(new PVector(3.303001, -1.551483, -2.013742));
    v.add(new PVector(2.012884, -1.551483, -2.013742));
    d = new Data("basewins-9.009_Plane.009", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.676697, -0.917264, -2.026572));
    v.add(new PVector(3.267315, -0.917264, -2.026572));
    v.add(new PVector(3.267315, -1.51601, -2.026572));
    v.add(new PVector(2.676697, -1.51601, -2.026572));
    d = new Data("basewins-9.010_Plane.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.048139, -0.917264, -2.026572));
    v.add(new PVector(2.638757, -0.917264, -2.026572));
    v.add(new PVector(2.638757, -1.51601, -2.026572));
    v.add(new PVector(2.048139, -1.51601, -2.026572));
    d = new Data("basewins-9.011_Plane.011", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.015004, -1.230669, 0.339317));
    v.add(new PVector(2.015004, -1.230669, 0.729936));
    v.add(new PVector(2.015004, -1.51601, 0.729936));
    v.add(new PVector(2.015003, -1.51601, 0.339317));
    d = new Data("basewins-9.012_Plane.013", 1, v);
    dd.add(d);

    win = new Win("basewins-9", dd);
    p.add(win);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.500815, 1.703856));
    v.add(new PVector(2.014716, -1.500815, 0.376876));
    v.add(new PVector(2.233035, -1.500815, 0.376876));
    v.add(new PVector(2.233036, -1.500815, 1.703856));
    d = new Data("basewins-10_Cube.016", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.600815, 0.376876));
    v.add(new PVector(2.014716, -1.600815, 1.703856));
    v.add(new PVector(2.233036, -1.600815, 1.703856));
    v.add(new PVector(2.233035, -1.600815, 0.376876));
    d = new Data("basewins-10.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -1.500815, 0.376876));
    v.add(new PVector(2.014716, -1.600815, 0.376876));
    v.add(new PVector(2.233035, -1.600815, 0.376876));
    v.add(new PVector(2.233035, -1.500815, 0.376876));
    d = new Data("basewins-10.002_Cube.002", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148787, -0.457598, 0.45084));
    v.add(new PVector(2.148787, -1.490684, 0.45084));
    v.add(new PVector(2.148787, -1.490684, 0.584667));
    v.add(new PVector(2.148787, -0.457598, 0.584667));
    d = new Data("basewins-10.003_Cube.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148787, -0.457598, 0.584667));
    v.add(new PVector(2.148787, -1.490684, 0.584667));
    v.add(new PVector(2.014959, -1.490684, 0.584668));
    v.add(new PVector(2.014959, -0.457598, 0.584668));
    d = new Data("basewins-10.004_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014959, -0.457598, 0.45084));
    v.add(new PVector(2.014959, -1.490684, 0.45084));
    v.add(new PVector(2.148787, -1.490684, 0.45084));
    v.add(new PVector(2.148787, -0.457598, 0.45084));
    d = new Data("basewins-10.005_Cube.005", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148788, -0.457598, 1.629892));
    v.add(new PVector(2.148788, -0.457598, 1.496064));
    v.add(new PVector(2.148788, -1.490684, 1.496064));
    v.add(new PVector(2.148788, -1.490684, 1.629892));
    d = new Data("basewins-10.006_Cube.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.148788, -0.457598, 1.496064));
    v.add(new PVector(2.01496, -0.457598, 1.496064));
    v.add(new PVector(2.01496, -1.490684, 1.496064));
    v.add(new PVector(2.148788, -1.490684, 1.496064));
    d = new Data("basewins-10.007_Cube.007", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01496, -0.457598, 1.629892));
    v.add(new PVector(2.148788, -0.457598, 1.629892));
    v.add(new PVector(2.148788, -1.490684, 1.629892));
    v.add(new PVector(2.01496, -1.490684, 1.629892));
    d = new Data("basewins-10.008_Cube.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.447119));
    v.add(new PVector(2.01052, -1.45014, 1.447119));
    v.add(new PVector(2.01052, -1.45014, 1.39332));
    v.add(new PVector(2.01052, -0.492075, 1.39332));
    d = new Data("basewins-10.009_Cube.010", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.33952));
    v.add(new PVector(2.01052, -0.492075, 1.28572));
    v.add(new PVector(2.01052, -1.45014, 1.28572));
    v.add(new PVector(2.01052, -1.45014, 1.33952));
    d = new Data("basewins-10.010_Cube.011", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.23192));
    v.add(new PVector(2.01052, -1.45014, 1.23192));
    v.add(new PVector(2.01052, -1.45014, 1.17812));
    v.add(new PVector(2.01052, -0.492075, 1.17812));
    d = new Data("basewins-10.011_Cube.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.12432));
    v.add(new PVector(2.01052, -0.492075, 1.07052));
    v.add(new PVector(2.01052, -1.45014, 1.07052));
    v.add(new PVector(2.01052, -1.45014, 1.12432));
    d = new Data("basewins-10.012_Cube.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 1.01672));
    v.add(new PVector(2.01052, -0.492075, 0.96292));
    v.add(new PVector(2.01052, -1.45014, 0.96292));
    v.add(new PVector(2.01052, -1.45014, 1.01672));
    d = new Data("basewins-10.013_Cube.014", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 0.90912));
    v.add(new PVector(2.01052, -1.45014, 0.90912));
    v.add(new PVector(2.01052, -1.45014, 0.85532));
    v.add(new PVector(2.01052, -0.492075, 0.85532));
    d = new Data("basewins-10.014_Cube.015", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 0.801521));
    v.add(new PVector(2.01052, -1.45014, 0.801521));
    v.add(new PVector(2.01052, -1.45014, 0.74772));
    v.add(new PVector(2.01052, -0.492075, 0.74772));
    d = new Data("basewins-10.015_Cube.017", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.01052, -0.492075, 0.693921));
    v.add(new PVector(2.010519, -0.492075, 0.640121));
    v.add(new PVector(2.010519, -1.45014, 0.640121));
    v.add(new PVector(2.01052, -1.45014, 0.693921));
    d = new Data("basewins-10.016_Cube.018", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.345974, 1.703856));
    v.add(new PVector(2.014716, -0.345974, 0.376876));
    v.add(new PVector(2.233036, -0.345974, 0.376876));
    v.add(new PVector(2.233036, -0.345974, 1.703856));
    d = new Data("basewins-10.017_Cube.019", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.445974, 0.376876));
    v.add(new PVector(2.014716, -0.445974, 1.703856));
    v.add(new PVector(2.233036, -0.445974, 1.703856));
    v.add(new PVector(2.233036, -0.445974, 0.376876));
    d = new Data("basewins-10.018_Cube.020", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.014716, -0.345974, 0.376876));
    v.add(new PVector(2.014716, -0.445974, 0.376876));
    v.add(new PVector(2.233036, -0.445974, 0.376876));
    v.add(new PVector(2.233036, -0.345974, 0.376876));
    d = new Data("basewins-10.019_Cube.021", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.977642, -1.500815, -2.014716));
    v.add(new PVector(1.650661, -1.500815, -2.014716));
    v.add(new PVector(1.650661, -1.500815, -2.233035));
    v.add(new PVector(2.977642, -1.500815, -2.233036));
    d = new Data("basewins-10.020_Cube.022", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.650661, -1.600815, -2.014716));
    v.add(new PVector(2.977642, -1.600815, -2.014716));
    v.add(new PVector(2.977642, -1.600815, -2.233036));
    v.add(new PVector(1.650661, -1.600815, -2.233035));
    d = new Data("basewins-10.021_Cube.023", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.650661, -1.500815, -2.014716));
    v.add(new PVector(1.650661, -1.600815, -2.014716));
    v.add(new PVector(1.650661, -1.600815, -2.233035));
    v.add(new PVector(1.650661, -1.500815, -2.233035));
    d = new Data("basewins-10.022_Cube.024", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.724625, -0.457598, -2.148787));
    v.add(new PVector(1.724625, -1.490684, -2.148787));
    v.add(new PVector(1.858453, -1.490684, -2.148787));
    v.add(new PVector(1.858453, -0.457598, -2.148787));
    d = new Data("basewins-10.023_Cube.025", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.858453, -0.457598, -2.148787));
    v.add(new PVector(1.858453, -1.490684, -2.148787));
    v.add(new PVector(1.858453, -1.490684, -2.014959));
    v.add(new PVector(1.858453, -0.457598, -2.014959));
    d = new Data("basewins-10.024_Cube.026", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.724625, -0.457598, -2.014959));
    v.add(new PVector(1.724625, -1.490684, -2.014959));
    v.add(new PVector(1.724625, -1.490684, -2.148787));
    v.add(new PVector(1.724625, -0.457598, -2.148787));
    d = new Data("basewins-10.025_Cube.027", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.903678, -0.457598, -2.148788));
    v.add(new PVector(2.76985, -0.457598, -2.148788));
    v.add(new PVector(2.76985, -1.490684, -2.148788));
    v.add(new PVector(2.903678, -1.490684, -2.148788));
    d = new Data("basewins-10.026_Cube.028", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.76985, -0.457598, -2.148788));
    v.add(new PVector(2.76985, -0.457598, -2.01496));
    v.add(new PVector(2.76985, -1.490684, -2.01496));
    v.add(new PVector(2.76985, -1.490684, -2.148788));
    d = new Data("basewins-10.027_Cube.029", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.903678, -0.457598, -2.01496));
    v.add(new PVector(2.903678, -0.457598, -2.148788));
    v.add(new PVector(2.903678, -1.490684, -2.148788));
    v.add(new PVector(2.903678, -1.490684, -2.01496));
    d = new Data("basewins-10.028_Cube.030", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.720905, -0.492075, -2.01052));
    v.add(new PVector(2.667105, -0.492075, -2.01052));
    v.add(new PVector(2.667105, -1.45014, -2.01052));
    v.add(new PVector(2.720905, -1.45014, -2.01052));
    d = new Data("basewins-10.029_Cube.031", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.613305, -0.492075, -2.01052));
    v.add(new PVector(2.559505, -0.492075, -2.01052));
    v.add(new PVector(2.559505, -1.45014, -2.01052));
    v.add(new PVector(2.613305, -1.45014, -2.01052));
    d = new Data("basewins-10.030_Cube.032", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.505705, -0.492075, -2.01052));
    v.add(new PVector(2.505705, -1.45014, -2.01052));
    v.add(new PVector(2.451906, -1.45014, -2.01052));
    v.add(new PVector(2.451906, -0.492075, -2.01052));
    d = new Data("basewins-10.031_Cube.033", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.398106, -0.492075, -2.01052));
    v.add(new PVector(2.344306, -0.492075, -2.01052));
    v.add(new PVector(2.344306, -1.45014, -2.01052));
    v.add(new PVector(2.398106, -1.45014, -2.01052));
    d = new Data("basewins-10.032_Cube.034", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.290506, -0.492075, -2.01052));
    v.add(new PVector(2.236706, -0.492075, -2.01052));
    v.add(new PVector(2.236706, -1.45014, -2.01052));
    v.add(new PVector(2.290506, -1.45014, -2.01052));
    d = new Data("basewins-10.033_Cube.035", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.182906, -0.492075, -2.01052));
    v.add(new PVector(2.182906, -1.45014, -2.01052));
    v.add(new PVector(2.129106, -1.45014, -2.01052));
    v.add(new PVector(2.129106, -0.492075, -2.01052));
    d = new Data("basewins-10.034_Cube.036", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.075306, -0.492075, -2.01052));
    v.add(new PVector(2.075306, -1.45014, -2.01052));
    v.add(new PVector(2.021506, -1.45014, -2.01052));
    v.add(new PVector(2.021506, -0.492075, -2.01052));
    d = new Data("basewins-10.035_Cube.037", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.967706, -0.492075, -2.01052));
    v.add(new PVector(1.967706, -1.45014, -2.01052));
    v.add(new PVector(1.913906, -1.45014, -2.010519));
    v.add(new PVector(1.913906, -0.492075, -2.010519));
    d = new Data("basewins-10.036_Cube.038", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.977642, -0.345974, -2.014716));
    v.add(new PVector(1.650661, -0.345974, -2.014716));
    v.add(new PVector(1.650661, -0.345974, -2.233036));
    v.add(new PVector(2.977642, -0.345974, -2.233036));
    d = new Data("basewins-10.037_Cube.039", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.650661, -0.445974, -2.014716));
    v.add(new PVector(2.977642, -0.445974, -2.014716));
    v.add(new PVector(2.977642, -0.445974, -2.233036));
    v.add(new PVector(1.650661, -0.445974, -2.233036));
    d = new Data("basewins-10.038_Cube.040", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.650661, -0.345974, -2.014716));
    v.add(new PVector(1.650661, -0.445974, -2.014716));
    v.add(new PVector(1.650661, -0.445974, -2.233036));
    v.add(new PVector(1.650661, -0.345974, -2.233036));
    d = new Data("basewins-10.039_Cube.041", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.011861, -1.500815, -1.645769));
    v.add(new PVector(-4.01186, -1.500815, -0.318789));
    v.add(new PVector(-4.23018, -1.500815, -0.318789));
    v.add(new PVector(-4.230181, -1.500815, -1.645769));
    d = new Data("basewins-10.040_Cube.042", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.01186, -1.600815, -0.318789));
    v.add(new PVector(-4.011861, -1.600815, -1.645769));
    v.add(new PVector(-4.230181, -1.600815, -1.645769));
    v.add(new PVector(-4.23018, -1.600815, -0.318789));
    d = new Data("basewins-10.041_Cube.043", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.01186, -1.500815, -0.318789));
    v.add(new PVector(-4.01186, -1.600815, -0.318789));
    v.add(new PVector(-4.23018, -1.600815, -0.318789));
    v.add(new PVector(-4.23018, -1.500815, -0.318789));
    d = new Data("basewins-10.042_Cube.044", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.145933, -0.457598, -0.392753));
    v.add(new PVector(-4.145933, -1.490684, -0.392753));
    v.add(new PVector(-4.145933, -1.490684, -0.526581));
    v.add(new PVector(-4.145933, -0.457598, -0.526581));
    d = new Data("basewins-10.043_Cube.045", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.145933, -0.457598, -0.526581));
    v.add(new PVector(-4.145933, -1.490684, -0.526581));
    v.add(new PVector(-4.012105, -1.490684, -0.526581));
    v.add(new PVector(-4.012105, -0.457598, -0.526581));
    d = new Data("basewins-10.044_Cube.046", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.012105, -0.457598, -0.392753));
    v.add(new PVector(-4.012105, -1.490684, -0.392753));
    v.add(new PVector(-4.145933, -1.490684, -0.392753));
    v.add(new PVector(-4.145933, -0.457598, -0.392753));
    d = new Data("basewins-10.045_Cube.047", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.145933, -0.457598, -1.571805));
    v.add(new PVector(-4.145933, -0.457598, -1.437977));
    v.add(new PVector(-4.145933, -1.490684, -1.437977));
    v.add(new PVector(-4.145933, -1.490684, -1.571805));
    d = new Data("basewins-10.046_Cube.048", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.145933, -0.457598, -1.437977));
    v.add(new PVector(-4.012105, -0.457598, -1.437978));
    v.add(new PVector(-4.012105, -1.490684, -1.437978));
    v.add(new PVector(-4.145933, -1.490684, -1.437977));
    d = new Data("basewins-10.047_Cube.049", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.012105, -0.457598, -1.571805));
    v.add(new PVector(-4.145933, -0.457598, -1.571805));
    v.add(new PVector(-4.145933, -1.490684, -1.571805));
    v.add(new PVector(-4.012105, -1.490684, -1.571805));
    d = new Data("basewins-10.048_Cube.050", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.007665, -0.492075, -1.389033));
    v.add(new PVector(-4.007664, -0.492075, -1.335233));
    v.add(new PVector(-4.007664, -1.45014, -1.335233));
    v.add(new PVector(-4.007665, -1.45014, -1.389033));
    d = new Data("basewins-10.049_Cube.051", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.007664, -0.492075, -1.281433));
    v.add(new PVector(-4.007664, -0.492075, -1.227633));
    v.add(new PVector(-4.007664, -1.45014, -1.227633));
    v.add(new PVector(-4.007664, -1.45014, -1.281433));
    d = new Data("basewins-10.050_Cube.052", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.007664, -0.492075, -1.173833));
    v.add(new PVector(-4.007664, -1.45014, -1.173833));
    v.add(new PVector(-4.007664, -1.45014, -1.120033));
    v.add(new PVector(-4.007664, -0.492075, -1.120033));
    d = new Data("basewins-10.051_Cube.053", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.007664, -0.492075, -1.066233));
    v.add(new PVector(-4.007664, -0.492075, -1.012433));
    v.add(new PVector(-4.007664, -1.45014, -1.012433));
    v.add(new PVector(-4.007664, -1.45014, -1.066233));
    d = new Data("basewins-10.052_Cube.054", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.007664, -0.492075, -0.958633));
    v.add(new PVector(-4.007664, -0.492075, -0.904833));
    v.add(new PVector(-4.007664, -1.45014, -0.904833));
    v.add(new PVector(-4.007664, -1.45014, -0.958633));
    d = new Data("basewins-10.053_Cube.055", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.007664, -0.492075, -0.851034));
    v.add(new PVector(-4.007664, -1.45014, -0.851034));
    v.add(new PVector(-4.007664, -1.45014, -0.797234));
    v.add(new PVector(-4.007664, -0.492075, -0.797234));
    d = new Data("basewins-10.054_Cube.056", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.007664, -0.492075, -0.743434));
    v.add(new PVector(-4.007664, -1.45014, -0.743434));
    v.add(new PVector(-4.007664, -1.45014, -0.689634));
    v.add(new PVector(-4.007664, -0.492075, -0.689634));
    d = new Data("basewins-10.055_Cube.057", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.007664, -0.492075, -0.635834));
    v.add(new PVector(-4.007664, -1.45014, -0.635834));
    v.add(new PVector(-4.007664, -1.45014, -0.582034));
    v.add(new PVector(-4.007664, -0.492075, -0.582034));
    d = new Data("basewins-10.056_Cube.058", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.011861, -0.345974, -1.645769));
    v.add(new PVector(-4.011861, -0.345974, -0.318789));
    v.add(new PVector(-4.23018, -0.345974, -0.318789));
    v.add(new PVector(-4.230181, -0.345974, -1.645769));
    d = new Data("basewins-10.057_Cube.059", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.011861, -0.445974, -0.318789));
    v.add(new PVector(-4.011861, -0.445974, -1.645769));
    v.add(new PVector(-4.230181, -0.445974, -1.645769));
    v.add(new PVector(-4.23018, -0.445974, -0.318789));
    d = new Data("basewins-10.058_Cube.060", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.011861, -0.345974, -0.318789));
    v.add(new PVector(-4.011861, -0.445974, -0.318789));
    v.add(new PVector(-4.23018, -0.445974, -0.318789));
    v.add(new PVector(-4.23018, -0.345974, -0.318789));
    d = new Data("basewins-10.059_Cube.061", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.478303, -0.075918, -2.01052));
    v.add(new PVector(-1.582001, -0.075918, -2.010519));
    v.add(new PVector(-1.582001, -1.922565, -2.010519));
    v.add(new PVector(-1.478303, -1.922565, -2.01052));
    d = new Data("basewins-10.060_Cube.062", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.685699, -0.075918, -2.010519));
    v.add(new PVector(-1.789397, -0.075918, -2.010519));
    v.add(new PVector(-1.789397, -1.922565, -2.010519));
    v.add(new PVector(-1.685699, -1.922565, -2.010519));
    d = new Data("basewins-10.061_Cube.063", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.893095, -0.075918, -2.010519));
    v.add(new PVector(-1.893095, -1.922565, -2.010519));
    v.add(new PVector(-1.996793, -1.922565, -2.010519));
    v.add(new PVector(-1.996793, -0.075918, -2.010519));
    d = new Data("basewins-10.062_Cube.064", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.100491, -0.075918, -2.010519));
    v.add(new PVector(-2.204189, -0.075918, -2.010519));
    v.add(new PVector(-2.204189, -1.922565, -2.010519));
    v.add(new PVector(-2.100491, -1.922565, -2.010519));
    d = new Data("basewins-10.063_Cube.065", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.307887, -0.075918, -2.010519));
    v.add(new PVector(-2.411585, -0.075918, -2.010519));
    v.add(new PVector(-2.411585, -1.922565, -2.010519));
    v.add(new PVector(-2.307887, -1.922565, -2.010519));
    d = new Data("basewins-10.064_Cube.066", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.515283, -0.075918, -2.010519));
    v.add(new PVector(-2.515283, -1.922565, -2.010519));
    v.add(new PVector(-2.618981, -1.922565, -2.010519));
    v.add(new PVector(-2.618981, -0.075918, -2.010519));
    d = new Data("basewins-10.065_Cube.067", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.722679, -0.075918, -2.010519));
    v.add(new PVector(-2.722679, -1.922565, -2.010519));
    v.add(new PVector(-2.826377, -1.922565, -2.010519));
    v.add(new PVector(-2.826377, -0.075918, -2.010519));
    d = new Data("basewins-10.066_Cube.068", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.930075, -0.075918, -2.010519));
    v.add(new PVector(-2.930075, -1.922565, -2.010519));
    v.add(new PVector(-3.033773, -1.922565, -2.010519));
    v.add(new PVector(-3.033773, -0.075918, -2.010519));
    d = new Data("basewins-10.067_Cube.069", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -1.500815, 1.703856));
    v.add(new PVector(2.233036, -1.600815, 1.703856));
    v.add(new PVector(2.014716, -1.600815, 1.703856));
    v.add(new PVector(2.014716, -1.500815, 1.703856));
    d = new Data("basewins-10.068_Cube.070", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233035, -1.500815, 0.376876));
    v.add(new PVector(2.233035, -1.600815, 0.376876));
    v.add(new PVector(2.233036, -1.600815, 1.703856));
    v.add(new PVector(2.233036, -1.500815, 1.703856));
    d = new Data("basewins-10.069_Cube.071", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -0.345974, 1.703856));
    v.add(new PVector(2.233036, -0.445974, 1.703856));
    v.add(new PVector(2.014716, -0.445974, 1.703856));
    v.add(new PVector(2.014716, -0.345974, 1.703856));
    d = new Data("basewins-10.070_Cube.072", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.233036, -0.345974, 0.376876));
    v.add(new PVector(2.233036, -0.445974, 0.376876));
    v.add(new PVector(2.233036, -0.445974, 1.703856));
    v.add(new PVector(2.233036, -0.345974, 1.703856));
    d = new Data("basewins-10.071_Cube.073", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.977642, -1.500815, -2.233036));
    v.add(new PVector(2.977642, -1.600815, -2.233036));
    v.add(new PVector(2.977642, -1.600815, -2.014716));
    v.add(new PVector(2.977642, -1.500815, -2.014716));
    d = new Data("basewins-10.072_Cube.074", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.650661, -1.500815, -2.233035));
    v.add(new PVector(1.650661, -1.600815, -2.233035));
    v.add(new PVector(2.977642, -1.600815, -2.233036));
    v.add(new PVector(2.977642, -1.500815, -2.233036));
    d = new Data("basewins-10.073_Cube.075", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.977642, -0.345974, -2.233036));
    v.add(new PVector(2.977642, -0.445974, -2.233036));
    v.add(new PVector(2.977642, -0.445974, -2.014716));
    v.add(new PVector(2.977642, -0.345974, -2.014716));
    d = new Data("basewins-10.074_Cube.076", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.650661, -0.345974, -2.233036));
    v.add(new PVector(1.650661, -0.445974, -2.233036));
    v.add(new PVector(2.977642, -0.445974, -2.233036));
    v.add(new PVector(2.977642, -0.345974, -2.233036));
    d = new Data("basewins-10.075_Cube.077", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.230181, -1.500815, -1.645769));
    v.add(new PVector(-4.230181, -1.600815, -1.645769));
    v.add(new PVector(-4.011861, -1.600815, -1.645769));
    v.add(new PVector(-4.011861, -1.500815, -1.645769));
    d = new Data("basewins-10.076_Cube.078", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.23018, -1.500815, -0.318789));
    v.add(new PVector(-4.23018, -1.600815, -0.318789));
    v.add(new PVector(-4.230181, -1.600815, -1.645769));
    v.add(new PVector(-4.230181, -1.500815, -1.645769));
    d = new Data("basewins-10.077_Cube.079", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.230181, -0.345974, -1.645769));
    v.add(new PVector(-4.230181, -0.445974, -1.645769));
    v.add(new PVector(-4.011861, -0.445974, -1.645769));
    v.add(new PVector(-4.011861, -0.345974, -1.645769));
    d = new Data("basewins-10.078_Cube.080", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.23018, -0.345974, -0.318789));
    v.add(new PVector(-4.23018, -0.445974, -0.318789));
    v.add(new PVector(-4.230181, -0.445974, -1.645769));
    v.add(new PVector(-4.230181, -0.345974, -1.645769));
    d = new Data("basewins-10.079_Cube.081", 4, v);
    dd.add(d);

    win = new Win("basewins-10", dd);
    p.add(win);


    return p;
  }

  class FloorNext {
    ArrayList<String> trees;
    FloorNext(ArrayList<String> trees) {
      this.trees = trees;
    }
  }

  class Data {
    String name;
    int mat;
    ArrayList<PVector> vertices;
    Data(String name, int mat, ArrayList<PVector> vertices) {
      this.name = name;
      this.mat = mat;
      this.vertices = vertices;
    }
  }

  class Floor {
    String id;
    FloorNext next;
    ArrayList<Data> data;
    Floor(String id, FloorNext next, ArrayList<Data> data) {
      this.id = id;
      this.next = next;
      this.data = data;
    }
  }


  ArrayList<Floor> getFloorData() {
    ArrayList<String> t;
    ArrayList<Data> dd;
    FloorNext n;
    ArrayList<PVector> v;
    Data d;
    Floor f;

    ArrayList<Floor> p = new ArrayList();

    t = new ArrayList();
    t.add("trees-0");
    t.add("trees-1");
    t.add("trees-2");
    t.add("trees-3");
    t.add("trees-4");
    t.add("trees-5");
    t.add("empty");
    t.add("empty");
    t.add("empty");
    t.add("empty");
    n = new FloorNext(t);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-5.992014, 0.013097, -5.030954));
    v.add(new PVector(5.992014, 0.013097, -5.030954));
    v.add(new PVector(5.992014, 0.013099, 5.030954));
    v.add(new PVector(-5.992014, 0.013099, 5.030954));
    d = new Data("floor-0_Cube.018", 0, v);
    dd.add(d);

    f = new Floor("floor-0", n, dd);
    p.add(f);


    t = new ArrayList();
    t.add("trees-0");
    t.add("trees-1");
    t.add("trees-2");
    t.add("trees-3");
    t.add("trees-4");
    t.add("trees-5");
    t.add("empty");
    t.add("empty");
    t.add("empty");
    t.add("empty");
    n = new FloorNext(t);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(5.992014, 1.27413, -5.030954));
    v.add(new PVector(-5.992014, 0.101938, -5.030954));
    v.add(new PVector(-5.992014, 0.10194, 5.030954));
    v.add(new PVector(5.992014, 1.274132, 5.030954));
    d = new Data("floor-1_Cube.019", 0, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-5.992014, 0.013097, -5.030954));
    v.add(new PVector(5.992014, 0.013097, -5.030954));
    v.add(new PVector(5.992014, 0.013099, 5.030954));
    v.add(new PVector(-5.992014, 0.013099, 5.030954));
    d = new Data("floor-1.001_Cube.001", 0, v);
    dd.add(d);

    f = new Floor("floor-1", n, dd);
    p.add(f);


    t = new ArrayList();
    t.add("trees-0");
    t.add("trees-1");
    t.add("trees-2");
    t.add("trees-3");
    t.add("trees-4");
    t.add("trees-5");
    t.add("empty");
    t.add("empty");
    t.add("empty");
    t.add("empty");
    n = new FloorNext(t);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-5.992015, 1.274132, 5.030952));
    v.add(new PVector(5.992013, 0.10194, 5.030957));
    v.add(new PVector(5.992015, 0.101938, -5.030952));
    v.add(new PVector(-5.992013, 1.27413, -5.030957));
    d = new Data("floor-2_Cube.022", 0, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(5.992013, 0.013099, 5.030957));
    v.add(new PVector(-5.992015, 0.013099, 5.030952));
    v.add(new PVector(-5.992013, 0.013097, -5.030957));
    v.add(new PVector(5.992015, 0.013097, -5.030952));
    d = new Data("floor-2.001_Cube.001", 0, v);
    dd.add(d);

    f = new Floor("floor-2", n, dd);
    p.add(f);


    return p;
  }

  class RoofNext {
    ArrayList<String> roofaddon;
    ArrayList<String> top;
    RoofNext(ArrayList<String> roofaddon, ArrayList<String> top) {
      this.roofaddon = roofaddon;
      this.top = top;
    }
  }

  class Roof {
    String id;
    RoofNext next;
    ArrayList<Data> data;
    Roof(String id, RoofNext next, ArrayList<Data> data) {
      this.id = id;
      this.next = next;
      this.data = data;
    }
  }

  ArrayList<Roof> getRoofData() {
    ArrayList<String> roofaddon;
    ArrayList<String> top;
    ArrayList<Data> dd;
    RoofNext n;
    ArrayList<PVector> v;
    Data d;
    Roof roof;

    ArrayList<Roof> p = new ArrayList();

    roofaddon = new ArrayList();
    roofaddon.add("roofaddon-0");
    roofaddon.add("roofaddon-2");
    top = new ArrayList();
    top.add("top-0");
    top.add("top-1");
    top.add("empty");
    top.add("empty");
    n = new RoofNext(roofaddon, top);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.5, -2.025001, -2.5));
    v.add(new PVector(-2.5, -2.025001, -2.5));
    v.add(new PVector(-2.5, -2.025, 2.5));
    v.add(new PVector(2.5, -2.025, 2.5));
    d = new Data("roof-0_Cube.029", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -3.025001, -2.5));
    v.add(new PVector(2.5, -3.025001, -2.5));
    v.add(new PVector(2.5, -3.025, 2.5));
    v.add(new PVector(-2.5, -3.025, 2.5));
    d = new Data("roof-0.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -3.06008, 2.0));
    v.add(new PVector(-2.0, -3.997572, 2.000001));
    v.add(new PVector(2.0, -3.997572, 2.000001));
    v.add(new PVector(2.0, -3.06008, 2.0));
    d = new Data("roof-0.002_Cube.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -3.06008, -2.0));
    v.add(new PVector(2.0, -3.997572, -1.999999));
    v.add(new PVector(-2.0, -3.997572, -1.999999));
    v.add(new PVector(-2.0, -3.06008, -2.0));
    d = new Data("roof-0.003_Cube.003", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -3.06008, -2.0));
    v.add(new PVector(-2.0, -3.997572, -1.999999));
    v.add(new PVector(-2.0, -3.997572, 2.000001));
    v.add(new PVector(-2.0, -3.06008, 2.0));
    d = new Data("roof-0.004_Cube.004", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -4.030653, -2.499999));
    v.add(new PVector(-2.5, -4.030653, -2.499999));
    v.add(new PVector(-2.5, -4.030652, 2.500001));
    v.add(new PVector(2.5, -4.030652, 2.500001));
    d = new Data("roof-0.005_Cube.005", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -5.030653, -2.499999));
    v.add(new PVector(2.5, -5.030653, -2.499999));
    v.add(new PVector(2.5, -5.030652, 2.500001));
    v.add(new PVector(-2.5, -5.030652, 2.500001));
    d = new Data("roof-0.006_Cube.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -2.025, 2.5));
    v.add(new PVector(2.5, -3.025, 2.5));
    v.add(new PVector(2.5, -3.025001, -2.5));
    v.add(new PVector(2.5, -2.025001, -2.5));
    d = new Data("roof-0.007_Cube.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -2.025001, -2.5));
    v.add(new PVector(2.5, -3.025001, -2.5));
    v.add(new PVector(-2.5, -3.025001, -2.5));
    v.add(new PVector(-2.5, -2.025001, -2.5));
    d = new Data("roof-0.008_Cube.008", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -2.025, 2.5));
    v.add(new PVector(-2.5, -3.025, 2.5));
    v.add(new PVector(2.5, -3.025, 2.5));
    v.add(new PVector(2.5, -2.025, 2.5));
    d = new Data("roof-0.009_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -2.025001, -2.5));
    v.add(new PVector(-2.5, -3.025001, -2.5));
    v.add(new PVector(-2.5, -3.025, 2.5));
    v.add(new PVector(-2.5, -2.025, 2.5));
    d = new Data("roof-0.010_Cube.011", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -3.06008, 2.0));
    v.add(new PVector(2.0, -3.997572, 2.000001));
    v.add(new PVector(2.0, -3.997572, -1.999999));
    v.add(new PVector(2.0, -3.06008, -2.0));
    d = new Data("roof-0.011_Cube.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -4.030652, 2.500001));
    v.add(new PVector(2.5, -5.030652, 2.500001));
    v.add(new PVector(2.5, -5.030653, -2.499999));
    v.add(new PVector(2.5, -4.030653, -2.499999));
    d = new Data("roof-0.012_Cube.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -4.030653, -2.499999));
    v.add(new PVector(2.5, -5.030653, -2.499999));
    v.add(new PVector(-2.5, -5.030653, -2.499999));
    v.add(new PVector(-2.5, -4.030653, -2.499999));
    d = new Data("roof-0.013_Cube.014", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -4.030652, 2.500001));
    v.add(new PVector(-2.5, -5.030652, 2.500001));
    v.add(new PVector(2.5, -5.030652, 2.500001));
    v.add(new PVector(2.5, -4.030652, 2.500001));
    d = new Data("roof-0.014_Cube.015", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -4.030653, -2.499999));
    v.add(new PVector(-2.5, -5.030653, -2.499999));
    v.add(new PVector(-2.5, -5.030652, 2.500001));
    v.add(new PVector(-2.5, -4.030652, 2.500001));
    d = new Data("roof-0.015_Cube.016", 4, v);
    dd.add(d);

    roof = new Roof("roof-0", n, dd);
    p.add(roof);


    roofaddon = new ArrayList();
    roofaddon.add("roofaddon-1");
    roofaddon.add("roofaddon-3");
    top = new ArrayList();
    top.add("top-0");
    top.add("top-1");
    top.add("empty");
    top.add("empty");
    n = new RoofNext(roofaddon, top);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.5, -2.025001, -2.5));
    v.add(new PVector(-2.5, -2.025001, -2.5));
    v.add(new PVector(-2.5, -2.025, 2.5));
    v.add(new PVector(2.5, -2.025, 2.5));
    d = new Data("roof-1_Cube.030", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -2.653097, -2.5));
    v.add(new PVector(2.5, -2.653097, -2.5));
    v.add(new PVector(2.5, -2.653096, 2.5));
    v.add(new PVector(-2.5, -2.653096, 2.5));
    d = new Data("roof-1.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.688177, 2.0));
    v.add(new PVector(-2.0, -3.418348, 2.0));
    v.add(new PVector(2.0, -3.418348, 2.0));
    v.add(new PVector(2.0, -2.688177, 2.0));
    d = new Data("roof-1.002_Cube.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -2.688177, -2.0));
    v.add(new PVector(2.0, -3.418348, -1.999999));
    v.add(new PVector(-2.0, -3.418348, -1.999999));
    v.add(new PVector(-2.0, -2.688177, -2.0));
    d = new Data("roof-1.003_Cube.003", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.688177, -2.0));
    v.add(new PVector(-2.0, -3.418348, -1.999999));
    v.add(new PVector(-2.0, -3.418348, 2.0));
    v.add(new PVector(-2.0, -2.688177, 2.0));
    d = new Data("roof-1.004_Cube.004", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -3.451427, -2.5));
    v.add(new PVector(-2.5, -3.451427, -2.5));
    v.add(new PVector(-2.5, -3.451427, 2.5));
    v.add(new PVector(2.5, -3.451427, 2.5));
    d = new Data("roof-1.005_Cube.005", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -5.030653, -2.499999));
    v.add(new PVector(2.5, -5.030653, -2.499999));
    v.add(new PVector(2.5, -5.030652, 2.500001));
    v.add(new PVector(-2.5, -5.030652, 2.500001));
    d = new Data("roof-1.006_Cube.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -2.025, 2.5));
    v.add(new PVector(2.5, -2.653096, 2.5));
    v.add(new PVector(2.5, -2.653097, -2.5));
    v.add(new PVector(2.5, -2.025001, -2.5));
    d = new Data("roof-1.007_Cube.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -2.025001, -2.5));
    v.add(new PVector(2.5, -2.653097, -2.5));
    v.add(new PVector(-2.5, -2.653097, -2.5));
    v.add(new PVector(-2.5, -2.025001, -2.5));
    d = new Data("roof-1.008_Cube.008", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -2.025, 2.5));
    v.add(new PVector(-2.5, -2.653096, 2.5));
    v.add(new PVector(2.5, -2.653096, 2.5));
    v.add(new PVector(2.5, -2.025, 2.5));
    d = new Data("roof-1.009_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -2.025001, -2.5));
    v.add(new PVector(-2.5, -2.653097, -2.5));
    v.add(new PVector(-2.5, -2.653096, 2.5));
    v.add(new PVector(-2.5, -2.025, 2.5));
    d = new Data("roof-1.010_Cube.011", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -2.688177, 2.0));
    v.add(new PVector(2.0, -3.418348, 2.0));
    v.add(new PVector(2.0, -3.418348, -1.999999));
    v.add(new PVector(2.0, -2.688177, -2.0));
    d = new Data("roof-1.011_Cube.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -3.451427, 2.5));
    v.add(new PVector(2.5, -5.030652, 2.500001));
    v.add(new PVector(2.5, -5.030653, -2.499999));
    v.add(new PVector(2.5, -3.451427, -2.5));
    d = new Data("roof-1.012_Cube.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -3.451427, -2.5));
    v.add(new PVector(2.5, -5.030653, -2.499999));
    v.add(new PVector(-2.5, -5.030653, -2.499999));
    v.add(new PVector(-2.5, -3.451427, -2.5));
    d = new Data("roof-1.013_Cube.014", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -3.451427, 2.5));
    v.add(new PVector(-2.5, -5.030652, 2.500001));
    v.add(new PVector(2.5, -5.030652, 2.500001));
    v.add(new PVector(2.5, -3.451427, 2.5));
    d = new Data("roof-1.014_Cube.015", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -3.451427, -2.5));
    v.add(new PVector(-2.5, -5.030653, -2.499999));
    v.add(new PVector(-2.5, -5.030652, 2.500001));
    v.add(new PVector(-2.5, -3.451427, 2.5));
    d = new Data("roof-1.015_Cube.016", 4, v);
    dd.add(d);

    roof = new Roof("roof-1", n, dd);
    p.add(roof);


    roofaddon = new ArrayList();
    roofaddon.add("roofaddon-0");
    roofaddon.add("roofaddon-2");
    top = new ArrayList();
    top.add("top-0");
    top.add("top-1");
    top.add("empty");
    top.add("empty");
    n = new RoofNext(roofaddon, top);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.5, -2.025001, -2.5));
    v.add(new PVector(-2.5, -2.025001, -2.5));
    v.add(new PVector(-2.5, -2.025, 2.5));
    v.add(new PVector(2.5, -2.025, 2.5));
    d = new Data("roof-2_Cube.031", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -3.025001, -2.5));
    v.add(new PVector(2.5, -3.025001, -2.5));
    v.add(new PVector(2.5, -3.025, 2.5));
    v.add(new PVector(-2.5, -3.025, 2.5));
    d = new Data("roof-2.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.358359, -3.06008, 2.35836));
    v.add(new PVector(-2.358359, -3.997571, 2.35836));
    v.add(new PVector(2.358359, -3.997571, 2.35836));
    v.add(new PVector(2.358359, -3.06008, 2.35836));
    d = new Data("roof-2.002_Cube.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.358359, -3.060081, -2.358359));
    v.add(new PVector(2.358359, -3.997572, -2.358358));
    v.add(new PVector(-2.358359, -3.997572, -2.358358));
    v.add(new PVector(-2.358359, -3.060081, -2.358359));
    d = new Data("roof-2.003_Cube.003", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.358359, -3.060081, -2.358359));
    v.add(new PVector(-2.358359, -3.997572, -2.358358));
    v.add(new PVector(-2.358359, -3.997571, 2.35836));
    v.add(new PVector(-2.358359, -3.06008, 2.35836));
    d = new Data("roof-2.004_Cube.004", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -4.030653, -2.499999));
    v.add(new PVector(-2.5, -4.030653, -2.499999));
    v.add(new PVector(-2.5, -4.030652, 2.500001));
    v.add(new PVector(2.5, -4.030652, 2.500001));
    d = new Data("roof-2.005_Cube.005", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -5.030653, -2.499999));
    v.add(new PVector(2.5, -5.030653, -2.499999));
    v.add(new PVector(2.5, -5.030652, 2.500001));
    v.add(new PVector(-2.5, -5.030652, 2.500001));
    d = new Data("roof-2.006_Cube.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -2.025, 2.5));
    v.add(new PVector(2.5, -3.025, 2.5));
    v.add(new PVector(2.5, -3.025001, -2.5));
    v.add(new PVector(2.5, -2.025001, -2.5));
    d = new Data("roof-2.007_Cube.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -2.025001, -2.5));
    v.add(new PVector(2.5, -3.025001, -2.5));
    v.add(new PVector(-2.5, -3.025001, -2.5));
    v.add(new PVector(-2.5, -2.025001, -2.5));
    d = new Data("roof-2.008_Cube.008", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -2.025, 2.5));
    v.add(new PVector(-2.5, -3.025, 2.5));
    v.add(new PVector(2.5, -3.025, 2.5));
    v.add(new PVector(2.5, -2.025, 2.5));
    d = new Data("roof-2.009_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -2.025001, -2.5));
    v.add(new PVector(-2.5, -3.025001, -2.5));
    v.add(new PVector(-2.5, -3.025, 2.5));
    v.add(new PVector(-2.5, -2.025, 2.5));
    d = new Data("roof-2.010_Cube.011", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.358359, -3.06008, 2.35836));
    v.add(new PVector(2.358359, -3.997571, 2.35836));
    v.add(new PVector(2.358359, -3.997572, -2.358358));
    v.add(new PVector(2.358359, -3.060081, -2.358359));
    d = new Data("roof-2.011_Cube.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -4.030652, 2.500001));
    v.add(new PVector(2.5, -5.030652, 2.500001));
    v.add(new PVector(2.5, -5.030653, -2.499999));
    v.add(new PVector(2.5, -4.030653, -2.499999));
    d = new Data("roof-2.012_Cube.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.5, -4.030653, -2.499999));
    v.add(new PVector(2.5, -5.030653, -2.499999));
    v.add(new PVector(-2.5, -5.030653, -2.499999));
    v.add(new PVector(-2.5, -4.030653, -2.499999));
    d = new Data("roof-2.013_Cube.014", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -4.030652, 2.500001));
    v.add(new PVector(-2.5, -5.030652, 2.500001));
    v.add(new PVector(2.5, -5.030652, 2.500001));
    v.add(new PVector(2.5, -4.030652, 2.500001));
    d = new Data("roof-2.014_Cube.015", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.5, -4.030653, -2.499999));
    v.add(new PVector(-2.5, -5.030653, -2.499999));
    v.add(new PVector(-2.5, -5.030652, 2.500001));
    v.add(new PVector(-2.5, -4.030652, 2.500001));
    d = new Data("roof-2.015_Cube.016", 4, v);
    dd.add(d);

    roof = new Roof("roof-2", n, dd);
    p.add(roof);


    roofaddon = new ArrayList();
    roofaddon.add("roofaddon-0");
    roofaddon.add("roofaddon-1");
    roofaddon.add("roofaddon-2");
    roofaddon.add("empty");
    top = new ArrayList();
    top.add("top-0");
    top.add("top-1");
    top.add("empty");
    top.add("empty");
    n = new RoofNext(roofaddon, top);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(0.013126, -2.99202, 1.993377));
    v.add(new PVector(0.013126, -4.99202, 1.993378));
    v.add(new PVector(2.013126, -4.99202, 1.993378));
    v.add(new PVector(2.013126, -2.99202, 1.993377));
    d = new Data("roof-3_Cube.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.013126, -4.992021, -1.993375));
    v.add(new PVector(2.013126, -4.992021, -1.993375));
    v.add(new PVector(2.013126, -4.99202, 1.993378));
    v.add(new PVector(0.013126, -4.99202, 1.993378));
    d = new Data("roof-3.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.013126, -2.99202, -1.993376));
    v.add(new PVector(2.013126, -4.992021, -1.993375));
    v.add(new PVector(0.013126, -4.992021, -1.993375));
    v.add(new PVector(0.013126, -2.99202, -1.993376));
    d = new Data("roof-3.002_Cube.002", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.013126, -2.99202, -1.993376));
    v.add(new PVector(0.013126, -4.992021, -1.993375));
    v.add(new PVector(0.013126, -4.99202, 1.993378));
    v.add(new PVector(0.013126, -2.99202, 1.993377));
    d = new Data("roof-3.003_Cube.003", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.35, 0.0, 2.35));
    v.add(new PVector(-2.65, 0.0, 2.35));
    v.add(new PVector(-2.65, 0.0, 2.65));
    v.add(new PVector(-2.35, 0.0, 2.65));
    d = new Data("roof-3.004_Cube.004", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.65, 0.0, 2.65));
    v.add(new PVector(-2.65, -2.0, 2.65));
    v.add(new PVector(-2.35, -2.0, 2.65));
    v.add(new PVector(-2.35, 0.0, 2.65));
    d = new Data("roof-3.005_Cube.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.35, 0.0, 2.35));
    v.add(new PVector(-2.35, -2.0, 2.35));
    v.add(new PVector(-2.65, -2.0, 2.35));
    v.add(new PVector(-2.65, 0.0, 2.35));
    d = new Data("roof-3.006_Cube.006", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.65, 0.0, 2.35));
    v.add(new PVector(-2.65, -2.0, 2.35));
    v.add(new PVector(-2.65, -2.0, 2.65));
    v.add(new PVector(-2.65, 0.0, 2.65));
    d = new Data("roof-3.007_Cube.007", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.35, -0.0, -2.65));
    v.add(new PVector(-2.65, -0.0, -2.65));
    v.add(new PVector(-2.65, -0.0, -2.35));
    v.add(new PVector(-2.35, -0.0, -2.35));
    d = new Data("roof-3.008_Cube.010", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.65, -0.0, -2.35));
    v.add(new PVector(-2.65, -2.0, -2.35));
    v.add(new PVector(-2.35, -2.0, -2.35));
    v.add(new PVector(-2.35, -0.0, -2.35));
    d = new Data("roof-3.009_Cube.011", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.35, -0.0, -2.65));
    v.add(new PVector(-2.35, -2.0, -2.65));
    v.add(new PVector(-2.65, -2.0, -2.65));
    v.add(new PVector(-2.65, -0.0, -2.65));
    d = new Data("roof-3.010_Cube.012", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.65, -0.0, -2.65));
    v.add(new PVector(-2.65, -2.0, -2.65));
    v.add(new PVector(-2.65, -2.0, -2.35));
    v.add(new PVector(-2.65, -0.0, -2.35));
    d = new Data("roof-3.011_Cube.013", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.65, -0.0, -2.65));
    v.add(new PVector(2.35, -0.0, -2.65));
    v.add(new PVector(2.35, -0.0, -2.35));
    v.add(new PVector(2.65, -0.0, -2.35));
    d = new Data("roof-3.012_Cube.014", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.35, -0.0, -2.35));
    v.add(new PVector(2.35, -2.0, -2.35));
    v.add(new PVector(2.65, -2.0, -2.35));
    v.add(new PVector(2.65, -0.0, -2.35));
    d = new Data("roof-3.013_Cube.015", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.65, -0.0, -2.65));
    v.add(new PVector(2.65, -2.0, -2.65));
    v.add(new PVector(2.35, -2.0, -2.65));
    v.add(new PVector(2.35, -0.0, -2.65));
    d = new Data("roof-3.014_Cube.016", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.35, -0.0, -2.65));
    v.add(new PVector(2.35, -2.0, -2.65));
    v.add(new PVector(2.35, -2.0, -2.35));
    v.add(new PVector(2.35, -0.0, -2.35));
    d = new Data("roof-3.015_Cube.017", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.65, 0.0, 2.35));
    v.add(new PVector(2.35, 0.0, 2.35));
    v.add(new PVector(2.35, 0.0, 2.65));
    v.add(new PVector(2.65, 0.0, 2.65));
    d = new Data("roof-3.016_Cube.018", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.35, 0.0, 2.65));
    v.add(new PVector(2.35, -2.0, 2.65));
    v.add(new PVector(2.65, -2.0, 2.65));
    v.add(new PVector(2.65, 0.0, 2.65));
    d = new Data("roof-3.017_Cube.019", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.65, 0.0, 2.35));
    v.add(new PVector(2.65, -2.0, 2.35));
    v.add(new PVector(2.35, -2.0, 2.35));
    v.add(new PVector(2.35, 0.0, 2.35));
    d = new Data("roof-3.018_Cube.020", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.35, 0.0, 2.35));
    v.add(new PVector(2.35, -2.0, 2.35));
    v.add(new PVector(2.35, -2.0, 2.65));
    v.add(new PVector(2.35, 0.0, 2.65));
    d = new Data("roof-3.019_Cube.021", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.0, -2.025001, -3.0));
    v.add(new PVector(-3.0, -2.025001, -3.0));
    v.add(new PVector(-3.0, -2.025, 3.0));
    v.add(new PVector(3.0, -2.025, 3.0));
    d = new Data("roof-3.020_Cube.022", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.0, -3.025001, -3.0));
    v.add(new PVector(3.0, -3.025001, -3.0));
    v.add(new PVector(3.0, -3.025, 3.0));
    v.add(new PVector(-3.0, -3.025, 3.0));
    d = new Data("roof-3.021_Cube.023", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.529465, -2.992019, 1.993377));
    v.add(new PVector(-0.529465, -4.99202, 1.993378));
    v.add(new PVector(-0.151691, -4.99202, 1.993378));
    v.add(new PVector(-0.151691, -2.992019, 1.993377));
    d = new Data("roof-3.022_Cube.024", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.529465, -4.992021, -1.993375));
    v.add(new PVector(-0.151691, -4.992021, -1.993375));
    v.add(new PVector(-0.151691, -4.99202, 1.993378));
    v.add(new PVector(-0.529465, -4.99202, 1.993378));
    d = new Data("roof-3.023_Cube.025", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.151691, -2.992019, -1.993376));
    v.add(new PVector(-0.151691, -4.992021, -1.993375));
    v.add(new PVector(-0.529465, -4.992021, -1.993375));
    v.add(new PVector(-0.529465, -2.992019, -1.993376));
    d = new Data("roof-3.024_Cube.026", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.529465, -2.992019, -1.993376));
    v.add(new PVector(-0.529465, -4.992021, -1.993375));
    v.add(new PVector(-0.529465, -4.99202, 1.993378));
    v.add(new PVector(-0.529465, -2.992019, 1.993377));
    d = new Data("roof-3.025_Cube.027", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.176194, -2.931927, -1.540372));
    v.add(new PVector(-2.176194, -4.442422, -1.540372));
    v.add(new PVector(-2.176194, -4.442422, -0.029876));
    v.add(new PVector(-2.176194, -2.931927, -0.029877));
    d = new Data("roof-3.026_Cube.028", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.834792, -4.442422, -1.540371));
    v.add(new PVector(0.834792, -4.442422, -0.029876));
    v.add(new PVector(-2.176194, -4.442422, -0.029876));
    v.add(new PVector(-2.176194, -4.442422, -1.540372));
    d = new Data("roof-3.027_Cube.029", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.176194, -2.931927, -0.029877));
    v.add(new PVector(-2.176194, -4.442422, -0.029876));
    v.add(new PVector(0.834792, -4.442422, -0.029876));
    v.add(new PVector(0.834792, -2.931927, -0.029877));
    d = new Data("roof-3.028_Cube.030", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.834792, -2.931927, -1.540372));
    v.add(new PVector(0.834792, -4.442422, -1.540371));
    v.add(new PVector(-2.176194, -4.442422, -1.540372));
    v.add(new PVector(-2.176194, -2.931927, -1.540372));
    d = new Data("roof-3.029_Cube.031", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.177929, -2.88115, 0.429368));
    v.add(new PVector(-2.177929, -4.440162, 0.429369));
    v.add(new PVector(0.643022, -4.440162, 0.429369));
    v.add(new PVector(0.643022, -2.88115, 0.429368));
    d = new Data("roof-3.030_Cube.032", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.177929, -4.440162, 0.205023));
    v.add(new PVector(0.643022, -4.440162, 0.205023));
    v.add(new PVector(0.643022, -4.440162, 0.429369));
    v.add(new PVector(-2.177929, -4.440162, 0.429369));
    d = new Data("roof-3.031_Cube.033", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.643022, -2.88115, 0.205022));
    v.add(new PVector(0.643022, -4.440162, 0.205023));
    v.add(new PVector(-2.177929, -4.440162, 0.205023));
    v.add(new PVector(-2.177929, -2.88115, 0.205022));
    d = new Data("roof-3.032_Cube.034", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.177929, -2.88115, 0.205022));
    v.add(new PVector(-2.177929, -4.440162, 0.205023));
    v.add(new PVector(-2.177929, -4.440162, 0.429369));
    v.add(new PVector(-2.177929, -2.88115, 0.429368));
    d = new Data("roof-3.033_Cube.035", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.177929, -2.88115, 0.884854));
    v.add(new PVector(-2.177929, -4.440162, 0.884855));
    v.add(new PVector(0.643022, -4.440162, 0.884855));
    v.add(new PVector(0.643022, -2.88115, 0.884854));
    d = new Data("roof-3.034_Cube.036", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.177929, -4.440162, 0.660508));
    v.add(new PVector(0.643022, -4.440162, 0.660508));
    v.add(new PVector(0.643022, -4.440162, 0.884855));
    v.add(new PVector(-2.177929, -4.440162, 0.884855));
    d = new Data("roof-3.035_Cube.037", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.643022, -2.88115, 0.660508));
    v.add(new PVector(0.643022, -4.440162, 0.660508));
    v.add(new PVector(-2.177929, -4.440162, 0.660508));
    v.add(new PVector(-2.177929, -2.88115, 0.660508));
    d = new Data("roof-3.036_Cube.038", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.177929, -2.88115, 0.660508));
    v.add(new PVector(-2.177929, -4.440162, 0.660508));
    v.add(new PVector(-2.177929, -4.440162, 0.884855));
    v.add(new PVector(-2.177929, -2.88115, 0.884854));
    d = new Data("roof-3.037_Cube.039", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.177929, -2.88115, 1.347647));
    v.add(new PVector(-2.177929, -4.440162, 1.347648));
    v.add(new PVector(0.643022, -4.440162, 1.347648));
    v.add(new PVector(0.643022, -2.88115, 1.347647));
    d = new Data("roof-3.038_Cube.040", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.177929, -4.440162, 1.123301));
    v.add(new PVector(0.643022, -4.440162, 1.123301));
    v.add(new PVector(0.643022, -4.440162, 1.347648));
    v.add(new PVector(-2.177929, -4.440162, 1.347648));
    d = new Data("roof-3.039_Cube.041", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.643022, -2.88115, 1.1233));
    v.add(new PVector(0.643022, -4.440162, 1.123301));
    v.add(new PVector(-2.177929, -4.440162, 1.123301));
    v.add(new PVector(-2.177929, -2.88115, 1.1233));
    d = new Data("roof-3.040_Cube.042", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.177929, -2.88115, 1.1233));
    v.add(new PVector(-2.177929, -4.440162, 1.123301));
    v.add(new PVector(-2.177929, -4.440162, 1.347648));
    v.add(new PVector(-2.177929, -2.88115, 1.347647));
    d = new Data("roof-3.041_Cube.043", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.013126, -2.99202, 1.993377));
    v.add(new PVector(2.013126, -4.99202, 1.993378));
    v.add(new PVector(2.013126, -4.992021, -1.993375));
    v.add(new PVector(2.013126, -2.99202, -1.993376));
    d = new Data("roof-3.042_Cube.044", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.35, 0.0, 2.65));
    v.add(new PVector(-2.35, -2.0, 2.65));
    v.add(new PVector(-2.35, -2.0, 2.35));
    v.add(new PVector(-2.35, 0.0, 2.35));
    d = new Data("roof-3.043_Cube.045", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.35, -0.0, -2.35));
    v.add(new PVector(-2.35, -2.0, -2.35));
    v.add(new PVector(-2.35, -2.0, -2.65));
    v.add(new PVector(-2.35, -0.0, -2.65));
    d = new Data("roof-3.044_Cube.046", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.65, -0.0, -2.35));
    v.add(new PVector(2.65, -2.0, -2.35));
    v.add(new PVector(2.65, -2.0, -2.65));
    v.add(new PVector(2.65, -0.0, -2.65));
    d = new Data("roof-3.045_Cube.047", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.65, 0.0, 2.65));
    v.add(new PVector(2.65, -2.0, 2.65));
    v.add(new PVector(2.65, -2.0, 2.35));
    v.add(new PVector(2.65, 0.0, 2.35));
    d = new Data("roof-3.046_Cube.048", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.0, -2.025, 3.0));
    v.add(new PVector(3.0, -3.025, 3.0));
    v.add(new PVector(3.0, -3.025001, -3.0));
    v.add(new PVector(3.0, -2.025001, -3.0));
    d = new Data("roof-3.047_Cube.049", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.0, -2.025001, -3.0));
    v.add(new PVector(3.0, -3.025001, -3.0));
    v.add(new PVector(-3.0, -3.025001, -3.0));
    v.add(new PVector(-3.0, -2.025001, -3.0));
    d = new Data("roof-3.048_Cube.050", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.0, -2.025, 3.0));
    v.add(new PVector(-3.0, -3.025, 3.0));
    v.add(new PVector(3.0, -3.025, 3.0));
    v.add(new PVector(3.0, -2.025, 3.0));
    d = new Data("roof-3.049_Cube.051", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.0, -2.025001, -3.0));
    v.add(new PVector(-3.0, -3.025001, -3.0));
    v.add(new PVector(-3.0, -3.025, 3.0));
    v.add(new PVector(-3.0, -2.025, 3.0));
    d = new Data("roof-3.050_Cube.052", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.151691, -2.992019, 1.993377));
    v.add(new PVector(-0.151691, -4.99202, 1.993378));
    v.add(new PVector(-0.151691, -4.992021, -1.993375));
    v.add(new PVector(-0.151691, -2.992019, -1.993376));
    d = new Data("roof-3.051_Cube.053", 2, v);
    dd.add(d);

    roof = new Roof("roof-3", n, dd);
    p.add(roof);


    roofaddon = new ArrayList();
    top = new ArrayList();
    n = new RoofNext(roofaddon, top);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.324165, -2.039428, -2.324165));
    v.add(new PVector(-2.324165, -2.039428, -2.324165));
    v.add(new PVector(-2.324165, -2.039428, 2.324165));
    v.add(new PVector(2.324165, -2.039428, 2.324165));
    d = new Data("roof-4_Cube.007", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.324165, -2.420842, -2.324165));
    v.add(new PVector(2.324165, -2.420842, -2.324165));
    v.add(new PVector(2.324165, -2.420841, 2.324166));
    v.add(new PVector(-2.324165, -2.420841, 2.324166));
    d = new Data("roof-4.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.47035, 2.0));
    v.add(new PVector(-0.237761, -3.407842, 0.886606));
    v.add(new PVector(0.237761, -3.407842, 0.886606));
    v.add(new PVector(2.0, -2.47035, 2.0));
    d = new Data("roof-4.002_Cube.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.237761, -3.407842, 0.886606));
    v.add(new PVector(-0.237761, -3.407842, 0.886606));
    v.add(new PVector(-0.237761, -3.407842, -0.886604));
    v.add(new PVector(0.237761, -3.407842, -0.886604));
    d = new Data("roof-4.003_Cube.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -2.47035, -2.0));
    v.add(new PVector(0.237761, -3.407842, -0.886604));
    v.add(new PVector(-0.237761, -3.407842, -0.886604));
    v.add(new PVector(-2.0, -2.47035, -2.0));
    d = new Data("roof-4.004_Cube.004", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.0, -2.47035, -2.0));
    v.add(new PVector(-0.237761, -3.407842, -0.886604));
    v.add(new PVector(-0.237761, -3.407842, 0.886606));
    v.add(new PVector(-2.0, -2.47035, 2.0));
    d = new Data("roof-4.005_Cube.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.324165, -2.039428, 2.324165));
    v.add(new PVector(2.324165, -2.420841, 2.324166));
    v.add(new PVector(2.324165, -2.420842, -2.324165));
    v.add(new PVector(2.324165, -2.039428, -2.324165));
    d = new Data("roof-4.006_Cube.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.324165, -2.039428, -2.324165));
    v.add(new PVector(2.324165, -2.420842, -2.324165));
    v.add(new PVector(-2.324165, -2.420842, -2.324165));
    v.add(new PVector(-2.324165, -2.039428, -2.324165));
    d = new Data("roof-4.007_Cube.008", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.324165, -2.039428, 2.324165));
    v.add(new PVector(-2.324165, -2.420841, 2.324166));
    v.add(new PVector(2.324165, -2.420841, 2.324166));
    v.add(new PVector(2.324165, -2.039428, 2.324165));
    d = new Data("roof-4.008_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.324165, -2.039428, -2.324165));
    v.add(new PVector(-2.324165, -2.420842, -2.324165));
    v.add(new PVector(-2.324165, -2.420841, 2.324166));
    v.add(new PVector(-2.324165, -2.039428, 2.324165));
    d = new Data("roof-4.009_Cube.011", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.0, -2.47035, 2.0));
    v.add(new PVector(0.237761, -3.407842, 0.886606));
    v.add(new PVector(0.237761, -3.407842, -0.886604));
    v.add(new PVector(2.0, -2.47035, -2.0));
    d = new Data("roof-4.010_Cube.012", 2, v);
    dd.add(d);

    roof = new Roof("roof-4", n, dd);
    p.add(roof);


    roofaddon = new ArrayList();
    top = new ArrayList();
    n = new RoofNext(roofaddon, top);

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.791437, -2.011514, -2.535235));
    v.add(new PVector(0.791437, -2.011514, -2.535235));
    v.add(new PVector(0.791437, -2.011514, -1.195796));
    v.add(new PVector(2.791437, -2.011514, -1.195796));
    d = new Data("roof-5_Cube.021", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.791437, -4.011516, -2.535234));
    v.add(new PVector(2.791437, -4.011516, -2.535234));
    v.add(new PVector(2.791437, -4.011515, -1.195795));
    v.add(new PVector(0.791437, -4.011515, -1.195795));
    d = new Data("roof-5.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.791437, -2.011514, -1.0));
    v.add(new PVector(0.791437, -2.011514, -1.0));
    v.add(new PVector(0.791437, -2.011514, 1.0));
    v.add(new PVector(2.791437, -2.011514, 1.0));
    d = new Data("roof-5.002_Cube.002", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.791437, -4.011515, -0.999999));
    v.add(new PVector(2.791437, -4.011515, -0.999999));
    v.add(new PVector(2.791437, -4.011515, 1.000001));
    v.add(new PVector(0.791437, -4.011515, 1.000001));
    d = new Data("roof-5.003_Cube.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.577114, -2.011514, -1.0));
    v.add(new PVector(-2.416701, -2.011514, -1.0));
    v.add(new PVector(-2.416701, -2.011513, 2.351919));
    v.add(new PVector(0.577114, -2.011513, 2.351919));
    d = new Data("roof-5.004_Cube.004", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.416701, -2.425868, -1.0));
    v.add(new PVector(0.577114, -2.425868, -1.0));
    v.add(new PVector(0.577114, -2.425868, 2.351919));
    v.add(new PVector(-2.416701, -2.425868, 2.351919));
    d = new Data("roof-5.005_Cube.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.420701, -2.440247, 2.16487));
    v.add(new PVector(0.350245, -2.440247, 2.16487));
    v.add(new PVector(0.350245, -2.9514, 2.16487));
    v.add(new PVector(0.420701, -2.9514, 2.16487));
    d = new Data("roof-5.006_Cube.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.284348, -2.440247, 2.16487));
    v.add(new PVector(0.213891, -2.440247, 2.16487));
    v.add(new PVector(0.213891, -2.9514, 2.16487));
    v.add(new PVector(0.284348, -2.9514, 2.16487));
    d = new Data("roof-5.007_Cube.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.137819, -2.440247, 2.16487));
    v.add(new PVector(0.067362, -2.440247, 2.16487));
    v.add(new PVector(0.067362, -2.9514, 2.16487));
    v.add(new PVector(0.137819, -2.9514, 2.16487));
    d = new Data("roof-5.008_Cube.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.002605, -2.440247, 2.16487));
    v.add(new PVector(-0.073062, -2.440247, 2.16487));
    v.add(new PVector(-0.073062, -2.9514, 2.16487));
    v.add(new PVector(-0.002605, -2.9514, 2.16487));
    d = new Data("roof-5.009_Cube.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.143029, -2.440247, 2.16487));
    v.add(new PVector(-0.213486, -2.440247, 2.16487));
    v.add(new PVector(-0.213486, -2.9514, 2.16487));
    v.add(new PVector(-0.143029, -2.9514, 2.16487));
    d = new Data("roof-5.010_Cube.011", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.283453, -2.440247, 2.16487));
    v.add(new PVector(-0.353909, -2.440247, 2.16487));
    v.add(new PVector(-0.353909, -2.9514, 2.16487));
    v.add(new PVector(-0.283453, -2.9514, 2.16487));
    d = new Data("roof-5.011_Cube.012", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.423877, -2.440247, 2.16487));
    v.add(new PVector(-0.494333, -2.440247, 2.16487));
    v.add(new PVector(-0.494333, -2.9514, 2.16487));
    v.add(new PVector(-0.423877, -2.9514, 2.16487));
    d = new Data("roof-5.012_Cube.013", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.56023, -2.440247, 2.16487));
    v.add(new PVector(-0.630686, -2.440247, 2.16487));
    v.add(new PVector(-0.630686, -2.9514, 2.16487));
    v.add(new PVector(-0.56023, -2.9514, 2.16487));
    d = new Data("roof-5.013_Cube.014", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.698619, -2.440247, 2.16487));
    v.add(new PVector(-0.769075, -2.440247, 2.16487));
    v.add(new PVector(-0.769075, -2.9514, 2.16487));
    v.add(new PVector(-0.698619, -2.9514, 2.16487));
    d = new Data("roof-5.014_Cube.015", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.834972, -2.440247, 2.16487));
    v.add(new PVector(-0.905429, -2.440247, 2.16487));
    v.add(new PVector(-0.905429, -2.9514, 2.16487));
    v.add(new PVector(-0.834972, -2.9514, 2.16487));
    d = new Data("roof-5.015_Cube.016", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.973361, -2.440247, 2.16487));
    v.add(new PVector(-1.043817, -2.440247, 2.16487));
    v.add(new PVector(-1.043817, -2.9514, 2.16487));
    v.add(new PVector(-0.973361, -2.9514, 2.16487));
    d = new Data("roof-5.016_Cube.017", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.093433, -2.440247, 2.16487));
    v.add(new PVector(-1.16389, -2.440247, 2.16487));
    v.add(new PVector(-1.16389, -2.9514, 2.16487));
    v.add(new PVector(-1.093433, -2.9514, 2.16487));
    d = new Data("roof-5.017_Cube.018", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 2.154233));
    v.add(new PVector(-2.211313, -2.440247, 2.083776));
    v.add(new PVector(-2.211313, -2.9514, 2.083776));
    v.add(new PVector(-2.211313, -2.9514, 2.154233));
    d = new Data("roof-5.018_Cube.019", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 2.017879));
    v.add(new PVector(-2.211313, -2.440247, 1.947422));
    v.add(new PVector(-2.211313, -2.9514, 1.947423));
    v.add(new PVector(-2.211313, -2.9514, 2.017879));
    d = new Data("roof-5.019_Cube.020", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 1.871349));
    v.add(new PVector(-2.211313, -2.440247, 1.800893));
    v.add(new PVector(-2.211313, -2.9514, 1.800893));
    v.add(new PVector(-2.211313, -2.9514, 1.871349));
    d = new Data("roof-5.020_Cube.022", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 1.730925));
    v.add(new PVector(-2.211313, -2.440247, 1.660469));
    v.add(new PVector(-2.211313, -2.9514, 1.66047));
    v.add(new PVector(-2.211313, -2.9514, 1.730925));
    d = new Data("roof-5.021_Cube.023", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 1.590502));
    v.add(new PVector(-2.211313, -2.440247, 1.520045));
    v.add(new PVector(-2.211313, -2.9514, 1.520046));
    v.add(new PVector(-2.211313, -2.9514, 1.590503));
    d = new Data("roof-5.022_Cube.024", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 1.450078));
    v.add(new PVector(-2.211313, -2.440247, 1.379621));
    v.add(new PVector(-2.211313, -2.9514, 1.379622));
    v.add(new PVector(-2.211313, -2.9514, 1.450078));
    d = new Data("roof-5.023_Cube.025", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 1.309654));
    v.add(new PVector(-2.211313, -2.440247, 1.239197));
    v.add(new PVector(-2.211313, -2.9514, 1.239197));
    v.add(new PVector(-2.211313, -2.9514, 1.309654));
    d = new Data("roof-5.024_Cube.026", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 1.173301));
    v.add(new PVector(-2.211313, -2.440247, 1.102844));
    v.add(new PVector(-2.211313, -2.9514, 1.102844));
    v.add(new PVector(-2.211313, -2.9514, 1.173301));
    d = new Data("roof-5.025_Cube.027", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 1.034912));
    v.add(new PVector(-2.211313, -2.440247, 0.964455));
    v.add(new PVector(-2.211313, -2.9514, 0.964455));
    v.add(new PVector(-2.211313, -2.9514, 1.034912));
    d = new Data("roof-5.026_Cube.028", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 0.898559));
    v.add(new PVector(-2.211313, -2.440247, 0.828102));
    v.add(new PVector(-2.211313, -2.9514, 0.828102));
    v.add(new PVector(-2.211313, -2.9514, 0.898559));
    d = new Data("roof-5.027_Cube.029", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 0.76017));
    v.add(new PVector(-2.211313, -2.440247, 0.689713));
    v.add(new PVector(-2.211313, -2.9514, 0.689713));
    v.add(new PVector(-2.211313, -2.9514, 0.76017));
    d = new Data("roof-5.028_Cube.030", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.211313, -2.440247, 0.640097));
    v.add(new PVector(-2.211313, -2.440247, 0.569641));
    v.add(new PVector(-2.211313, -2.9514, 0.569641));
    v.add(new PVector(-2.211313, -2.9514, 0.640097));
    d = new Data("roof-5.029_Cube.031", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.58623, -2.011514, -1.819418));
    v.add(new PVector(-1.41377, -2.011514, -1.819418));
    v.add(new PVector(-1.41377, -2.011514, -1.206297));
    v.add(new PVector(0.58623, -2.011514, -1.206297));
    d = new Data("roof-5.030_Cube.032", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.41377, -3.350716, -1.819417));
    v.add(new PVector(0.58623, -3.350716, -1.819417));
    v.add(new PVector(0.58623, -3.350716, -1.206296));
    v.add(new PVector(-1.41377, -3.350716, -1.206296));
    d = new Data("roof-5.031_Cube.033", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.58623, -3.426471, -1.819417));
    v.add(new PVector(-1.41377, -3.426471, -1.819417));
    v.add(new PVector(-1.41377, -3.426471, 2.392937));
    v.add(new PVector(0.58623, -3.426471, 2.392937));
    d = new Data("roof-5.032_Cube.034", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.41377, -3.604734, -1.819417));
    v.add(new PVector(0.58623, -3.604734, -1.819417));
    v.add(new PVector(0.58623, -3.604733, 2.392937));
    v.add(new PVector(-1.41377, -3.604733, 2.392937));
    d = new Data("roof-5.033_Cube.035", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.581399, -2.022456, 1.009937));
    v.add(new PVector(2.510942, -2.022456, 1.009937));
    v.add(new PVector(2.510942, -4.003615, 1.009938));
    v.add(new PVector(2.581399, -4.003615, 1.009938));
    d = new Data("roof-5.034_Cube.036", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.445045, -2.022456, 1.009937));
    v.add(new PVector(2.374589, -2.022456, 1.009937));
    v.add(new PVector(2.374589, -4.003615, 1.009938));
    v.add(new PVector(2.445045, -4.003615, 1.009938));
    d = new Data("roof-5.035_Cube.037", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.298516, -2.022456, 1.009937));
    v.add(new PVector(2.22806, -2.022456, 1.009937));
    v.add(new PVector(2.22806, -4.003615, 1.009938));
    v.add(new PVector(2.298516, -4.003615, 1.009938));
    d = new Data("roof-5.036_Cube.038", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.158092, -2.022456, 1.009937));
    v.add(new PVector(2.087636, -2.022456, 1.009937));
    v.add(new PVector(2.087636, -4.003615, 1.009938));
    v.add(new PVector(2.158092, -4.003615, 1.009938));
    d = new Data("roof-5.037_Cube.039", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.017669, -2.022456, 1.009937));
    v.add(new PVector(1.947212, -2.022456, 1.009937));
    v.add(new PVector(1.947212, -4.003615, 1.009938));
    v.add(new PVector(2.017669, -4.003615, 1.009938));
    d = new Data("roof-5.038_Cube.040", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.791437, -2.011514, -1.195796));
    v.add(new PVector(2.791437, -4.011515, -1.195795));
    v.add(new PVector(2.791437, -4.011516, -2.535234));
    v.add(new PVector(2.791437, -2.011514, -2.535235));
    d = new Data("roof-5.039_Cube.041", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.791437, -2.011514, -2.535235));
    v.add(new PVector(2.791437, -4.011516, -2.535234));
    v.add(new PVector(0.791437, -4.011516, -2.535234));
    v.add(new PVector(0.791437, -2.011514, -2.535235));
    d = new Data("roof-5.040_Cube.042", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.791437, -2.011514, -1.195796));
    v.add(new PVector(0.791437, -4.011515, -1.195795));
    v.add(new PVector(2.791437, -4.011515, -1.195795));
    v.add(new PVector(2.791437, -2.011514, -1.195796));
    d = new Data("roof-5.041_Cube.043", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.791437, -2.011514, -2.535235));
    v.add(new PVector(0.791437, -4.011516, -2.535234));
    v.add(new PVector(0.791437, -4.011515, -1.195795));
    v.add(new PVector(0.791437, -2.011514, -1.195796));
    d = new Data("roof-5.042_Cube.044", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.791437, -2.011514, 1.0));
    v.add(new PVector(2.791437, -4.011515, 1.000001));
    v.add(new PVector(2.791437, -4.011515, -0.999999));
    v.add(new PVector(2.791437, -2.011514, -1.0));
    d = new Data("roof-5.043_Cube.045", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.791437, -2.011514, -1.0));
    v.add(new PVector(2.791437, -4.011515, -0.999999));
    v.add(new PVector(0.791437, -4.011515, -0.999999));
    v.add(new PVector(0.791437, -2.011514, -1.0));
    d = new Data("roof-5.044_Cube.046", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.791437, -2.011514, 1.0));
    v.add(new PVector(0.791437, -4.011515, 1.000001));
    v.add(new PVector(2.791437, -4.011515, 1.000001));
    v.add(new PVector(2.791437, -2.011514, 1.0));
    d = new Data("roof-5.045_Cube.047", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.791437, -2.011514, -1.0));
    v.add(new PVector(0.791437, -4.011515, -0.999999));
    v.add(new PVector(0.791437, -4.011515, 1.000001));
    v.add(new PVector(0.791437, -2.011514, 1.0));
    d = new Data("roof-5.046_Cube.048", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.577114, -2.011513, 2.351919));
    v.add(new PVector(0.577114, -2.425868, 2.351919));
    v.add(new PVector(0.577114, -2.425868, -1.0));
    v.add(new PVector(0.577114, -2.011514, -1.0));
    d = new Data("roof-5.047_Cube.049", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.577114, -2.011514, -1.0));
    v.add(new PVector(0.577114, -2.425868, -1.0));
    v.add(new PVector(-2.416701, -2.425868, -1.0));
    v.add(new PVector(-2.416701, -2.011514, -1.0));
    d = new Data("roof-5.048_Cube.050", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.416701, -2.011513, 2.351919));
    v.add(new PVector(-2.416701, -2.425868, 2.351919));
    v.add(new PVector(0.577114, -2.425868, 2.351919));
    v.add(new PVector(0.577114, -2.011513, 2.351919));
    d = new Data("roof-5.049_Cube.051", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.416701, -2.011514, -1.0));
    v.add(new PVector(-2.416701, -2.425868, -1.0));
    v.add(new PVector(-2.416701, -2.425868, 2.351919));
    v.add(new PVector(-2.416701, -2.011513, 2.351919));
    d = new Data("roof-5.050_Cube.052", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.58623, -2.011514, -1.206297));
    v.add(new PVector(0.58623, -3.350716, -1.206296));
    v.add(new PVector(0.58623, -3.350716, -1.819417));
    v.add(new PVector(0.58623, -2.011514, -1.819418));
    d = new Data("roof-5.051_Cube.053", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.58623, -2.011514, -1.819418));
    v.add(new PVector(0.58623, -3.350716, -1.819417));
    v.add(new PVector(-1.41377, -3.350716, -1.819417));
    v.add(new PVector(-1.41377, -2.011514, -1.819418));
    d = new Data("roof-5.052_Cube.054", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.41377, -2.011514, -1.206297));
    v.add(new PVector(-1.41377, -3.350716, -1.206296));
    v.add(new PVector(0.58623, -3.350716, -1.206296));
    v.add(new PVector(0.58623, -2.011514, -1.206297));
    d = new Data("roof-5.053_Cube.055", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.41377, -2.011514, -1.819418));
    v.add(new PVector(-1.41377, -3.350716, -1.819417));
    v.add(new PVector(-1.41377, -3.350716, -1.206296));
    v.add(new PVector(-1.41377, -2.011514, -1.206297));
    d = new Data("roof-5.054_Cube.056", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.58623, -3.426471, 2.392937));
    v.add(new PVector(0.58623, -3.604733, 2.392937));
    v.add(new PVector(0.58623, -3.604734, -1.819417));
    v.add(new PVector(0.58623, -3.426471, -1.819417));
    d = new Data("roof-5.055_Cube.057", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.58623, -3.426471, -1.819417));
    v.add(new PVector(0.58623, -3.604734, -1.819417));
    v.add(new PVector(-1.41377, -3.604734, -1.819417));
    v.add(new PVector(-1.41377, -3.426471, -1.819417));
    d = new Data("roof-5.056_Cube.058", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.41377, -3.426471, 2.392937));
    v.add(new PVector(-1.41377, -3.604733, 2.392937));
    v.add(new PVector(0.58623, -3.604733, 2.392937));
    v.add(new PVector(0.58623, -3.426471, 2.392937));
    d = new Data("roof-5.057_Cube.059", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.41377, -3.426471, -1.819417));
    v.add(new PVector(-1.41377, -3.604734, -1.819417));
    v.add(new PVector(-1.41377, -3.604733, 2.392937));
    v.add(new PVector(-1.41377, -3.426471, 2.392937));
    d = new Data("roof-5.058_Cube.060", 4, v);
    dd.add(d);

    roof = new Roof("roof-5", n, dd);
    p.add(roof);


    return p;
  }

  class Roofaddon {
    String id;
    ArrayList<Data> data;
    Roofaddon(String id, ArrayList<Data> data) {
      this.id = id;
      this.data = data;
    }
  }

  ArrayList<Roofaddon> getRoofaddonData() {
    ArrayList<Data> dd;
    ArrayList<PVector> v;
    Data d;
    Roofaddon roofaddon;

    ArrayList<Roofaddon> p = new ArrayList();

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-0.837501, -3.048156, 2.4239289999999998));
    v.add(new PVector(-0.907958, -3.048156, 2.4239289999999998));
    v.add(new PVector(-0.907958, -3.997427, 2.42393));
    v.add(new PVector(-0.837501, -3.997427, 2.42393));
    d = new Data("roofaddon-0_Plane.013", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.973855, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.044311, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.044311, -3.997427, 2.42393));
    v.add(new PVector(-0.973855, -3.997427, 2.42393));
    d = new Data("roofaddon-0.001_Plane.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.120384, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.19084, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.19084, -3.997427, 2.42393));
    v.add(new PVector(-1.120384, -3.997427, 2.42393));
    d = new Data("roofaddon-0.002_Plane.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.260808, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.331264, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.331264, -3.997427, 2.42393));
    v.add(new PVector(-1.260808, -3.997427, 2.42393));
    d = new Data("roofaddon-0.003_Plane.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.401232, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.471688, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.471688, -3.997427, 2.42393));
    v.add(new PVector(-1.401232, -3.997427, 2.42393));
    d = new Data("roofaddon-0.004_Plane.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.541655, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.612112, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.612112, -3.997427, 2.42393));
    v.add(new PVector(-1.541655, -3.997427, 2.42393));
    d = new Data("roofaddon-0.005_Plane.005", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.682079, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.752536, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.752536, -3.997427, 2.42393));
    v.add(new PVector(-1.682079, -3.997427, 2.42393));
    d = new Data("roofaddon-0.006_Plane.006", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.818433, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.888889, -3.048156, 2.4239289999999998));
    v.add(new PVector(-1.888889, -3.997427, 2.42393));
    v.add(new PVector(-1.818433, -3.997427, 2.42393));
    d = new Data("roofaddon-0.007_Plane.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.956821, -3.048156, 2.4239289999999998));
    v.add(new PVector(-2.027278, -3.048156, 2.4239289999999998));
    v.add(new PVector(-2.027278, -3.997427, 2.42393));
    v.add(new PVector(-1.956821, -3.997427, 2.42393));
    d = new Data("roofaddon-0.008_Plane.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.093174, -3.048156, 2.4239289999999998));
    v.add(new PVector(-2.163631, -3.048156, 2.4239289999999998));
    v.add(new PVector(-2.163631, -3.997427, 2.42393));
    v.add(new PVector(-2.093174, -3.997427, 2.42393));
    d = new Data("roofaddon-0.009_Plane.009", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.231563, -3.048156, 2.4239289999999998));
    v.add(new PVector(-2.30202, -3.048156, 2.4239289999999998));
    v.add(new PVector(-2.30202, -3.997427, 2.42393));
    v.add(new PVector(-2.231563, -3.997427, 2.42393));
    d = new Data("roofaddon-0.010_Plane.010", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.351636, -3.048156, 2.4239289999999998));
    v.add(new PVector(-2.422092, -3.048156, 2.4239289999999998));
    v.add(new PVector(-2.422092, -3.997427, 2.42393));
    v.add(new PVector(-2.351636, -3.997427, 2.42393));
    d = new Data("roofaddon-0.011_Plane.011", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.837501, -3.048156, -2.423928));
    v.add(new PVector(0.907958, -3.048156, -2.423928));
    v.add(new PVector(0.907958, -3.997428, -2.423928));
    v.add(new PVector(0.837501, -3.997428, -2.423928));
    d = new Data("roofaddon-0.012_Plane.012", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.973855, -3.048156, -2.423928));
    v.add(new PVector(1.044311, -3.048156, -2.423928));
    v.add(new PVector(1.044311, -3.997428, -2.423928));
    v.add(new PVector(0.973855, -3.997428, -2.423928));
    d = new Data("roofaddon-0.013_Plane.014", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.120384, -3.048156, -2.423928));
    v.add(new PVector(1.19084, -3.048156, -2.423928));
    v.add(new PVector(1.19084, -3.997428, -2.423928));
    v.add(new PVector(1.120384, -3.997428, -2.423928));
    d = new Data("roofaddon-0.014_Plane.015", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.260808, -3.048156, -2.423928));
    v.add(new PVector(1.331264, -3.048156, -2.423928));
    v.add(new PVector(1.331264, -3.997428, -2.423928));
    v.add(new PVector(1.260808, -3.997428, -2.423928));
    d = new Data("roofaddon-0.015_Plane.016", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.401231, -3.048156, -2.423928));
    v.add(new PVector(1.471688, -3.048156, -2.423928));
    v.add(new PVector(1.471688, -3.997428, -2.423928));
    v.add(new PVector(1.401231, -3.997428, -2.423928));
    d = new Data("roofaddon-0.016_Plane.017", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.541655, -3.048156, -2.423928));
    v.add(new PVector(1.612111, -3.048156, -2.423928));
    v.add(new PVector(1.612111, -3.997428, -2.423928));
    v.add(new PVector(1.541655, -3.997428, -2.423928));
    d = new Data("roofaddon-0.017_Plane.018", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.682079, -3.048156, -2.423928));
    v.add(new PVector(1.752535, -3.048156, -2.423928));
    v.add(new PVector(1.752535, -3.997428, -2.423928));
    v.add(new PVector(1.682079, -3.997428, -2.423928));
    d = new Data("roofaddon-0.018_Plane.019", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.818432, -3.048156, -2.423928));
    v.add(new PVector(1.888889, -3.048156, -2.423928));
    v.add(new PVector(1.888889, -3.997428, -2.423928));
    v.add(new PVector(1.818432, -3.997428, -2.423928));
    d = new Data("roofaddon-0.019_Plane.020", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.956821, -3.048156, -2.423928));
    v.add(new PVector(2.027277, -3.048156, -2.423928));
    v.add(new PVector(2.027277, -3.997428, -2.423928));
    v.add(new PVector(1.956821, -3.997428, -2.423928));
    d = new Data("roofaddon-0.020_Plane.021", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.093174, -3.048156, -2.423928));
    v.add(new PVector(2.16363, -3.048156, -2.423928));
    v.add(new PVector(2.16363, -3.997428, -2.423928));
    v.add(new PVector(2.093174, -3.997428, -2.423928));
    d = new Data("roofaddon-0.021_Plane.022", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.231563, -3.048156, -2.423928));
    v.add(new PVector(2.302019, -3.048156, -2.423928));
    v.add(new PVector(2.302019, -3.997428, -2.423928));
    v.add(new PVector(2.231563, -3.997428, -2.423928));
    d = new Data("roofaddon-0.022_Plane.023", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.351635, -3.048156, -2.423928));
    v.add(new PVector(2.422092, -3.048156, -2.423928));
    v.add(new PVector(2.422092, -3.997428, -2.423928));
    v.add(new PVector(2.351635, -3.997428, -2.423928));
    d = new Data("roofaddon-0.023_Plane.024", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -0.837501));
    v.add(new PVector(-2.4239289999999998, -3.048156, -0.907957));
    v.add(new PVector(-2.4239289999999998, -3.997428, -0.907956));
    v.add(new PVector(-2.4239289999999998, -3.997428, -0.8375));
    d = new Data("roofaddon-0.024_Plane.025", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -0.973854));
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.044311));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.04431));
    v.add(new PVector(-2.4239289999999998, -3.997428, -0.973853));
    d = new Data("roofaddon-0.025_Plane.026", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.120384));
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.19084));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.190839));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.120383));
    d = new Data("roofaddon-0.026_Plane.027", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.260807));
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.331264));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.331263));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.260806));
    d = new Data("roofaddon-0.027_Plane.028", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.401231));
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.471688));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.471687));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.40123));
    d = new Data("roofaddon-0.028_Plane.029", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.541654));
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.61211));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.61211));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.541654));
    d = new Data("roofaddon-0.029_Plane.030", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.682078));
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.752535));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.752534));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.682078));
    d = new Data("roofaddon-0.030_Plane.031", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.818431));
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.888888));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.888888));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.818431));
    d = new Data("roofaddon-0.031_Plane.032", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -1.95682));
    v.add(new PVector(-2.4239289999999998, -3.048156, -2.027277));
    v.add(new PVector(-2.4239289999999998, -3.997428, -2.027276));
    v.add(new PVector(-2.4239289999999998, -3.997428, -1.95682));
    d = new Data("roofaddon-0.032_Plane.033", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -2.093174));
    v.add(new PVector(-2.4239289999999998, -3.048156, -2.16363));
    v.add(new PVector(-2.4239289999999998, -3.997428, -2.163629));
    v.add(new PVector(-2.4239289999999998, -3.997428, -2.093173));
    d = new Data("roofaddon-0.033_Plane.034", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -2.231563));
    v.add(new PVector(-2.4239289999999998, -3.048156, -2.302018));
    v.add(new PVector(-2.4239289999999998, -3.997428, -2.302018));
    v.add(new PVector(-2.4239289999999998, -3.997428, -2.231562));
    d = new Data("roofaddon-0.034_Plane.035", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -3.048156, -2.351635));
    v.add(new PVector(-2.4239289999999998, -3.048156, -2.422091));
    v.add(new PVector(-2.4239289999999998, -3.997428, -2.422091));
    v.add(new PVector(-2.4239289999999998, -3.997428, -2.351634));
    d = new Data("roofaddon-0.035_Plane.036", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 0.837501));
    v.add(new PVector(2.4239289999999998, -3.048156, 0.907958));
    v.add(new PVector(2.4239289999999998, -3.997428, 0.907959));
    v.add(new PVector(2.4239289999999998, -3.997428, 0.837502));
    d = new Data("roofaddon-0.036_Plane.037", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 0.973854));
    v.add(new PVector(2.4239289999999998, -3.048156, 1.044312));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.044312));
    v.add(new PVector(2.4239289999999998, -3.997428, 0.973855));
    d = new Data("roofaddon-0.037_Plane.038", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 1.120384));
    v.add(new PVector(2.4239289999999998, -3.048156, 1.19084));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.190841));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.120385));
    d = new Data("roofaddon-0.038_Plane.039", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 1.260808));
    v.add(new PVector(2.4239289999999998, -3.048156, 1.331264));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.331265));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.260809));
    d = new Data("roofaddon-0.039_Plane.040", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 1.401232));
    v.add(new PVector(2.4239289999999998, -3.048156, 1.471689));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.471689));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.401232));
    d = new Data("roofaddon-0.040_Plane.041", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 1.541655));
    v.add(new PVector(2.4239289999999998, -3.048156, 1.612111));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.612112));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.541656));
    d = new Data("roofaddon-0.041_Plane.042", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 1.682079));
    v.add(new PVector(2.4239289999999998, -3.048156, 1.752535));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.752536));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.68208));
    d = new Data("roofaddon-0.042_Plane.043", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 1.818432));
    v.add(new PVector(2.4239289999999998, -3.048156, 1.888889));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.88889));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.818433));
    d = new Data("roofaddon-0.043_Plane.044", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 1.956821));
    v.add(new PVector(2.4239289999999998, -3.048156, 2.027277));
    v.add(new PVector(2.4239289999999998, -3.997428, 2.027278));
    v.add(new PVector(2.4239289999999998, -3.997428, 1.956822));
    d = new Data("roofaddon-0.044_Plane.045", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 2.093174));
    v.add(new PVector(2.4239289999999998, -3.048156, 2.16363));
    v.add(new PVector(2.4239289999999998, -3.997428, 2.163631));
    v.add(new PVector(2.4239289999999998, -3.997428, 2.093175));
    d = new Data("roofaddon-0.045_Plane.046", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 2.231564));
    v.add(new PVector(2.4239289999999998, -3.048156, 2.302019));
    v.add(new PVector(2.4239289999999998, -3.997427, 2.30202));
    v.add(new PVector(2.4239289999999998, -3.997427, 2.231564));
    d = new Data("roofaddon-0.046_Plane.047", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -3.048156, 2.351635));
    v.add(new PVector(2.4239289999999998, -3.048156, 2.422092));
    v.add(new PVector(2.4239289999999998, -3.997427, 2.422093));
    v.add(new PVector(2.4239289999999998, -3.997427, 2.351636));
    d = new Data("roofaddon-0.047_Plane.048", 2, v);
    dd.add(d);

    roofaddon = new Roofaddon("roofaddon-0", dd);
    p.add(roofaddon);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(0.837502, -2.685915, -2.423928));
    v.add(new PVector(0.907958, -2.685915, -2.423928));
    v.add(new PVector(0.907958, -3.414826, -2.423928));
    v.add(new PVector(0.837502, -3.414826, -2.423928));
    d = new Data("roofaddon-1_Plane.015", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.973855, -2.685915, -2.423928));
    v.add(new PVector(1.044312, -2.685915, -2.423928));
    v.add(new PVector(1.044312, -3.414826, -2.423928));
    v.add(new PVector(0.973855, -3.414826, -2.423928));
    d = new Data("roofaddon-1.001_Plane.001", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.120384, -2.685915, -2.423928));
    v.add(new PVector(1.190841, -2.685915, -2.423928));
    v.add(new PVector(1.190841, -3.414826, -2.423928));
    v.add(new PVector(1.120384, -3.414826, -2.423928));
    d = new Data("roofaddon-1.002_Plane.002", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.260808, -2.685915, -2.423928));
    v.add(new PVector(1.331265, -2.685915, -2.423928));
    v.add(new PVector(1.331265, -3.414826, -2.423928));
    v.add(new PVector(1.260808, -3.414826, -2.423928));
    d = new Data("roofaddon-1.003_Plane.003", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.401232, -2.685915, -2.423928));
    v.add(new PVector(1.471688, -2.685915, -2.423928));
    v.add(new PVector(1.471688, -3.414826, -2.423928));
    v.add(new PVector(1.401232, -3.414826, -2.423928));
    d = new Data("roofaddon-1.004_Plane.004", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.541656, -2.685915, -2.423928));
    v.add(new PVector(1.612112, -2.685915, -2.423928));
    v.add(new PVector(1.612112, -3.414826, -2.423928));
    v.add(new PVector(1.541656, -3.414826, -2.423928));
    d = new Data("roofaddon-1.005_Plane.005", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.682079, -2.685915, -2.423928));
    v.add(new PVector(1.752536, -2.685915, -2.423928));
    v.add(new PVector(1.752536, -3.414826, -2.423928));
    v.add(new PVector(1.682079, -3.414826, -2.423928));
    d = new Data("roofaddon-1.006_Plane.006", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.818433, -2.685915, -2.423928));
    v.add(new PVector(1.888889, -2.685915, -2.423928));
    v.add(new PVector(1.888889, -3.414826, -2.423928));
    v.add(new PVector(1.818433, -3.414826, -2.423928));
    d = new Data("roofaddon-1.007_Plane.007", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(1.956822, -2.685915, -2.423928));
    v.add(new PVector(2.027278, -2.685915, -2.423928));
    v.add(new PVector(2.027278, -3.414826, -2.423928));
    v.add(new PVector(1.956822, -3.414826, -2.423928));
    d = new Data("roofaddon-1.008_Plane.008", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.093175, -2.685915, -2.423928));
    v.add(new PVector(2.163631, -2.685915, -2.423928));
    v.add(new PVector(2.163631, -3.414826, -2.423928));
    v.add(new PVector(2.093175, -3.414826, -2.423928));
    d = new Data("roofaddon-1.009_Plane.009", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.231564, -2.685915, -2.423928));
    v.add(new PVector(2.30202, -2.685915, -2.423928));
    v.add(new PVector(2.30202, -3.414826, -2.423928));
    v.add(new PVector(2.231564, -3.414826, -2.423928));
    d = new Data("roofaddon-1.010_Plane.010", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.351636, -2.685915, -2.423928));
    v.add(new PVector(2.422093, -2.685915, -2.423928));
    v.add(new PVector(2.422093, -3.414826, -2.423928));
    v.add(new PVector(2.351636, -3.414826, -2.423928));
    d = new Data("roofaddon-1.011_Plane.011", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.837501, -2.685915, 2.4239289999999998));
    v.add(new PVector(-0.907958, -2.685915, 2.4239289999999998));
    v.add(new PVector(-0.907958, -3.414825, 2.4239289999999998));
    v.add(new PVector(-0.837501, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.012_Plane.012", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.973855, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.044311, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.044311, -3.414825, 2.4239289999999998));
    v.add(new PVector(-0.973855, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.013_Plane.013", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.120384, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.19084, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.19084, -3.414825, 2.4239289999999998));
    v.add(new PVector(-1.120384, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.014_Plane.014", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.260808, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.331264, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.331264, -3.414825, 2.4239289999999998));
    v.add(new PVector(-1.260808, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.015_Plane.016", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.401232, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.471688, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.471688, -3.414825, 2.4239289999999998));
    v.add(new PVector(-1.401232, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.016_Plane.017", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.541655, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.612112, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.612112, -3.414825, 2.4239289999999998));
    v.add(new PVector(-1.541655, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.017_Plane.018", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.682079, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.752536, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.752536, -3.414825, 2.4239289999999998));
    v.add(new PVector(-1.682079, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.018_Plane.019", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.818433, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.888889, -2.685915, 2.4239289999999998));
    v.add(new PVector(-1.888889, -3.414825, 2.4239289999999998));
    v.add(new PVector(-1.818433, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.019_Plane.020", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-1.956821, -2.685915, 2.4239289999999998));
    v.add(new PVector(-2.027278, -2.685915, 2.4239289999999998));
    v.add(new PVector(-2.027278, -3.414825, 2.4239289999999998));
    v.add(new PVector(-1.956821, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.020_Plane.021", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.093174, -2.685915, 2.4239289999999998));
    v.add(new PVector(-2.163631, -2.685915, 2.4239289999999998));
    v.add(new PVector(-2.163631, -3.414825, 2.4239289999999998));
    v.add(new PVector(-2.093174, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.021_Plane.022", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.231563, -2.685915, 2.4239289999999998));
    v.add(new PVector(-2.30202, -2.685915, 2.4239289999999998));
    v.add(new PVector(-2.30202, -3.414825, 2.4239289999999998));
    v.add(new PVector(-2.231563, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.022_Plane.023", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.351636, -2.685915, 2.4239289999999998));
    v.add(new PVector(-2.422092, -2.685915, 2.4239289999999998));
    v.add(new PVector(-2.422092, -3.414825, 2.4239289999999998));
    v.add(new PVector(-2.351636, -3.414825, 2.4239289999999998));
    d = new Data("roofaddon-1.023_Plane.024", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 0.837501));
    v.add(new PVector(2.4239289999999998, -2.685915, 0.907958));
    v.add(new PVector(2.4239289999999998, -3.414826, 0.907959));
    v.add(new PVector(2.4239289999999998, -3.414826, 0.837502));
    d = new Data("roofaddon-1.024_Plane.025", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 0.973855));
    v.add(new PVector(2.4239289999999998, -2.685915, 1.044312));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.044312));
    v.add(new PVector(2.4239289999999998, -3.414826, 0.973856));
    d = new Data("roofaddon-1.025_Plane.026", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 1.120384));
    v.add(new PVector(2.4239289999999998, -2.685915, 1.19084));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.190841));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.120385));
    d = new Data("roofaddon-1.026_Plane.027", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 1.260808));
    v.add(new PVector(2.4239289999999998, -2.685915, 1.331264));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.331265));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.260809));
    d = new Data("roofaddon-1.027_Plane.028", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 1.401232));
    v.add(new PVector(2.4239289999999998, -2.685915, 1.471689));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.471689));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.401232));
    d = new Data("roofaddon-1.028_Plane.029", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 1.541655));
    v.add(new PVector(2.4239289999999998, -2.685915, 1.612113));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.612113));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.541656));
    d = new Data("roofaddon-1.029_Plane.030", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 1.682079));
    v.add(new PVector(2.4239289999999998, -2.685915, 1.752535));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.752536));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.68208));
    d = new Data("roofaddon-1.030_Plane.031", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 1.818432));
    v.add(new PVector(2.4239289999999998, -2.685915, 1.888889));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.88889));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.818433));
    d = new Data("roofaddon-1.031_Plane.032", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 1.956821));
    v.add(new PVector(2.4239289999999998, -2.685915, 2.027278));
    v.add(new PVector(2.4239289999999998, -3.414826, 2.027278));
    v.add(new PVector(2.4239289999999998, -3.414826, 1.956822));
    d = new Data("roofaddon-1.032_Plane.033", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 2.093174));
    v.add(new PVector(2.4239289999999998, -2.685915, 2.163631));
    v.add(new PVector(2.4239289999999998, -3.414826, 2.163631));
    v.add(new PVector(2.4239289999999998, -3.414826, 2.093174));
    d = new Data("roofaddon-1.033_Plane.034", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 2.231564));
    v.add(new PVector(2.4239289999999998, -2.685915, 2.302021));
    v.add(new PVector(2.4239289999999998, -3.414825, 2.302021));
    v.add(new PVector(2.4239289999999998, -3.414825, 2.231564));
    d = new Data("roofaddon-1.034_Plane.035", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.4239289999999998, -2.685915, 2.351636));
    v.add(new PVector(2.4239289999999998, -2.685915, 2.422092));
    v.add(new PVector(2.4239289999999998, -3.414825, 2.422092));
    v.add(new PVector(2.4239289999999998, -3.414825, 2.351636));
    d = new Data("roofaddon-1.035_Plane.036", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -0.837501));
    v.add(new PVector(-2.4239289999999998, -2.685915, -0.907958));
    v.add(new PVector(-2.4239289999999998, -3.414826, -0.907957));
    v.add(new PVector(-2.4239289999999998, -3.414826, -0.8375));
    d = new Data("roofaddon-1.036_Plane.037", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -0.973855));
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.044311));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.04431));
    v.add(new PVector(-2.4239289999999998, -3.414826, -0.973854));
    d = new Data("roofaddon-1.037_Plane.038", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.120384));
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.19084));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.190839));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.120383));
    d = new Data("roofaddon-1.038_Plane.039", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.260808));
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.331264));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.331263));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.260807));
    d = new Data("roofaddon-1.039_Plane.040", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.401232));
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.471688));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.471687));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.401231));
    d = new Data("roofaddon-1.040_Plane.041", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.541654));
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.612112));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.612111));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.541654));
    d = new Data("roofaddon-1.041_Plane.042", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.682078));
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.752536));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.752535));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.682078));
    d = new Data("roofaddon-1.042_Plane.043", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.818433));
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.888888));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.888888));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.818432));
    d = new Data("roofaddon-1.043_Plane.044", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -1.95682));
    v.add(new PVector(-2.4239289999999998, -2.685915, -2.027277));
    v.add(new PVector(-2.4239289999999998, -3.414826, -2.027277));
    v.add(new PVector(-2.4239289999999998, -3.414826, -1.95682));
    d = new Data("roofaddon-1.044_Plane.045", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -2.093174));
    v.add(new PVector(-2.4239289999999998, -2.685915, -2.16363));
    v.add(new PVector(-2.4239289999999998, -3.414826, -2.16363));
    v.add(new PVector(-2.4239289999999998, -3.414826, -2.093174));
    d = new Data("roofaddon-1.045_Plane.046", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -2.231563));
    v.add(new PVector(-2.4239289999999998, -2.685915, -2.30202));
    v.add(new PVector(-2.4239289999999998, -3.414826, -2.30202));
    v.add(new PVector(-2.4239289999999998, -3.414826, -2.231563));
    d = new Data("roofaddon-1.046_Plane.047", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.4239289999999998, -2.685915, -2.351635));
    v.add(new PVector(-2.4239289999999998, -2.685915, -2.422091));
    v.add(new PVector(-2.4239289999999998, -3.414826, -2.422091));
    v.add(new PVector(-2.4239289999999998, -3.414826, -2.351635));
    d = new Data("roofaddon-1.047_Plane.048", 4, v);
    dd.add(d);

    roofaddon = new Roofaddon("roofaddon-1", dd);
    p.add(roofaddon);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.649778, -3.325337, 2.649778));
    v.add(new PVector(-2.649778, -3.325337, 2.649778));
    v.add(new PVector(-2.649778, -3.325338, -2.649777));
    v.add(new PVector(2.649778, -3.325338, -2.649777));
    d = new Data("roofaddon-2_Plane", 0, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.649778, -3.201894, 2.649778));
    v.add(new PVector(-2.649778, -3.201894, 2.649778));
    v.add(new PVector(-2.649778, -3.201895, -2.649777));
    v.add(new PVector(2.649778, -3.201895, -2.649777));
    d = new Data("roofaddon-2.001_Plane.001", 0, v);
    dd.add(d);

    roofaddon = new Roofaddon("roofaddon-2", dd);
    p.add(roofaddon);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.482485, -2.968596, 2.482486));
    v.add(new PVector(-2.482485, -2.968596, 2.482486));
    v.add(new PVector(-2.482485, -2.968597, -2.482485));
    v.add(new PVector(2.482485, -2.968597, -2.482485));
    d = new Data("roofaddon-3_Plane.008", 0, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.482485, -2.852947, 2.482486));
    v.add(new PVector(-2.482485, -2.852947, 2.482486));
    v.add(new PVector(-2.482485, -2.852947, -2.482485));
    v.add(new PVector(2.482485, -2.852947, -2.482485));
    d = new Data("roofaddon-3.001_Plane.001", 0, v);
    dd.add(d);

    roofaddon = new Roofaddon("roofaddon-3", dd);
    p.add(roofaddon);


    return p;
  }

  class Top {
    String id;
    ArrayList<Data> data;
    Top(String id, ArrayList<Data> data) {
      this.id = id;
      this.data = data;
    }
  }

  ArrayList<Top> getTopData() {
    ArrayList<Data> dd;
    ArrayList<PVector> v;
    Data d;
    Top top;

    ArrayList<Top> p = new ArrayList();

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.156187, -5.316606, -2.156186));
    v.add(new PVector(-2.156187, -5.316606, -2.156186));
    v.add(new PVector(-2.156187, -5.316605, 2.156188));
    v.add(new PVector(2.156187, -5.316605, 2.156188));
    d = new Data("top-0_Cube.033", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.156187, -5.604828, -2.156186));
    v.add(new PVector(2.156187, -5.604828, -2.156186));
    v.add(new PVector(2.156187, -5.604827, 2.156188));
    v.add(new PVector(-2.156187, -5.604827, 2.156188));
    d = new Data("top-0.001_Cube.001", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.156187, -5.316605, 2.156188));
    v.add(new PVector(2.156187, -5.604827, 2.156188));
    v.add(new PVector(2.156187, -5.604828, -2.156186));
    v.add(new PVector(2.156187, -5.316606, -2.156186));
    d = new Data("top-0.002_Cube.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.156187, -5.316606, -2.156186));
    v.add(new PVector(2.156187, -5.604828, -2.156186));
    v.add(new PVector(-2.156187, -5.604828, -2.156186));
    v.add(new PVector(-2.156187, -5.316606, -2.156186));
    d = new Data("top-0.003_Cube.003", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.156187, -5.316605, 2.156188));
    v.add(new PVector(-2.156187, -5.604827, 2.156188));
    v.add(new PVector(2.156187, -5.604827, 2.156188));
    v.add(new PVector(2.156187, -5.316605, 2.156188));
    d = new Data("top-0.004_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.156187, -5.316606, -2.156186));
    v.add(new PVector(-2.156187, -5.604828, -2.156186));
    v.add(new PVector(-2.156187, -5.604827, 2.156188));
    v.add(new PVector(-2.156187, -5.316605, 2.156188));
    d = new Data("top-0.005_Cube.005", 4, v);
    dd.add(d);

    top = new Top("top-0", dd);
    p.add(top);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.156187, -5.316606, -2.156186));
    v.add(new PVector(-2.156187, -5.316606, -2.156186));
    v.add(new PVector(-2.156187, -5.316605, 2.156188));
    v.add(new PVector(2.156187, -5.316605, 2.156188));
    d = new Data("top-1_Cube.001", 5, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.156187, -5.604828, -2.156186));
    v.add(new PVector(2.156187, -5.604828, -2.156186));
    v.add(new PVector(2.156187, -5.604827, 2.156188));
    v.add(new PVector(-2.156187, -5.604827, 2.156188));
    d = new Data("top-1.001_Cube.002", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.209919, -7.604414, 0.509808));
    v.add(new PVector(0.209919, -7.604414, 0.953165));
    v.add(new PVector(-0.233438, -7.604414, 0.953165));
    v.add(new PVector(-0.233438, -7.604414, 0.509808));
    d = new Data("top-1.002_Cube.003", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.233438, -7.604414, 0.953165));
    v.add(new PVector(0.209919, -7.604414, 0.953165));
    v.add(new PVector(0.209919, -5.69574, 0.953165));
    v.add(new PVector(-0.233438, -5.69574, 0.953165));
    d = new Data("top-1.003_Cube.004", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.209919, -7.604414, 0.509808));
    v.add(new PVector(-0.233438, -7.604414, 0.509808));
    v.add(new PVector(-0.233438, -5.69574, 0.509808));
    v.add(new PVector(0.209919, -5.69574, 0.509808));
    d = new Data("top-1.004_Cube.005", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.233438, -7.604414, 0.509808));
    v.add(new PVector(-0.233438, -7.604414, 0.953165));
    v.add(new PVector(-0.233438, -5.69574, 0.953165));
    v.add(new PVector(-0.233438, -5.69574, 0.509808));
    d = new Data("top-1.005_Cube.006", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.041604, -8.149169, -0.421787));
    v.add(new PVector(-0.041604, -8.149169, 0.349194));
    v.add(new PVector(-0.812585, -8.149169, 0.349194));
    v.add(new PVector(-0.812585, -8.149169, -0.421787));
    d = new Data("top-1.006_Cube.007", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.812585, -8.149169, 0.349194));
    v.add(new PVector(-0.041604, -8.149169, 0.349194));
    v.add(new PVector(-0.041604, -5.685934, 0.349194));
    v.add(new PVector(-0.812585, -5.685934, 0.349194));
    d = new Data("top-1.007_Cube.008", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.041604, -8.149169, -0.421787));
    v.add(new PVector(-0.812585, -8.149169, -0.421787));
    v.add(new PVector(-0.812585, -5.685934, -0.421787));
    v.add(new PVector(-0.041604, -5.685934, -0.421787));
    d = new Data("top-1.008_Cube.010", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.812585, -8.149169, -0.421787));
    v.add(new PVector(-0.812585, -8.149169, 0.349194));
    v.add(new PVector(-0.812585, -5.685934, 0.349194));
    v.add(new PVector(-0.812585, -5.685934, -0.421787));
    d = new Data("top-1.009_Cube.011", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.562747, -8.540187, -0.712487));
    v.add(new PVector(0.562747, -8.540187, -0.26913));
    v.add(new PVector(0.11939, -8.540187, -0.26913));
    v.add(new PVector(0.11939, -8.540187, -0.712487));
    d = new Data("top-1.010_Cube.012", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.11939, -8.540187, -0.26913));
    v.add(new PVector(0.562747, -8.540187, -0.26913));
    v.add(new PVector(0.562747, -5.69574, -0.26913));
    v.add(new PVector(0.11939, -5.69574, -0.26913));
    d = new Data("top-1.011_Cube.013", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.562747, -8.540187, -0.712487));
    v.add(new PVector(0.11939, -8.540187, -0.712487));
    v.add(new PVector(0.11939, -5.69574, -0.712487));
    v.add(new PVector(0.562747, -5.69574, -0.712487));
    d = new Data("top-1.012_Cube.014", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.11939, -8.540187, -0.712487));
    v.add(new PVector(0.11939, -8.540187, -0.26913));
    v.add(new PVector(0.11939, -5.69574, -0.26913));
    v.add(new PVector(0.11939, -5.69574, -0.712487));
    d = new Data("top-1.013_Cube.015", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.156187, -5.316605, 2.156188));
    v.add(new PVector(2.156187, -5.604827, 2.156188));
    v.add(new PVector(2.156187, -5.604828, -2.156186));
    v.add(new PVector(2.156187, -5.316606, -2.156186));
    d = new Data("top-1.014_Cube.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.156187, -5.316606, -2.156186));
    v.add(new PVector(2.156187, -5.604828, -2.156186));
    v.add(new PVector(-2.156187, -5.604828, -2.156186));
    v.add(new PVector(-2.156187, -5.316606, -2.156186));
    d = new Data("top-1.015_Cube.017", 3, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.156187, -5.316605, 2.156188));
    v.add(new PVector(-2.156187, -5.604827, 2.156188));
    v.add(new PVector(2.156187, -5.604827, 2.156188));
    v.add(new PVector(2.156187, -5.316605, 2.156188));
    d = new Data("top-1.016_Cube.018", 1, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.156187, -5.316606, -2.156186));
    v.add(new PVector(-2.156187, -5.604828, -2.156186));
    v.add(new PVector(-2.156187, -5.604827, 2.156188));
    v.add(new PVector(-2.156187, -5.316605, 2.156188));
    d = new Data("top-1.017_Cube.019", 4, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.209919, -7.604414, 0.953165));
    v.add(new PVector(0.209919, -7.604414, 0.509808));
    v.add(new PVector(0.209919, -5.69574, 0.509808));
    v.add(new PVector(0.209919, -5.69574, 0.953165));
    d = new Data("top-1.018_Cube.020", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-0.041604, -8.149169, 0.349194));
    v.add(new PVector(-0.041604, -8.149169, -0.421787));
    v.add(new PVector(-0.041604, -5.685934, -0.421787));
    v.add(new PVector(-0.041604, -5.685934, 0.349194));
    d = new Data("top-1.019_Cube.021", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(0.562747, -8.540187, -0.26913));
    v.add(new PVector(0.562747, -8.540187, -0.712487));
    v.add(new PVector(0.562747, -5.69574, -0.712487));
    v.add(new PVector(0.562747, -5.69574, -0.26913));
    d = new Data("top-1.020_Cube.022", 2, v);
    dd.add(d);

    top = new Top("top-1", dd);
    p.add(top);


    return p;
  }

  class Trees {
    String id;
    ArrayList<Data> data;
    Trees(String id, ArrayList<Data> data) {
      this.id = id;
      this.data = data;
    }
  }

  ArrayList<Trees> getTreesData() {
    ArrayList<Data> dd;
    ArrayList<PVector> v;
    Data d;
    Trees trees;

    ArrayList<Trees> p = new ArrayList();

    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(2.662915, -0.239909, 3.93365));
    v.add(new PVector(2.946779, -0.239909, 4.07703));
    v.add(new PVector(3.230643, -0.239909, 3.93365));
    v.add(new PVector(3.212881, -0.239909, 3.616127));
    v.add(new PVector(2.946779, -0.239909, 3.441983));
    v.add(new PVector(2.680677, -0.239909, 3.616127));
    d = new Data("trees-0_Cone.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.946779, -0.939726, 3.551613));
    v.add(new PVector(3.135701, -0.939726, 3.878835));
    v.add(new PVector(2.757857, -0.939726, 3.878835));
    d = new Data("trees-0.001_Cone.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.638042, -0.370191, 3.591512));
    v.add(new PVector(2.757857, -0.939726, 3.878835));
    v.add(new PVector(2.568935, -0.503429, 3.98791));
    d = new Data("trees-0.002_Cone.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.212881, -0.239909, 3.616127));
    v.add(new PVector(3.255516, -0.370191, 3.591512));
    v.add(new PVector(2.946779, -0.503429, 3.333465));
    v.add(new PVector(2.946779, -0.239909, 3.441983));
    d = new Data("trees-0.003_Cone.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.946779, -0.239909, 4.07703));
    v.add(new PVector(2.946779, -0.370191, 4.126261));
    v.add(new PVector(3.324623, -0.503429, 3.98791));
    v.add(new PVector(3.230643, -0.239909, 3.93365));
    d = new Data("trees-0.004_Cone.004", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.638042, -0.370191, 3.591512));
    v.add(new PVector(2.946779, -0.939726, 3.551613));
    v.add(new PVector(2.757857, -0.939726, 3.878835));
    d = new Data("trees-0.005_Cone.005", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.946779, -0.01449, 3.728406));
    v.add(new PVector(2.910964, -0.01449, 3.790439));
    v.add(new PVector(2.982594, -0.01449, 3.790439));
    d = new Data("trees-0.006_Cone.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.982594, -0.01449, 3.790439));
    v.add(new PVector(2.982594, -0.263759, 3.790439));
    v.add(new PVector(2.946779, -0.263759, 3.728406));
    v.add(new PVector(2.946779, -0.01449, 3.728406));
    d = new Data("trees-0.007_Cone.008", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.910964, -0.01449, 3.790439));
    v.add(new PVector(2.910964, -0.263759, 3.790439));
    v.add(new PVector(2.982594, -0.263759, 3.790439));
    v.add(new PVector(2.982594, -0.01449, 3.790439));
    d = new Data("trees-0.008_Cone.009", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.659793, -0.078851, 3.550184));
    v.add(new PVector(-2.934045, -0.078851, 3.550184));
    v.add(new PVector(-3.055642, -0.078851, 3.760796));
    v.add(new PVector(-2.918516, -0.078851, 3.998305));
    v.add(new PVector(-2.675322, -0.078851, 3.998305));
    v.add(new PVector(-2.538197, -0.078851, 3.760795));
    d = new Data("trees-0.009_Cone.010", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.659793, -0.078851, 3.550184));
    v.add(new PVector(-2.796919, -0.324149, 3.435324));
    v.add(new PVector(-2.934045, -0.078851, 3.550184));
    d = new Data("trees-0.010_Cone.011", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.055642, -0.078851, 3.760796));
    v.add(new PVector(-3.08655, -0.324149, 3.93698));
    v.add(new PVector(-2.918516, -0.078851, 3.998305));
    d = new Data("trees-0.011_Cone.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.675322, -0.078851, 3.998305));
    v.add(new PVector(-2.507288, -0.324149, 3.93698));
    v.add(new PVector(-2.538197, -0.078851, 3.760795));
    d = new Data("trees-0.012_Cone.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.903136, -0.747726, 3.831086));
    v.add(new PVector(-2.796919, -0.747726, 3.647112));
    v.add(new PVector(-2.690702, -0.747726, 3.831086));
    d = new Data("trees-0.013_Cone.014", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.370872, -0.296191, 2.916497));
    v.add(new PVector(3.721329, -0.296191, 3.093512));
    v.add(new PVector(4.071785, -0.296191, 2.916497));
    v.add(new PVector(4.049856, -0.296191, 2.524486));
    v.add(new PVector(3.721328, -0.296191, 2.309489));
    v.add(new PVector(3.392801, -0.296191, 2.524486));
    d = new Data("trees-0.014_Cone.015", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.337235, -0.648877, 2.492405));
    v.add(new PVector(3.721328, -1.078841, 2.320675));
    v.add(new PVector(3.721328, -1.350402, 2.714161));
    v.add(new PVector(3.38056, -1.07884, 2.910904));
    d = new Data("trees-0.015_Cone.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.340164, -0.460487, 2.494096));
    v.add(new PVector(3.337235, -0.648877, 2.492405));
    v.add(new PVector(3.38056, -1.07884, 2.910904));
    v.add(new PVector(3.254846, -0.621531, 2.983485));
    d = new Data("trees-0.016_Cone.017", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.049856, -0.296191, 2.524486));
    v.add(new PVector(4.102493, -0.460487, 2.494096));
    v.add(new PVector(3.721328, -0.621531, 2.175513));
    v.add(new PVector(3.721328, -0.296191, 2.309489));
    d = new Data("trees-0.017_Cone.018", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.721328, -1.078841, 2.320675));
    v.add(new PVector(4.105422, -0.648877, 2.492405));
    v.add(new PVector(3.721328, -1.350402, 2.714161));
    d = new Data("trees-0.018_Cone.019", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.105422, -0.648877, 2.492405));
    v.add(new PVector(4.062098, -1.07884, 2.910904));
    v.add(new PVector(3.721328, -1.350402, 2.714161));
    d = new Data("trees-0.019_Cone.020", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.721329, -0.296191, 3.093512));
    v.add(new PVector(3.721329, -0.460487, 3.154292));
    v.add(new PVector(4.187812, -0.621531, 2.983485));
    v.add(new PVector(4.071785, -0.296191, 2.916497));
    d = new Data("trees-0.020_Cone.021", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.721328, -0.621531, 2.175513));
    v.add(new PVector(3.721328, -1.078841, 2.320675));
    v.add(new PVector(3.337235, -0.648877, 2.492405));
    v.add(new PVector(3.340164, -0.460487, 2.494096));
    d = new Data("trees-0.021_Cone.022", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.721328, -0.01789, 2.663105));
    v.add(new PVector(3.677112, -0.01789, 2.73969));
    v.add(new PVector(3.765545, -0.01789, 2.73969));
    d = new Data("trees-0.022_Cone.023", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.765545, -0.01789, 2.73969));
    v.add(new PVector(3.765545, -0.325637, 2.73969));
    v.add(new PVector(3.721328, -0.325637, 2.663105));
    v.add(new PVector(3.721328, -0.01789, 2.663105));
    d = new Data("trees-0.023_Cone.024", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.677112, -0.01789, 2.73969));
    v.add(new PVector(3.677112, -0.325637, 2.73969));
    v.add(new PVector(3.765545, -0.325637, 2.73969));
    v.add(new PVector(3.765545, -0.01789, 2.73969));
    d = new Data("trees-0.024_Cone.025", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.721329, -0.648876, 3.157674));
    v.add(new PVector(3.38056, -1.07884, 2.910904));
    v.add(new PVector(3.721328, -1.350402, 2.714161));
    v.add(new PVector(4.062098, -1.07884, 2.910904));
    d = new Data("trees-0.025_Cone.026", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.777464, -0.228921, 2.870543));
    v.add(new PVector(-3.506602, -0.228921, 3.007355));
    v.add(new PVector(-3.23574, -0.228921, 2.870543));
    v.add(new PVector(-3.252689, -0.228921, 2.567564));
    v.add(new PVector(-3.506602, -0.228921, 2.401397));
    v.add(new PVector(-3.760515, -0.228921, 2.567564));
    d = new Data("trees-0.026_Cone.027", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.80346, -0.501505, 2.54277));
    v.add(new PVector(-3.506602, -0.833816, 2.410043));
    v.add(new PVector(-3.506602, -1.043701, 2.714161));
    v.add(new PVector(-3.769976, -0.833816, 2.86622));
    d = new Data("trees-0.027_Cone.028", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.801197, -0.355902, 2.544077));
    v.add(new PVector(-3.80346, -0.501505, 2.54277));
    v.add(new PVector(-3.769976, -0.833816, 2.86622));
    v.add(new PVector(-3.867139, -0.48037, 2.922317));
    d = new Data("trees-0.028_Cone.029", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.252689, -0.228921, 2.567564));
    v.add(new PVector(-3.212007, -0.355902, 2.544076));
    v.add(new PVector(-3.506602, -0.48037, 2.29785));
    v.add(new PVector(-3.506602, -0.228921, 2.401397));
    d = new Data("trees-0.029_Cone.030", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.506602, -0.833816, 2.410043));
    v.add(new PVector(-3.209743, -0.501505, 2.54277));
    v.add(new PVector(-3.506602, -1.043701, 2.714161));
    d = new Data("trees-0.030_Cone.031", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.209743, -0.501505, 2.54277));
    v.add(new PVector(-3.2432280000000002, -0.833816, 2.86622));
    v.add(new PVector(-3.506602, -1.043701, 2.714161));
    d = new Data("trees-0.031_Cone.032", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.506602, -0.228921, 3.007355));
    v.add(new PVector(-3.506602, -0.355901, 3.05433));
    v.add(new PVector(-3.146065, -0.48037, 2.922317));
    v.add(new PVector(-3.23574, -0.228921, 2.870543));
    d = new Data("trees-0.032_Cone.033", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.506602, -0.48037, 2.29785));
    v.add(new PVector(-3.506602, -0.833816, 2.410043));
    v.add(new PVector(-3.80346, -0.501505, 2.54277));
    v.add(new PVector(-3.801197, -0.355902, 2.544077));
    d = new Data("trees-0.033_Cone.034", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.506602, -0.013827, 2.6747));
    v.add(new PVector(-3.540776, -0.013827, 2.733892));
    v.add(new PVector(-3.472428, -0.013827, 2.733892));
    d = new Data("trees-0.034_Cone.035", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.472428, -0.013827, 2.733892));
    v.add(new PVector(-3.472428, -0.251678, 2.733892));
    v.add(new PVector(-3.506602, -0.251678, 2.6747));
    v.add(new PVector(-3.506602, -0.013827, 2.6747));
    d = new Data("trees-0.035_Cone.036", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.540776, -0.013827, 2.733892));
    v.add(new PVector(-3.540776, -0.251678, 2.733892));
    v.add(new PVector(-3.472428, -0.251678, 2.733892));
    v.add(new PVector(-3.472428, -0.013827, 2.733892));
    d = new Data("trees-0.036_Cone.037", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.506602, -0.501505, 3.056944));
    v.add(new PVector(-3.769976, -0.833816, 2.86622));
    v.add(new PVector(-3.506602, -1.043701, 2.714161));
    v.add(new PVector(-3.2432280000000002, -0.833816, 2.86622));
    d = new Data("trees-0.037_Cone.038", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.568935, -0.503429, 3.98791));
    v.add(new PVector(2.757857, -0.939726, 3.878835));
    v.add(new PVector(2.946779, -0.370191, 4.126261));
    d = new Data("trees-0.038_Cone.039", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.946779, -0.370191, 4.126261));
    v.add(new PVector(2.757857, -0.939726, 3.878835));
    v.add(new PVector(3.135701, -0.939726, 3.878835));
    d = new Data("trees-0.039_Cone.040", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.946779, -0.239909, 4.07703));
    v.add(new PVector(2.662915, -0.239909, 3.93365));
    v.add(new PVector(2.568935, -0.503429, 3.98791));
    v.add(new PVector(2.946779, -0.370191, 4.126261));
    d = new Data("trees-0.040_Cone.041", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.680677, -0.239909, 3.616127));
    v.add(new PVector(2.638042, -0.370191, 3.591512));
    v.add(new PVector(2.568935, -0.503429, 3.98791));
    v.add(new PVector(2.662915, -0.239909, 3.93365));
    d = new Data("trees-0.041_Cone.042", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.946779, -0.939726, 3.551613));
    v.add(new PVector(2.946779, -0.503429, 3.333465));
    v.add(new PVector(3.255516, -0.370191, 3.591512));
    d = new Data("trees-0.042_Cone.043", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.680677, -0.239909, 3.616127));
    v.add(new PVector(2.946779, -0.239909, 3.441983));
    v.add(new PVector(2.946779, -0.503429, 3.333465));
    v.add(new PVector(2.638042, -0.370191, 3.591512));
    d = new Data("trees-0.043_Cone.044", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.946779, -0.503429, 3.333465));
    v.add(new PVector(2.946779, -0.939726, 3.551613));
    v.add(new PVector(2.638042, -0.370191, 3.591512));
    d = new Data("trees-0.044_Cone.045", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.135701, -0.939726, 3.878835));
    v.add(new PVector(2.946779, -0.939726, 3.551613));
    v.add(new PVector(3.255516, -0.370191, 3.591512));
    d = new Data("trees-0.045_Cone.046", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.324623, -0.503429, 3.98791));
    v.add(new PVector(3.135701, -0.939726, 3.878835));
    v.add(new PVector(3.255516, -0.370191, 3.591512));
    d = new Data("trees-0.046_Cone.047", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.946779, -0.370191, 4.126261));
    v.add(new PVector(3.135701, -0.939726, 3.878835));
    v.add(new PVector(3.324623, -0.503429, 3.98791));
    d = new Data("trees-0.047_Cone.048", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.212881, -0.239909, 3.616127));
    v.add(new PVector(3.230643, -0.239909, 3.93365));
    v.add(new PVector(3.324623, -0.503429, 3.98791));
    v.add(new PVector(3.255516, -0.370191, 3.591512));
    d = new Data("trees-0.048_Cone.049", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.946779, -0.01449, 3.728406));
    v.add(new PVector(2.946779, -0.263759, 3.728406));
    v.add(new PVector(2.910964, -0.263759, 3.790439));
    v.add(new PVector(2.910964, -0.01449, 3.790439));
    d = new Data("trees-0.049_Cone.050", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.934045, -0.078851, 3.550184));
    v.add(new PVector(-2.796919, -0.324149, 3.435324));
    v.add(new PVector(-2.796919, -0.747726, 3.647112));
    v.add(new PVector(-2.903136, -0.747726, 3.831086));
    v.add(new PVector(-3.08655, -0.324149, 3.93698));
    v.add(new PVector(-3.055642, -0.078851, 3.760796));
    d = new Data("trees-0.050_Cone.051", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.538197, -0.078851, 3.760795));
    v.add(new PVector(-2.507288, -0.324149, 3.93698));
    v.add(new PVector(-2.690702, -0.747726, 3.831086));
    v.add(new PVector(-2.796919, -0.747726, 3.647112));
    v.add(new PVector(-2.796919, -0.324149, 3.435324));
    v.add(new PVector(-2.659793, -0.078851, 3.550184));
    d = new Data("trees-0.051_Cone.052", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.918516, -0.078851, 3.998305));
    v.add(new PVector(-3.08655, -0.324149, 3.93698));
    v.add(new PVector(-2.903136, -0.747726, 3.831086));
    v.add(new PVector(-2.690702, -0.747726, 3.831086));
    v.add(new PVector(-2.507288, -0.324149, 3.93698));
    v.add(new PVector(-2.675322, -0.078851, 3.998305));
    d = new Data("trees-0.052_Cone.053", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.254846, -0.621531, 2.983485));
    v.add(new PVector(3.38056, -1.07884, 2.910904));
    v.add(new PVector(3.721329, -0.648876, 3.157674));
    v.add(new PVector(3.721329, -0.460487, 3.154292));
    d = new Data("trees-0.053_Cone.054", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.721329, -0.296191, 3.093512));
    v.add(new PVector(3.370872, -0.296191, 2.916497));
    v.add(new PVector(3.254846, -0.621531, 2.983485));
    v.add(new PVector(3.721329, -0.460487, 3.154292));
    d = new Data("trees-0.054_Cone.055", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.392801, -0.296191, 2.524486));
    v.add(new PVector(3.340164, -0.460487, 2.494096));
    v.add(new PVector(3.254846, -0.621531, 2.983485));
    v.add(new PVector(3.370872, -0.296191, 2.916497));
    d = new Data("trees-0.055_Cone.056", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.721328, -1.078841, 2.320675));
    v.add(new PVector(3.721328, -0.621531, 2.175513));
    v.add(new PVector(4.102493, -0.460487, 2.494096));
    v.add(new PVector(4.105422, -0.648877, 2.492405));
    d = new Data("trees-0.056_Cone.057", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.392801, -0.296191, 2.524486));
    v.add(new PVector(3.721328, -0.296191, 2.309489));
    v.add(new PVector(3.721328, -0.621531, 2.175513));
    v.add(new PVector(3.340164, -0.460487, 2.494096));
    d = new Data("trees-0.057_Cone.058", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.187812, -0.621531, 2.983485));
    v.add(new PVector(4.062098, -1.07884, 2.910904));
    v.add(new PVector(4.105422, -0.648877, 2.492405));
    v.add(new PVector(4.102493, -0.460487, 2.494096));
    d = new Data("trees-0.058_Cone.059", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.721329, -0.460487, 3.154292));
    v.add(new PVector(3.721329, -0.648876, 3.157674));
    v.add(new PVector(4.062098, -1.07884, 2.910904));
    v.add(new PVector(4.187812, -0.621531, 2.983485));
    d = new Data("trees-0.059_Cone.060", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.049856, -0.296191, 2.524486));
    v.add(new PVector(4.071785, -0.296191, 2.916497));
    v.add(new PVector(4.187812, -0.621531, 2.983485));
    v.add(new PVector(4.102493, -0.460487, 2.494096));
    d = new Data("trees-0.060_Cone.061", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.721328, -0.01789, 2.663105));
    v.add(new PVector(3.721328, -0.325637, 2.663105));
    v.add(new PVector(3.677112, -0.325637, 2.73969));
    v.add(new PVector(3.677112, -0.01789, 2.73969));
    d = new Data("trees-0.063_Cone.064", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.867139, -0.48037, 2.922317));
    v.add(new PVector(-3.769976, -0.833816, 2.86622));
    v.add(new PVector(-3.506602, -0.501505, 3.056944));
    v.add(new PVector(-3.506602, -0.355901, 3.05433));
    d = new Data("trees-0.064_Cone.065", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.506602, -0.228921, 3.007355));
    v.add(new PVector(-3.777464, -0.228921, 2.870543));
    v.add(new PVector(-3.867139, -0.48037, 2.922317));
    v.add(new PVector(-3.506602, -0.355901, 3.05433));
    d = new Data("trees-0.065_Cone.066", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.760515, -0.228921, 2.567564));
    v.add(new PVector(-3.801197, -0.355902, 2.544077));
    v.add(new PVector(-3.867139, -0.48037, 2.922317));
    v.add(new PVector(-3.777464, -0.228921, 2.870543));
    d = new Data("trees-0.066_Cone.067", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.506602, -0.833816, 2.410043));
    v.add(new PVector(-3.506602, -0.48037, 2.29785));
    v.add(new PVector(-3.212007, -0.355902, 2.544076));
    v.add(new PVector(-3.209743, -0.501505, 2.54277));
    d = new Data("trees-0.067_Cone.068", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.760515, -0.228921, 2.567564));
    v.add(new PVector(-3.506602, -0.228921, 2.401397));
    v.add(new PVector(-3.506602, -0.48037, 2.29785));
    v.add(new PVector(-3.801197, -0.355902, 2.544077));
    d = new Data("trees-0.068_Cone.069", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.146065, -0.48037, 2.922317));
    v.add(new PVector(-3.2432280000000002, -0.833816, 2.86622));
    v.add(new PVector(-3.209743, -0.501505, 2.54277));
    v.add(new PVector(-3.212007, -0.355902, 2.544076));
    d = new Data("trees-0.069_Cone.070", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.506602, -0.355901, 3.05433));
    v.add(new PVector(-3.506602, -0.501505, 3.056944));
    v.add(new PVector(-3.2432280000000002, -0.833816, 2.86622));
    v.add(new PVector(-3.146065, -0.48037, 2.922317));
    d = new Data("trees-0.070_Cone.071", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.252689, -0.228921, 2.567564));
    v.add(new PVector(-3.23574, -0.228921, 2.870543));
    v.add(new PVector(-3.146065, -0.48037, 2.922317));
    v.add(new PVector(-3.212007, -0.355902, 2.544076));
    d = new Data("trees-0.071_Cone.072", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.506602, -0.013827, 2.6747));
    v.add(new PVector(-3.506602, -0.251678, 2.6747));
    v.add(new PVector(-3.540776, -0.251678, 2.733892));
    v.add(new PVector(-3.540776, -0.013827, 2.733892));
    d = new Data("trees-0.074_Cone.075", 2, v);
    dd.add(d);

    trees = new Trees("trees-0", dd);
    p.add(trees);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-3.218287, -0.092546, 0.351088));
    v.add(new PVector(-3.467907, -0.092546, 0.304755));
    v.add(new PVector(-3.614165, -0.092546, 0.475908));
    v.add(new PVector(-3.529481, -0.092546, 0.715252));
    v.add(new PVector(-3.30813, -0.092546, 0.756338));
    v.add(new PVector(-3.143193, -0.092546, 0.563327));
    d = new Data("trees-1_Cone.011", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.218287, -0.092546, 0.351088));
    v.add(new PVector(-3.323692, -0.380445, 0.223378));
    v.add(new PVector(-3.467907, -0.092546, 0.304755));
    d = new Data("trees-1.001_Cone.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.614165, -0.092546, 0.475908));
    v.add(new PVector(-3.672063, -0.380445, 0.631046));
    v.add(new PVector(-3.529481, -0.092546, 0.715252));
    d = new Data("trees-1.002_Cone.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.30813, -0.092546, 0.756338));
    v.add(new PVector(-3.144826, -0.380445, 0.72891));
    v.add(new PVector(-3.143193, -0.092546, 0.563327));
    d = new Data("trees-1.003_Cone.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.487232, -0.877584, 0.56565));
    v.add(new PVector(-3.359473, -0.877584, 0.416144));
    v.add(new PVector(-3.293877, -0.877584, 0.60154));
    d = new Data("trees-1.004_Cone.004", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.114982, -0.072996, 1.979641));
    v.add(new PVector(-3.273298, -0.072996, 1.781164));
    v.add(new PVector(-3.495912, -0.072996, 1.814742));
    v.add(new PVector(-3.588641, -0.072996, 2.051086));
    v.add(new PVector(-3.448254, -0.072996, 2.227086));
    v.add(new PVector(-3.197209, -0.072996, 2.18922));
    d = new Data("trees-1.005_Cone.005", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.114982, -0.072996, 1.979641));
    v.add(new PVector(-3.111015, -0.300077, 1.814098));
    v.add(new PVector(-3.273298, -0.072996, 1.781164));
    d = new Data("trees-1.006_Cone.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.495912, -0.072996, 1.814742));
    v.add(new PVector(-3.64126, -0.300077, 1.894078));
    v.add(new PVector(-3.588641, -0.072996, 2.051086));
    d = new Data("trees-1.007_Cone.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.448254, -0.072996, 2.227086));
    v.add(new PVector(-3.306873, -0.300077, 2.313293));
    v.add(new PVector(-3.197209, -0.072996, 2.18922));
    d = new Data("trees-1.008_Cone.008", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.458746, -0.692196, 1.965687));
    v.add(new PVector(-3.264287, -0.692196, 1.936356));
    v.add(new PVector(-3.336115, -0.692196, 2.119427));
    d = new Data("trees-1.009_Cone.009", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.17348, -0.113811, 1.125174));
    v.add(new PVector(-3.423577, -0.113811, 1.081488));
    v.add(new PVector(-3.568013, -0.113811, 1.254181));
    v.add(new PVector(-3.480797, -0.113811, 1.492615));
    v.add(new PVector(-3.259023, -0.113811, 1.531353));
    v.add(new PVector(-3.096141, -0.113811, 1.336605));
    d = new Data("trees-1.010_Cone.010", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.17348, -0.113811, 1.125174));
    v.add(new PVector(-3.280233, -0.467862, 0.998587));
    v.add(new PVector(-3.423577, -0.113811, 1.081488));
    d = new Data("trees-1.011_Cone.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.568013, -0.113811, 1.254181));
    v.add(new PVector(-3.624264, -0.467862, 1.409925));
    v.add(new PVector(-3.480797, -0.113811, 1.492615));
    d = new Data("trees-1.012_Cone.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.259023, -0.113811, 1.531353));
    v.add(new PVector(-3.096019, -0.467862, 1.502196));
    v.add(new PVector(-3.096141, -0.113811, 1.336605));
    d = new Data("trees-1.013_Cone.014", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.440136, -1.07923, 1.342574));
    v.add(new PVector(-3.313968, -1.07923, 1.191722));
    v.add(new PVector(-3.246411, -1.07923, 1.376412));
    d = new Data("trees-1.014_Cone.015", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.446248, -0.092546, 1.836439));
    v.add(new PVector(3.196627, -0.092546, 1.790105));
    v.add(new PVector(3.05037, -0.092546, 1.961258));
    v.add(new PVector(3.135055, -0.092546, 2.200603));
    v.add(new PVector(3.356406, -0.092546, 2.241689));
    v.add(new PVector(3.521342, -0.092546, 2.048678));
    d = new Data("trees-1.015_Cone.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.446248, -0.092546, 1.836439));
    v.add(new PVector(3.340843, -0.380445, 1.708728));
    v.add(new PVector(3.196627, -0.092546, 1.790105));
    d = new Data("trees-1.016_Cone.017", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.05037, -0.092546, 1.961258));
    v.add(new PVector(2.992472, -0.380445, 2.116397));
    v.add(new PVector(3.135055, -0.092546, 2.200603));
    d = new Data("trees-1.017_Cone.018", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.356406, -0.092546, 2.241689));
    v.add(new PVector(3.519708, -0.380445, 2.214261));
    v.add(new PVector(3.521342, -0.092546, 2.048678));
    d = new Data("trees-1.018_Cone.019", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.177304, -0.877584, 2.051001));
    v.add(new PVector(3.305062, -0.877584, 1.901495));
    v.add(new PVector(3.370659, -0.877584, 2.08689));
    d = new Data("trees-1.019_Cone.020", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.490921, -0.072996, 1.139245));
    v.add(new PVector(3.332605, -0.072996, 0.940768));
    v.add(new PVector(3.109991, -0.072996, 0.974346));
    v.add(new PVector(3.017262, -0.072996, 1.21069));
    v.add(new PVector(3.157648, -0.072996, 1.38669));
    v.add(new PVector(3.408693, -0.072996, 1.348824));
    d = new Data("trees-1.020_Cone.021", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.490921, -0.072996, 1.139245));
    v.add(new PVector(3.494888, -0.300077, 0.973702));
    v.add(new PVector(3.332605, -0.072996, 0.940768));
    d = new Data("trees-1.021_Cone.022", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.109991, -0.072996, 0.974346));
    v.add(new PVector(2.964643, -0.300077, 1.053682));
    v.add(new PVector(3.017262, -0.072996, 1.21069));
    d = new Data("trees-1.022_Cone.023", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.157648, -0.072996, 1.38669));
    v.add(new PVector(3.29903, -0.300077, 1.472898));
    v.add(new PVector(3.408693, -0.072996, 1.348824));
    d = new Data("trees-1.023_Cone.024", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.147157, -0.692196, 1.125291));
    v.add(new PVector(3.341615, -0.692196, 1.09596));
    v.add(new PVector(3.269788, -0.692196, 1.279031));
    d = new Data("trees-1.024_Cone.025", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.510599, -0.113811, 0.382498));
    v.add(new PVector(3.260501, -0.113811, 0.338812));
    v.add(new PVector(3.116066, -0.113811, 0.511506));
    v.add(new PVector(3.203282, -0.113811, 0.749939));
    v.add(new PVector(3.425056, -0.113811, 0.788677));
    v.add(new PVector(3.587939, -0.113811, 0.593929));
    d = new Data("trees-1.025_Cone.026", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.510599, -0.113811, 0.382498));
    v.add(new PVector(3.403846, -0.467862, 0.255911));
    v.add(new PVector(3.260501, -0.113811, 0.338812));
    d = new Data("trees-1.026_Cone.027", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.116066, -0.113811, 0.511506));
    v.add(new PVector(3.059815, -0.467862, 0.667249));
    v.add(new PVector(3.203282, -0.113811, 0.749939));
    d = new Data("trees-1.027_Cone.028", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.425056, -0.113811, 0.788677));
    v.add(new PVector(3.588059, -0.467862, 0.75952));
    v.add(new PVector(3.587939, -0.113811, 0.593929));
    d = new Data("trees-1.028_Cone.029", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.243943, -1.07923, 0.599898));
    v.add(new PVector(3.37011, -1.07923, 0.449047));
    v.add(new PVector(3.437668, -1.07923, 0.633736));
    d = new Data("trees-1.029_Cone.030", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.467907, -0.092546, 0.304755));
    v.add(new PVector(-3.323692, -0.380445, 0.223378));
    v.add(new PVector(-3.359473, -0.877584, 0.416144));
    v.add(new PVector(-3.487232, -0.877584, 0.56565));
    v.add(new PVector(-3.672063, -0.380445, 0.631046));
    v.add(new PVector(-3.614165, -0.092546, 0.475908));
    d = new Data("trees-1.030_Cone.031", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.143193, -0.092546, 0.563327));
    v.add(new PVector(-3.144826, -0.380445, 0.72891));
    v.add(new PVector(-3.293877, -0.877584, 0.60154));
    v.add(new PVector(-3.359473, -0.877584, 0.416144));
    v.add(new PVector(-3.323692, -0.380445, 0.223378));
    v.add(new PVector(-3.218287, -0.092546, 0.351088));
    d = new Data("trees-1.031_Cone.032", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.529481, -0.092546, 0.715252));
    v.add(new PVector(-3.672063, -0.380445, 0.631046));
    v.add(new PVector(-3.487232, -0.877584, 0.56565));
    v.add(new PVector(-3.293877, -0.877584, 0.60154));
    v.add(new PVector(-3.144826, -0.380445, 0.72891));
    v.add(new PVector(-3.30813, -0.092546, 0.756338));
    d = new Data("trees-1.032_Cone.033", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.273298, -0.072996, 1.781164));
    v.add(new PVector(-3.111015, -0.300077, 1.814098));
    v.add(new PVector(-3.264287, -0.692196, 1.936356));
    v.add(new PVector(-3.458746, -0.692196, 1.965687));
    v.add(new PVector(-3.64126, -0.300077, 1.894078));
    v.add(new PVector(-3.495912, -0.072996, 1.814742));
    d = new Data("trees-1.033_Cone.034", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.197209, -0.072996, 2.18922));
    v.add(new PVector(-3.306873, -0.300077, 2.313293));
    v.add(new PVector(-3.336115, -0.692196, 2.119427));
    v.add(new PVector(-3.264287, -0.692196, 1.936356));
    v.add(new PVector(-3.111015, -0.300077, 1.814098));
    v.add(new PVector(-3.114982, -0.072996, 1.979641));
    d = new Data("trees-1.034_Cone.035", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.588641, -0.072996, 2.051086));
    v.add(new PVector(-3.64126, -0.300077, 1.894078));
    v.add(new PVector(-3.458746, -0.692196, 1.965687));
    v.add(new PVector(-3.336115, -0.692196, 2.119427));
    v.add(new PVector(-3.306873, -0.300077, 2.313293));
    v.add(new PVector(-3.448254, -0.072996, 2.227086));
    d = new Data("trees-1.035_Cone.036", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.423577, -0.113811, 1.081488));
    v.add(new PVector(-3.280233, -0.467862, 0.998587));
    v.add(new PVector(-3.313968, -1.07923, 1.191722));
    v.add(new PVector(-3.440136, -1.07923, 1.342574));
    v.add(new PVector(-3.624264, -0.467862, 1.409925));
    v.add(new PVector(-3.568013, -0.113811, 1.254181));
    d = new Data("trees-1.036_Cone.037", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.096141, -0.113811, 1.336605));
    v.add(new PVector(-3.096019, -0.467862, 1.502196));
    v.add(new PVector(-3.246411, -1.07923, 1.376412));
    v.add(new PVector(-3.313968, -1.07923, 1.191722));
    v.add(new PVector(-3.280233, -0.467862, 0.998587));
    v.add(new PVector(-3.17348, -0.113811, 1.125174));
    d = new Data("trees-1.037_Cone.038", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.480797, -0.113811, 1.492615));
    v.add(new PVector(-3.624264, -0.467862, 1.409925));
    v.add(new PVector(-3.440136, -1.07923, 1.342574));
    v.add(new PVector(-3.246411, -1.07923, 1.376412));
    v.add(new PVector(-3.096019, -0.467862, 1.502196));
    v.add(new PVector(-3.259023, -0.113811, 1.531353));
    d = new Data("trees-1.038_Cone.039", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.196627, -0.092546, 1.790105));
    v.add(new PVector(3.340843, -0.380445, 1.708728));
    v.add(new PVector(3.305062, -0.877584, 1.901495));
    v.add(new PVector(3.177304, -0.877584, 2.051001));
    v.add(new PVector(2.992472, -0.380445, 2.116397));
    v.add(new PVector(3.05037, -0.092546, 1.961258));
    d = new Data("trees-1.039_Cone.040", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.521342, -0.092546, 2.048678));
    v.add(new PVector(3.519708, -0.380445, 2.214261));
    v.add(new PVector(3.370659, -0.877584, 2.08689));
    v.add(new PVector(3.305062, -0.877584, 1.901495));
    v.add(new PVector(3.340843, -0.380445, 1.708728));
    v.add(new PVector(3.446248, -0.092546, 1.836439));
    d = new Data("trees-1.040_Cone.041", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.135055, -0.092546, 2.200603));
    v.add(new PVector(2.992472, -0.380445, 2.116397));
    v.add(new PVector(3.177304, -0.877584, 2.051001));
    v.add(new PVector(3.370659, -0.877584, 2.08689));
    v.add(new PVector(3.519708, -0.380445, 2.214261));
    v.add(new PVector(3.356406, -0.092546, 2.241689));
    d = new Data("trees-1.041_Cone.042", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.332605, -0.072996, 0.940768));
    v.add(new PVector(3.494888, -0.300077, 0.973702));
    v.add(new PVector(3.341615, -0.692196, 1.09596));
    v.add(new PVector(3.147157, -0.692196, 1.125291));
    v.add(new PVector(2.964643, -0.300077, 1.053682));
    v.add(new PVector(3.109991, -0.072996, 0.974346));
    d = new Data("trees-1.042_Cone.043", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.408693, -0.072996, 1.348824));
    v.add(new PVector(3.29903, -0.300077, 1.472898));
    v.add(new PVector(3.269788, -0.692196, 1.279031));
    v.add(new PVector(3.341615, -0.692196, 1.09596));
    v.add(new PVector(3.494888, -0.300077, 0.973702));
    v.add(new PVector(3.490921, -0.072996, 1.139245));
    d = new Data("trees-1.043_Cone.044", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.017262, -0.072996, 1.21069));
    v.add(new PVector(2.964643, -0.300077, 1.053682));
    v.add(new PVector(3.147157, -0.692196, 1.125291));
    v.add(new PVector(3.269788, -0.692196, 1.279031));
    v.add(new PVector(3.29903, -0.300077, 1.472898));
    v.add(new PVector(3.157648, -0.072996, 1.38669));
    d = new Data("trees-1.044_Cone.045", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.260501, -0.113811, 0.338812));
    v.add(new PVector(3.403846, -0.467862, 0.255911));
    v.add(new PVector(3.37011, -1.07923, 0.449047));
    v.add(new PVector(3.243943, -1.07923, 0.599898));
    v.add(new PVector(3.059815, -0.467862, 0.667249));
    v.add(new PVector(3.116066, -0.113811, 0.511506));
    d = new Data("trees-1.045_Cone.046", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.587939, -0.113811, 0.593929));
    v.add(new PVector(3.588059, -0.467862, 0.75952));
    v.add(new PVector(3.437668, -1.07923, 0.633736));
    v.add(new PVector(3.37011, -1.07923, 0.449047));
    v.add(new PVector(3.403846, -0.467862, 0.255911));
    v.add(new PVector(3.510599, -0.113811, 0.382498));
    d = new Data("trees-1.046_Cone.047", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.203282, -0.113811, 0.749939));
    v.add(new PVector(3.059815, -0.467862, 0.667249));
    v.add(new PVector(3.243943, -1.07923, 0.599898));
    v.add(new PVector(3.437668, -1.07923, 0.633736));
    v.add(new PVector(3.588059, -0.467862, 0.75952));
    v.add(new PVector(3.425056, -0.113811, 0.788677));
    d = new Data("trees-1.047_Cone.048", 2, v);
    dd.add(d);

    trees = new Trees("trees-1", dd);
    p.add(trees);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(3.390057, -0.261033, 1.616074));
    v.add(new PVector(3.877401, -0.261033, 1.862231));
    v.add(new PVector(4.364745, -0.261033, 1.616074));
    v.add(new PVector(4.334251, -0.261033, 1.070944));
    v.add(new PVector(3.877401, -0.261033, 0.77197));
    v.add(new PVector(3.420551, -0.261033, 1.070944));
    d = new Data("trees-2_Cone.015", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.343282, -0.751478, 1.026332));
    v.add(new PVector(3.877401, -1.349384, 0.787526));
    v.add(new PVector(3.877401, -1.727017, 1.334706));
    v.add(new PVector(3.403529, -1.349384, 1.608296));
    d = new Data("trees-2.001_Cone.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.347355, -0.489503, 1.028684));
    v.add(new PVector(3.343282, -0.751478, 1.026332));
    v.add(new PVector(3.403529, -1.349384, 1.608296));
    v.add(new PVector(3.228711, -0.71345, 1.709227));
    d = new Data("trees-2.002_Cone.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.334251, -0.261033, 1.070944));
    v.add(new PVector(4.407447, -0.489503, 1.028684));
    v.add(new PVector(3.877401, -0.71345, 0.585663));
    v.add(new PVector(3.877401, -0.261033, 0.77197));
    d = new Data("trees-2.003_Cone.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.877401, -1.349384, 0.787526));
    v.add(new PVector(4.41152, -0.751478, 1.026332));
    v.add(new PVector(3.877401, -1.727017, 1.334706));
    d = new Data("trees-2.004_Cone.004", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.41152, -0.751478, 1.026332));
    v.add(new PVector(4.351273, -1.349384, 1.608296));
    v.add(new PVector(3.877401, -1.727017, 1.334706));
    d = new Data("trees-2.005_Cone.005", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.877401, -0.261033, 1.862231));
    v.add(new PVector(3.877401, -0.489503, 1.946751));
    v.add(new PVector(4.526091, -0.71345, 1.709227));
    v.add(new PVector(4.364745, -0.261033, 1.616074));
    d = new Data("trees-2.006_Cone.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.877401, -0.71345, 0.585663));
    v.add(new PVector(3.877401, -1.349384, 0.787526));
    v.add(new PVector(3.343282, -0.751478, 1.026332));
    v.add(new PVector(3.347355, -0.489503, 1.028684));
    d = new Data("trees-2.007_Cone.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.877401, -0.032818, 1.263707));
    v.add(new PVector(3.815913, -0.032818, 1.370206));
    v.add(new PVector(3.938889, -0.032818, 1.370206));
    d = new Data("trees-2.008_Cone.008", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.938889, -0.032818, 1.370206));
    v.add(new PVector(3.938889, -0.30198, 1.370206));
    v.add(new PVector(3.877401, -0.30198, 1.263707));
    v.add(new PVector(3.877401, -0.032818, 1.263707));
    d = new Data("trees-2.009_Cone.009", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.815913, -0.032818, 1.370206));
    v.add(new PVector(3.815913, -0.30198, 1.370206));
    v.add(new PVector(3.938889, -0.30198, 1.370206));
    v.add(new PVector(3.938889, -0.032818, 1.370206));
    d = new Data("trees-2.010_Cone.010", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.877401, -0.751478, 1.951454));
    v.add(new PVector(3.403529, -1.349384, 1.608296));
    v.add(new PVector(3.877401, -1.727017, 1.334706));
    v.add(new PVector(4.351273, -1.349384, 1.608296));
    d = new Data("trees-2.011_Cone.011", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.002849, -0.146925, 2.183187));
    v.add(new PVector(3.074986, -0.146925, 2.481911));
    v.add(new PVector(3.358227, -0.146925, 2.601135));
    v.add(new PVector(3.580861, -0.146925, 2.3893));
    v.add(new PVector(3.542491, -0.146925, 2.084394));
    v.add(new PVector(3.24772, -0.146925, 1.997505));
    d = new Data("trees-2.012_Cone.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.238676, -0.422975, 1.948106));
    v.add(new PVector(3.53582, -0.759511, 2.090066));
    v.add(new PVector(3.301189, -0.972065, 2.289572));
    v.add(new PVector(3.011096, -0.759511, 2.186128));
    d = new Data("trees-2.013_Cone.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.239153, -0.27552, 1.95071));
    v.add(new PVector(3.238676, -0.422975, 1.948106));
    v.add(new PVector(3.011096, -0.759511, 2.186128));
    v.add(new PVector(2.904077, -0.401571, 2.147966));
    d = new Data("trees-2.014_Cone.014", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.580861, -0.146925, 2.3893));
    v.add(new PVector(3.62567, -0.27552, 2.405279));
    v.add(new PVector(3.622379, -0.401571, 2.016466));
    v.add(new PVector(3.542491, -0.146925, 2.084394));
    d = new Data("trees-2.015_Cone.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.53582, -0.759511, 2.090066));
    v.add(new PVector(3.628163, -0.422975, 2.406168));
    v.add(new PVector(3.301189, -0.972065, 2.289572));
    d = new Data("trees-2.016_Cone.017", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.628163, -0.422975, 2.406168));
    v.add(new PVector(3.35665, -0.759511, 2.592522));
    v.add(new PVector(3.301189, -0.972065, 2.289572));
    d = new Data("trees-2.017_Cone.018", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.074986, -0.146925, 2.481911));
    v.add(new PVector(3.038743, -0.27552, 2.512728));
    v.add(new PVector(3.37711, -0.401571, 2.704284));
    v.add(new PVector(3.358227, -0.146925, 2.601135));
    d = new Data("trees-2.018_Cone.019", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.622379, -0.401571, 2.016466));
    v.add(new PVector(3.53582, -0.759511, 2.090066));
    v.add(new PVector(3.238676, -0.422975, 1.948106));
    v.add(new PVector(3.239153, -0.27552, 1.95071));
    d = new Data("trees-2.019_Cone.020", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.331633, -0.018472, 2.263685));
    v.add(new PVector(3.263548, -0.018472, 2.27615));
    v.add(new PVector(3.308385, -0.018472, 2.328882));
    d = new Data("trees-2.020_Cone.021", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.308385, -0.018472, 2.328882));
    v.add(new PVector(3.308385, -0.169972, 2.328882));
    v.add(new PVector(3.331633, -0.169972, 2.263685));
    v.add(new PVector(3.331633, -0.018472, 2.263685));
    d = new Data("trees-2.021_Cone.022", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.263548, -0.018472, 2.27615));
    v.add(new PVector(3.263548, -0.169972, 2.27615));
    v.add(new PVector(3.308385, -0.169972, 2.328882));
    v.add(new PVector(3.308385, -0.018472, 2.328882));
    d = new Data("trees-2.022_Cone.023", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.036726, -0.422975, 2.514443));
    v.add(new PVector(3.011096, -0.759511, 2.186128));
    v.add(new PVector(3.301189, -0.972065, 2.289572));
    v.add(new PVector(3.35665, -0.759511, 2.592522));
    d = new Data("trees-2.023_Cone.024", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.228711, -0.71345, 1.709227));
    v.add(new PVector(3.403529, -1.349384, 1.608296));
    v.add(new PVector(3.877401, -0.751478, 1.951454));
    v.add(new PVector(3.877401, -0.489503, 1.946751));
    d = new Data("trees-2.024_Cone.025", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.877401, -0.261033, 1.862231));
    v.add(new PVector(3.390057, -0.261033, 1.616074));
    v.add(new PVector(3.228711, -0.71345, 1.709227));
    v.add(new PVector(3.877401, -0.489503, 1.946751));
    d = new Data("trees-2.025_Cone.026", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.420551, -0.261033, 1.070944));
    v.add(new PVector(3.347355, -0.489503, 1.028684));
    v.add(new PVector(3.228711, -0.71345, 1.709227));
    v.add(new PVector(3.390057, -0.261033, 1.616074));
    d = new Data("trees-2.026_Cone.027", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.877401, -1.349384, 0.787526));
    v.add(new PVector(3.877401, -0.71345, 0.585663));
    v.add(new PVector(4.407447, -0.489503, 1.028684));
    v.add(new PVector(4.41152, -0.751478, 1.026332));
    d = new Data("trees-2.027_Cone.028", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.420551, -0.261033, 1.070944));
    v.add(new PVector(3.877401, -0.261033, 0.77197));
    v.add(new PVector(3.877401, -0.71345, 0.585663));
    v.add(new PVector(3.347355, -0.489503, 1.028684));
    d = new Data("trees-2.028_Cone.029", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.526091, -0.71345, 1.709227));
    v.add(new PVector(4.351273, -1.349384, 1.608296));
    v.add(new PVector(4.41152, -0.751478, 1.026332));
    v.add(new PVector(4.407447, -0.489503, 1.028684));
    d = new Data("trees-2.029_Cone.030", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.877401, -0.489503, 1.946751));
    v.add(new PVector(3.877401, -0.751478, 1.951454));
    v.add(new PVector(4.351273, -1.349384, 1.608296));
    v.add(new PVector(4.526091, -0.71345, 1.709227));
    d = new Data("trees-2.030_Cone.031", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.334251, -0.261033, 1.070944));
    v.add(new PVector(4.364745, -0.261033, 1.616074));
    v.add(new PVector(4.526091, -0.71345, 1.709227));
    v.add(new PVector(4.407447, -0.489503, 1.028684));
    d = new Data("trees-2.031_Cone.032", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.877401, -0.032818, 1.263707));
    v.add(new PVector(3.877401, -0.30198, 1.263707));
    v.add(new PVector(3.815913, -0.30198, 1.370206));
    v.add(new PVector(3.815913, -0.032818, 1.370206));
    d = new Data("trees-2.034_Cone.035", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(2.904077, -0.401571, 2.147966));
    v.add(new PVector(3.011096, -0.759511, 2.186128));
    v.add(new PVector(3.036726, -0.422975, 2.514443));
    v.add(new PVector(3.038743, -0.27552, 2.512728));
    d = new Data("trees-2.035_Cone.036", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.074986, -0.146925, 2.481911));
    v.add(new PVector(3.002849, -0.146925, 2.183187));
    v.add(new PVector(2.904077, -0.401571, 2.147966));
    v.add(new PVector(3.038743, -0.27552, 2.512728));
    d = new Data("trees-2.036_Cone.037", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.24772, -0.146925, 1.997505));
    v.add(new PVector(3.239153, -0.27552, 1.95071));
    v.add(new PVector(2.904077, -0.401571, 2.147966));
    v.add(new PVector(3.002849, -0.146925, 2.183187));
    d = new Data("trees-2.037_Cone.038", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.53582, -0.759511, 2.090066));
    v.add(new PVector(3.622379, -0.401571, 2.016466));
    v.add(new PVector(3.62567, -0.27552, 2.405279));
    v.add(new PVector(3.628163, -0.422975, 2.406168));
    d = new Data("trees-2.038_Cone.039", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.24772, -0.146925, 1.997505));
    v.add(new PVector(3.542491, -0.146925, 2.084394));
    v.add(new PVector(3.622379, -0.401571, 2.016466));
    v.add(new PVector(3.239153, -0.27552, 1.95071));
    d = new Data("trees-2.039_Cone.040", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.37711, -0.401571, 2.704284));
    v.add(new PVector(3.35665, -0.759511, 2.592522));
    v.add(new PVector(3.628163, -0.422975, 2.406168));
    v.add(new PVector(3.62567, -0.27552, 2.405279));
    d = new Data("trees-2.040_Cone.041", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.038743, -0.27552, 2.512728));
    v.add(new PVector(3.036726, -0.422975, 2.514443));
    v.add(new PVector(3.35665, -0.759511, 2.592522));
    v.add(new PVector(3.37711, -0.401571, 2.704284));
    d = new Data("trees-2.041_Cone.042", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.580861, -0.146925, 2.3893));
    v.add(new PVector(3.358227, -0.146925, 2.601135));
    v.add(new PVector(3.37711, -0.401571, 2.704284));
    v.add(new PVector(3.62567, -0.27552, 2.405279));
    d = new Data("trees-2.042_Cone.043", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.331633, -0.018472, 2.263685));
    v.add(new PVector(3.331633, -0.169972, 2.263685));
    v.add(new PVector(3.263548, -0.169972, 2.27615));
    v.add(new PVector(3.263548, -0.018472, 2.27615));
    d = new Data("trees-2.045_Cone.046", 2, v);
    dd.add(d);

    trees = new Trees("trees-2", dd);
    p.add(trees);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-4.124988, -0.435042, -3.343909));
    v.add(new PVector(-3.610242, -0.435042, -3.083912));
    v.add(new PVector(-3.095497, -0.435042, -3.343909));
    v.add(new PVector(-3.127706, -0.435042, -3.919689));
    v.add(new PVector(-3.610242, -0.435042, -4.235474));
    v.add(new PVector(-4.092778, -0.435042, -3.919689));
    d = new Data("trees-3_Cone.017", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.610242, -1.704054, -4.036675));
    v.add(new PVector(-3.267661, -1.704054, -3.443307));
    v.add(new PVector(-3.952824, -1.704054, -3.443307));
    d = new Data("trees-3.001_Cone.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.170091, -0.671288, -3.964325));
    v.add(new PVector(-3.952824, -1.704054, -3.443307));
    v.add(new PVector(-4.295405, -0.912896, -3.245518));
    d = new Data("trees-3.002_Cone.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.127706, -0.435042, -3.919689));
    v.add(new PVector(-3.050394, -0.671288, -3.964326));
    v.add(new PVector(-3.610242, -0.912896, -4.432255));
    v.add(new PVector(-3.610242, -0.435042, -4.235474));
    d = new Data("trees-3.003_Cone.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.610242, -0.435042, -3.083912));
    v.add(new PVector(-3.610242, -0.671287, -2.99464));
    v.add(new PVector(-2.92508, -0.912896, -3.245518));
    v.add(new PVector(-3.095497, -0.435042, -3.343909));
    d = new Data("trees-3.004_Cone.004", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.170091, -0.671288, -3.964325));
    v.add(new PVector(-3.610242, -1.704054, -4.036675));
    v.add(new PVector(-3.952824, -1.704054, -3.443307));
    d = new Data("trees-3.005_Cone.005", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.610242, -0.026278, -3.716089));
    v.add(new PVector(-3.675187, -0.026278, -3.603601));
    v.add(new PVector(-3.545298, -0.026278, -3.603601));
    d = new Data("trees-3.006_Cone.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.545298, -0.026278, -3.603601));
    v.add(new PVector(-3.545298, -0.478291, -3.603601));
    v.add(new PVector(-3.610242, -0.478291, -3.716089));
    v.add(new PVector(-3.610242, -0.026278, -3.716089));
    d = new Data("trees-3.007_Cone.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.675187, -0.026278, -3.603601));
    v.add(new PVector(-3.675187, -0.478291, -3.603601));
    v.add(new PVector(-3.545298, -0.478291, -3.603601));
    v.add(new PVector(-3.545298, -0.026278, -3.603601));
    d = new Data("trees-3.008_Cone.008", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.177605, -0.440559, -3.275583));
    v.add(new PVector(3.698878, -0.440558, -3.01229));
    v.add(new PVector(4.220151, -0.440559, -3.275583));
    v.add(new PVector(4.187534, -0.440559, -3.858666));
    v.add(new PVector(3.698878, -0.440559, -4.178454));
    v.add(new PVector(3.210222, -0.440559, -3.858665));
    d = new Data("trees-3.009_Cone.009", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.127573, -0.965148, -3.906383));
    v.add(new PVector(3.698878, -1.60468, -4.161815));
    v.add(new PVector(3.698878, -2.008604, -3.57654));
    v.add(new PVector(3.192015, -1.604679, -3.283903));
    d = new Data("trees-3.010_Cone.010", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.13193, -0.684934, -3.903868));
    v.add(new PVector(3.127573, -0.965148, -3.906383));
    v.add(new PVector(3.192015, -1.604679, -3.283903));
    v.add(new PVector(3.005027, -0.924473, -3.175945));
    d = new Data("trees-3.011_Cone.011", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.187534, -0.440559, -3.858666));
    v.add(new PVector(4.265826, -0.684934, -3.903868));
    v.add(new PVector(3.698878, -0.924473, -4.377731));
    v.add(new PVector(3.698878, -0.440559, -4.178454));
    d = new Data("trees-3.012_Cone.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.698878, -1.60468, -4.161815));
    v.add(new PVector(4.270183, -0.965148, -3.906383));
    v.add(new PVector(3.698878, -2.008604, -3.57654));
    d = new Data("trees-3.013_Cone.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.270183, -0.965148, -3.906383));
    v.add(new PVector(4.205741, -1.604679, -3.283903));
    v.add(new PVector(3.698878, -2.008604, -3.57654));
    d = new Data("trees-3.014_Cone.014", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.698878, -0.440558, -3.01229));
    v.add(new PVector(3.698878, -0.684933, -2.921885));
    v.add(new PVector(4.39273, -0.924473, -3.175945));
    v.add(new PVector(4.220151, -0.440559, -3.275583));
    d = new Data("trees-3.015_Cone.015", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.698878, -0.924473, -4.377731));
    v.add(new PVector(3.698878, -1.60468, -4.161815));
    v.add(new PVector(3.127573, -0.965148, -3.906383));
    v.add(new PVector(3.13193, -0.684934, -3.903868));
    d = new Data("trees-3.016_Cone.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.698878, -0.026611, -3.652483));
    v.add(new PVector(3.63311, -0.026611, -3.538569));
    v.add(new PVector(3.764646, -0.026611, -3.538569));
    d = new Data("trees-3.017_Cone.018", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.764646, -0.026611, -3.538569));
    v.add(new PVector(3.764646, -0.484356, -3.538569));
    v.add(new PVector(3.698878, -0.484356, -3.652483));
    v.add(new PVector(3.698878, -0.026611, -3.652483));
    d = new Data("trees-3.018_Cone.019", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.63311, -0.026611, -3.538569));
    v.add(new PVector(3.63311, -0.484356, -3.538569));
    v.add(new PVector(3.764646, -0.484356, -3.538569));
    v.add(new PVector(3.764646, -0.026611, -3.538569));
    d = new Data("trees-3.019_Cone.020", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.698878, -0.965147, -2.916855));
    v.add(new PVector(3.192015, -1.604679, -3.283903));
    v.add(new PVector(3.698878, -2.008604, -3.57654));
    v.add(new PVector(4.205741, -1.604679, -3.283903));
    d = new Data("trees-3.020_Cone.021", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.295405, -0.912896, -3.245518));
    v.add(new PVector(-3.952824, -1.704054, -3.443307));
    v.add(new PVector(-3.610242, -0.671287, -2.99464));
    d = new Data("trees-3.021_Cone.022", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.610242, -0.671287, -2.99464));
    v.add(new PVector(-3.952824, -1.704054, -3.443307));
    v.add(new PVector(-3.267661, -1.704054, -3.443307));
    d = new Data("trees-3.022_Cone.023", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.610242, -0.435042, -3.083912));
    v.add(new PVector(-4.124988, -0.435042, -3.343909));
    v.add(new PVector(-4.295405, -0.912896, -3.245518));
    v.add(new PVector(-3.610242, -0.671287, -2.99464));
    d = new Data("trees-3.023_Cone.024", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.092778, -0.435042, -3.919689));
    v.add(new PVector(-4.170091, -0.671288, -3.964325));
    v.add(new PVector(-4.295405, -0.912896, -3.245518));
    v.add(new PVector(-4.124988, -0.435042, -3.343909));
    d = new Data("trees-3.024_Cone.025", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.610242, -1.704054, -4.036675));
    v.add(new PVector(-3.610242, -0.912896, -4.432255));
    v.add(new PVector(-3.050394, -0.671288, -3.964326));
    d = new Data("trees-3.025_Cone.026", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.092778, -0.435042, -3.919689));
    v.add(new PVector(-3.610242, -0.435042, -4.235474));
    v.add(new PVector(-3.610242, -0.912896, -4.432255));
    v.add(new PVector(-4.170091, -0.671288, -3.964325));
    d = new Data("trees-3.026_Cone.027", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.610242, -0.912896, -4.432255));
    v.add(new PVector(-3.610242, -1.704054, -4.036675));
    v.add(new PVector(-4.170091, -0.671288, -3.964325));
    d = new Data("trees-3.027_Cone.028", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.267661, -1.704054, -3.443307));
    v.add(new PVector(-3.610242, -1.704054, -4.036675));
    v.add(new PVector(-3.050394, -0.671288, -3.964326));
    d = new Data("trees-3.028_Cone.029", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.92508, -0.912896, -3.245518));
    v.add(new PVector(-3.267661, -1.704054, -3.443307));
    v.add(new PVector(-3.050394, -0.671288, -3.964326));
    d = new Data("trees-3.029_Cone.030", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.610242, -0.671287, -2.99464));
    v.add(new PVector(-3.267661, -1.704054, -3.443307));
    v.add(new PVector(-2.92508, -0.912896, -3.245518));
    d = new Data("trees-3.030_Cone.031", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.127706, -0.435042, -3.919689));
    v.add(new PVector(-3.095497, -0.435042, -3.343909));
    v.add(new PVector(-2.92508, -0.912896, -3.245518));
    v.add(new PVector(-3.050394, -0.671288, -3.964326));
    d = new Data("trees-3.031_Cone.032", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.610242, -0.026278, -3.716089));
    v.add(new PVector(-3.610242, -0.478291, -3.716089));
    v.add(new PVector(-3.675187, -0.478291, -3.603601));
    v.add(new PVector(-3.675187, -0.026278, -3.603601));
    d = new Data("trees-3.032_Cone.033", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.005027, -0.924473, -3.175945));
    v.add(new PVector(3.192015, -1.604679, -3.283903));
    v.add(new PVector(3.698878, -0.965147, -2.916855));
    v.add(new PVector(3.698878, -0.684933, -2.921885));
    d = new Data("trees-3.033_Cone.034", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.698878, -0.440558, -3.01229));
    v.add(new PVector(3.177605, -0.440559, -3.275583));
    v.add(new PVector(3.005027, -0.924473, -3.175945));
    v.add(new PVector(3.698878, -0.684933, -2.921885));
    d = new Data("trees-3.034_Cone.035", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.210222, -0.440559, -3.858665));
    v.add(new PVector(3.13193, -0.684934, -3.903868));
    v.add(new PVector(3.005027, -0.924473, -3.175945));
    v.add(new PVector(3.177605, -0.440559, -3.275583));
    d = new Data("trees-3.035_Cone.036", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.698878, -1.60468, -4.161815));
    v.add(new PVector(3.698878, -0.924473, -4.377731));
    v.add(new PVector(4.265826, -0.684934, -3.903868));
    v.add(new PVector(4.270183, -0.965148, -3.906383));
    d = new Data("trees-3.036_Cone.037", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.210222, -0.440559, -3.858665));
    v.add(new PVector(3.698878, -0.440559, -4.178454));
    v.add(new PVector(3.698878, -0.924473, -4.377731));
    v.add(new PVector(3.13193, -0.684934, -3.903868));
    d = new Data("trees-3.037_Cone.038", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.39273, -0.924473, -3.175945));
    v.add(new PVector(4.205741, -1.604679, -3.283903));
    v.add(new PVector(4.270183, -0.965148, -3.906383));
    v.add(new PVector(4.265826, -0.684934, -3.903868));
    d = new Data("trees-3.038_Cone.039", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.698878, -0.684933, -2.921885));
    v.add(new PVector(3.698878, -0.965147, -2.916855));
    v.add(new PVector(4.205741, -1.604679, -3.283903));
    v.add(new PVector(4.39273, -0.924473, -3.175945));
    d = new Data("trees-3.039_Cone.040", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.187534, -0.440559, -3.858666));
    v.add(new PVector(4.220151, -0.440559, -3.275583));
    v.add(new PVector(4.39273, -0.924473, -3.175945));
    v.add(new PVector(4.265826, -0.684934, -3.903868));
    d = new Data("trees-3.040_Cone.041", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.698878, -0.026611, -3.652483));
    v.add(new PVector(3.698878, -0.484356, -3.652483));
    v.add(new PVector(3.63311, -0.484356, -3.538569));
    v.add(new PVector(3.63311, -0.026611, -3.538569));
    d = new Data("trees-3.043_Cone.044", 2, v);
    dd.add(d);

    trees = new Trees("trees-3", dd);
    p.add(trees);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(-3.353038, -0.083231, 0.538382));
    v.add(new PVector(-3.642522, -0.083231, 0.538382));
    v.add(new PVector(-3.770872, -0.083231, 0.76069));
    v.add(new PVector(-3.62613, -0.083231, 1.01139));
    v.add(new PVector(-3.36943, -0.083231, 1.01139));
    v.add(new PVector(-3.224688, -0.083231, 0.76069));
    d = new Data("trees-4_Cone.019", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.353038, -0.083231, 0.538382));
    v.add(new PVector(-3.49778, -0.342153, 0.417142));
    v.add(new PVector(-3.642522, -0.083231, 0.538382));
    d = new Data("trees-4.001_Cone.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.770872, -0.083231, 0.76069));
    v.add(new PVector(-3.803497, -0.342153, 0.94666));
    v.add(new PVector(-3.62613, -0.083231, 1.01139));
    d = new Data("trees-4.002_Cone.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.36943, -0.083231, 1.01139));
    v.add(new PVector(-3.192063, -0.342153, 0.94666));
    v.add(new PVector(-3.224688, -0.083231, 0.76069));
    d = new Data("trees-4.003_Cone.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.609896, -0.789254, 0.834884));
    v.add(new PVector(-3.49778, -0.789254, 0.640693));
    v.add(new PVector(-3.385664, -0.789254, 0.834884));
    d = new Data("trees-4.004_Cone.004", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.065945, -0.109303, 0.740693));
    v.add(new PVector(-4.154599, -0.109303, 0.465118));
    v.add(new PVector(-4.405532, -0.109303, 0.411016));
    v.add(new PVector(-4.59986, -0.109303, 0.625579));
    v.add(new PVector(-4.521247, -0.109303, 0.869945));
    v.add(new PVector(-4.238266, -0.109303, 0.930957));
    d = new Data("trees-4.005_Cone.005", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.065945, -0.109303, 0.740693));
    v.add(new PVector(-3.994858, -0.649924, 0.565777));
    v.add(new PVector(-4.154599, -0.109303, 0.465118));
    d = new Data("trees-4.006_Cone.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.405532, -0.109303, 0.411016));
    v.add(new PVector(-4.592558, -0.649924, 0.436911));
    v.add(new PVector(-4.59986, -0.109303, 0.625579));
    d = new Data("trees-4.007_Cone.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.521247, -0.109303, 0.869945));
    v.add(new PVector(-4.405309, -0.649924, 1.018967));
    v.add(new PVector(-4.238266, -0.109303, 0.930957));
    d = new Data("trees-4.008_Cone.008", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.426864, -1.583457, 0.586979));
    v.add(new PVector(-4.207668, -1.583457, 0.634238));
    v.add(new PVector(-4.358193, -1.583457, 0.800438));
    d = new Data("trees-4.009_Cone.009", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-5.008698, -0.133542, 0.602561));
    v.add(new PVector(-5.298181, -0.133542, 0.602561));
    v.add(new PVector(-5.426531, -0.133542, 0.82487));
    v.add(new PVector(-5.28179, -0.133542, 1.07557));
    v.add(new PVector(-5.025089, -0.133542, 1.07557));
    v.add(new PVector(-4.880348, -0.133542, 0.82487));
    d = new Data("trees-4.010_Cone.010", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-5.008698, -0.133542, 0.602561));
    v.add(new PVector(-5.15344, -0.482112, 0.481322));
    v.add(new PVector(-5.298181, -0.133542, 0.602561));
    d = new Data("trees-4.011_Cone.011", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-5.426531, -0.133542, 0.82487));
    v.add(new PVector(-5.459157, -0.482112, 1.010839));
    v.add(new PVector(-5.28179, -0.133542, 1.07557));
    d = new Data("trees-4.012_Cone.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-5.025089, -0.133542, 1.07557));
    v.add(new PVector(-4.847723, -0.482112, 1.010839));
    v.add(new PVector(-4.880348, -0.133542, 0.82487));
    d = new Data("trees-4.013_Cone.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-5.265556, -1.084015, 0.899064));
    v.add(new PVector(-5.15344, -1.084015, 0.704872));
    v.add(new PVector(-5.041323, -1.084015, 0.899064));
    d = new Data("trees-4.014_Cone.014", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.642522, -0.083231, 0.538382));
    v.add(new PVector(-3.49778, -0.342153, 0.417142));
    v.add(new PVector(-3.49778, -0.789254, 0.640693));
    v.add(new PVector(-3.609896, -0.789254, 0.834884));
    v.add(new PVector(-3.803497, -0.342153, 0.94666));
    v.add(new PVector(-3.770872, -0.083231, 0.76069));
    d = new Data("trees-4.015_Cone.015", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.224688, -0.083231, 0.76069));
    v.add(new PVector(-3.192063, -0.342153, 0.94666));
    v.add(new PVector(-3.385664, -0.789254, 0.834884));
    v.add(new PVector(-3.49778, -0.789254, 0.640693));
    v.add(new PVector(-3.49778, -0.342153, 0.417142));
    v.add(new PVector(-3.353038, -0.083231, 0.538382));
    d = new Data("trees-4.016_Cone.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.62613, -0.083231, 1.01139));
    v.add(new PVector(-3.803497, -0.342153, 0.94666));
    v.add(new PVector(-3.609896, -0.789254, 0.834884));
    v.add(new PVector(-3.385664, -0.789254, 0.834884));
    v.add(new PVector(-3.192063, -0.342153, 0.94666));
    v.add(new PVector(-3.36943, -0.083231, 1.01139));
    d = new Data("trees-4.017_Cone.017", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.154599, -0.109303, 0.465118));
    v.add(new PVector(-3.994858, -0.649924, 0.565777));
    v.add(new PVector(-4.207668, -1.583457, 0.634238));
    v.add(new PVector(-4.426864, -1.583457, 0.586979));
    v.add(new PVector(-4.592558, -0.649924, 0.436911));
    v.add(new PVector(-4.405532, -0.109303, 0.411016));
    d = new Data("trees-4.018_Cone.018", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.238266, -0.109303, 0.930957));
    v.add(new PVector(-4.405309, -0.649924, 1.018967));
    v.add(new PVector(-4.358193, -1.583457, 0.800438));
    v.add(new PVector(-4.207668, -1.583457, 0.634238));
    v.add(new PVector(-3.994858, -0.649924, 0.565777));
    v.add(new PVector(-4.065945, -0.109303, 0.740693));
    d = new Data("trees-4.019_Cone.020", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.59986, -0.109303, 0.625579));
    v.add(new PVector(-4.592558, -0.649924, 0.436911));
    v.add(new PVector(-4.426864, -1.583457, 0.586979));
    v.add(new PVector(-4.358193, -1.583457, 0.800438));
    v.add(new PVector(-4.405309, -0.649924, 1.018967));
    v.add(new PVector(-4.521247, -0.109303, 0.869945));
    d = new Data("trees-4.020_Cone.021", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-5.298181, -0.133542, 0.602561));
    v.add(new PVector(-5.15344, -0.482112, 0.481322));
    v.add(new PVector(-5.15344, -1.084015, 0.704872));
    v.add(new PVector(-5.265556, -1.084015, 0.899064));
    v.add(new PVector(-5.459157, -0.482112, 1.010839));
    v.add(new PVector(-5.426531, -0.133542, 0.82487));
    d = new Data("trees-4.021_Cone.022", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-4.880348, -0.133542, 0.82487));
    v.add(new PVector(-4.847723, -0.482112, 1.010839));
    v.add(new PVector(-5.041323, -1.084015, 0.899064));
    v.add(new PVector(-5.15344, -1.084015, 0.704872));
    v.add(new PVector(-5.15344, -0.482112, 0.481322));
    v.add(new PVector(-5.008698, -0.133542, 0.602561));
    d = new Data("trees-4.022_Cone.023", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-5.28179, -0.133542, 1.07557));
    v.add(new PVector(-5.459157, -0.482112, 1.010839));
    v.add(new PVector(-5.265556, -1.084015, 0.899064));
    v.add(new PVector(-5.041323, -1.084015, 0.899064));
    v.add(new PVector(-4.847723, -0.482112, 1.010839));
    v.add(new PVector(-5.025089, -0.133542, 1.07557));
    d = new Data("trees-4.023_Cone.024", 2, v);
    dd.add(d);

    trees = new Trees("trees-4", dd);
    p.add(trees);


    dd = new ArrayList();

    v = new ArrayList();
    v.add(new PVector(3.186645, -0.08002, 1.000291));
    v.add(new PVector(3.464959, -0.08002, 1.000291));
    v.add(new PVector(3.588357, -0.08002, 0.786559));
    v.add(new PVector(3.449199, -0.08002, 0.545532));
    v.add(new PVector(3.202404, -0.08002, 0.545532));
    v.add(new PVector(3.063247, -0.08002, 0.786559));
    d = new Data("trees-5_Cone.022", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.186645, -0.08002, 1.000291));
    v.add(new PVector(3.325801, -0.328952, 1.116852));
    v.add(new PVector(3.464959, -0.08002, 1.000291));
    d = new Data("trees-5.001_Cone.001", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.588357, -0.08002, 0.786559));
    v.add(new PVector(3.619723, -0.328952, 0.607765));
    v.add(new PVector(3.449199, -0.08002, 0.545532));
    d = new Data("trees-5.002_Cone.002", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.202404, -0.08002, 0.545532));
    v.add(new PVector(3.031881, -0.328952, 0.607765));
    v.add(new PVector(3.063247, -0.08002, 0.786559));
    d = new Data("trees-5.003_Cone.003", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.433593, -0.758802, 0.715228));
    v.add(new PVector(3.325802, -0.758802, 0.901927));
    v.add(new PVector(3.218011, -0.758802, 0.715228));
    d = new Data("trees-5.004_Cone.004", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.872046, -0.105086, 0.805785));
    v.add(new PVector(3.957278, -0.105086, 1.070727));
    v.add(new PVector(4.19853, -0.105086, 1.122742));
    v.add(new PVector(4.38536, -0.105086, 0.916458));
    v.add(new PVector(4.30978, -0.105086, 0.68152));
    v.add(new PVector(4.037718, -0.105086, 0.622862));
    d = new Data("trees-5.005_Cone.005", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.872046, -0.105086, 0.805785));
    v.add(new PVector(3.803701, -0.624848, 0.973953));
    v.add(new PVector(3.957278, -0.105086, 1.070727));
    d = new Data("trees-5.006_Cone.006", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.19853, -0.105086, 1.122742));
    v.add(new PVector(4.378339, -0.624848, 1.097847));
    v.add(new PVector(4.38536, -0.105086, 0.916458));
    d = new Data("trees-5.007_Cone.007", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.30978, -0.105086, 0.68152));
    v.add(new PVector(4.198315, -0.624848, 0.538248));
    v.add(new PVector(4.037718, -0.105086, 0.622862));
    d = new Data("trees-5.008_Cone.008", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.219038, -1.522362, 0.953569));
    v.add(new PVector(4.0083, -1.522362, 0.908133));
    v.add(new PVector(4.153018, -1.522362, 0.748346));
    d = new Data("trees-5.009_Cone.009", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.778423, -0.12839, 0.938588));
    v.add(new PVector(5.056737, -0.12839, 0.938588));
    v.add(new PVector(5.180136, -0.12839, 0.724857));
    v.add(new PVector(5.040979, -0.12839, 0.48383));
    v.add(new PVector(4.794183, -0.12839, 0.483829));
    v.add(new PVector(4.655026, -0.12839, 0.724857));
    d = new Data("trees-5.010_Cone.010", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.778423, -0.12839, 0.938588));
    v.add(new PVector(4.91758, -0.46351, 1.055149));
    v.add(new PVector(5.056737, -0.12839, 0.938588));
    d = new Data("trees-5.011_Cone.011", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(5.180136, -0.12839, 0.724857));
    v.add(new PVector(5.211502, -0.46351, 0.546063));
    v.add(new PVector(5.040979, -0.12839, 0.48383));
    d = new Data("trees-5.012_Cone.012", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.794183, -0.12839, 0.483829));
    v.add(new PVector(4.623659, -0.46351, 0.546063));
    v.add(new PVector(4.655026, -0.12839, 0.724857));
    d = new Data("trees-5.013_Cone.013", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(5.025371, -1.04219, 0.653525));
    v.add(new PVector(4.917581, -1.04219, 0.840224));
    v.add(new PVector(4.80979, -1.04219, 0.653525));
    d = new Data("trees-5.014_Cone.014", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.717006, -0.300578, 1.094035));
    v.add(new PVector(-3.324021, -0.300578, 1.159743));
    v.add(new PVector(-3.037911, -0.300578, 0.882442));
    v.add(new PVector(-3.177499, -0.300578, 0.509254));
    v.add(new PVector(-3.560703, -0.300578, 0.400126));
    v.add(new PVector(-3.8141, -0.300578, 0.707607));
    d = new Data("trees-5.015_Cone.015", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.877621, -0.658488, 0.693299));
    v.add(new PVector(-3.557326, -1.09482, 0.410964));
    v.add(new PVector(-3.43854, -1.370404, 0.792201));
    v.add(new PVector(-3.709308, -1.09482, 1.085691));
    d = new Data("trees-5.016_Cone.016", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.874273, -0.467307, 0.694053));
    v.add(new PVector(-3.877621, -0.658488, 0.693299));
    v.add(new PVector(-3.709308, -1.09482, 1.085691));
    v.add(new PVector(-3.809198, -0.630737, 1.193964));
    d = new Data("trees-5.017_Cone.017", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.177499, -0.300578, 0.509254));
    v.add(new PVector(-3.135674, -0.467307, 0.46392));
    v.add(new PVector(-3.601148, -0.630737, 0.270321));
    v.add(new PVector(-3.560703, -0.300578, 0.400126));
    d = new Data("trees-5.018_Cone.018", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.557326, -1.09482, 0.410964));
    v.add(new PVector(-3.133347, -0.658488, 0.461397));
    v.add(new PVector(-3.43854, -1.370404, 0.792201));
    d = new Data("trees-5.019_Cone.019", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.133347, -0.658488, 0.461397));
    v.add(new PVector(-3.048986, -1.09482, 0.879948));
    v.add(new PVector(-3.43854, -1.370404, 0.792201));
    d = new Data("trees-5.020_Cone.020", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.324021, -0.300578, 1.159743));
    v.add(new PVector(-3.305673, -0.467307, 1.218631));
    v.add(new PVector(-2.905274, -0.630737, 0.912319));
    v.add(new PVector(-3.037911, -0.300578, 0.882442));
    d = new Data("trees-5.021_Cone.021", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.601148, -0.630737, 0.270321));
    v.add(new PVector(-3.557326, -1.09482, 0.410964));
    v.add(new PVector(-3.877621, -0.658488, 0.693299));
    v.add(new PVector(-3.874273, -0.467307, 0.694053));
    d = new Data("trees-5.022_Cone.023", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.453953, -0.018155, 0.742734));
    v.add(new PVector(-3.473674, -0.018155, 0.830283));
    v.add(new PVector(-3.387993, -0.018155, 0.803587));
    d = new Data("trees-5.023_Cone.024", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.387993, -0.018155, 0.803587));
    v.add(new PVector(-3.387993, -0.33046, 0.803587));
    v.add(new PVector(-3.453953, -0.33046, 0.742734));
    v.add(new PVector(-3.453953, -0.018155, 0.742734));
    d = new Data("trees-5.024_Cone.025", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.473674, -0.018155, 0.830283));
    v.add(new PVector(-3.473674, -0.33046, 0.830283));
    v.add(new PVector(-3.387993, -0.33046, 0.803587));
    v.add(new PVector(-3.387993, -0.018155, 0.803587));
    d = new Data("trees-5.025_Cone.026", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.304652, -0.658488, 1.221908));
    v.add(new PVector(-3.709308, -1.09482, 1.085691));
    v.add(new PVector(-3.43854, -1.370404, 0.792201));
    v.add(new PVector(-3.048986, -1.09482, 0.879948));
    d = new Data("trees-5.026_Cone.027", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.464959, -0.08002, 1.000291));
    v.add(new PVector(3.325801, -0.328952, 1.116852));
    v.add(new PVector(3.325802, -0.758802, 0.901927));
    v.add(new PVector(3.433593, -0.758802, 0.715228));
    v.add(new PVector(3.619723, -0.328952, 0.607765));
    v.add(new PVector(3.588357, -0.08002, 0.786559));
    d = new Data("trees-5.027_Cone.028", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.063247, -0.08002, 0.786559));
    v.add(new PVector(3.031881, -0.328952, 0.607765));
    v.add(new PVector(3.218011, -0.758802, 0.715228));
    v.add(new PVector(3.325802, -0.758802, 0.901927));
    v.add(new PVector(3.325801, -0.328952, 1.116852));
    v.add(new PVector(3.186645, -0.08002, 1.000291));
    d = new Data("trees-5.028_Cone.029", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.449199, -0.08002, 0.545532));
    v.add(new PVector(3.619723, -0.328952, 0.607765));
    v.add(new PVector(3.433593, -0.758802, 0.715228));
    v.add(new PVector(3.218011, -0.758802, 0.715228));
    v.add(new PVector(3.031881, -0.328952, 0.607765));
    v.add(new PVector(3.202404, -0.08002, 0.545532));
    d = new Data("trees-5.029_Cone.030", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(3.957278, -0.105086, 1.070727));
    v.add(new PVector(3.803701, -0.624848, 0.973953));
    v.add(new PVector(4.0083, -1.522362, 0.908133));
    v.add(new PVector(4.219038, -1.522362, 0.953569));
    v.add(new PVector(4.378339, -0.624848, 1.097847));
    v.add(new PVector(4.19853, -0.105086, 1.122742));
    d = new Data("trees-5.030_Cone.031", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.037718, -0.105086, 0.622862));
    v.add(new PVector(4.198315, -0.624848, 0.538248));
    v.add(new PVector(4.153018, -1.522362, 0.748346));
    v.add(new PVector(4.0083, -1.522362, 0.908133));
    v.add(new PVector(3.803701, -0.624848, 0.973953));
    v.add(new PVector(3.872046, -0.105086, 0.805785));
    d = new Data("trees-5.031_Cone.032", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.38536, -0.105086, 0.916458));
    v.add(new PVector(4.378339, -0.624848, 1.097847));
    v.add(new PVector(4.219038, -1.522362, 0.953569));
    v.add(new PVector(4.153018, -1.522362, 0.748346));
    v.add(new PVector(4.198315, -0.624848, 0.538248));
    v.add(new PVector(4.30978, -0.105086, 0.68152));
    d = new Data("trees-5.032_Cone.033", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(5.056737, -0.12839, 0.938588));
    v.add(new PVector(4.91758, -0.46351, 1.055149));
    v.add(new PVector(4.917581, -1.04219, 0.840224));
    v.add(new PVector(5.025371, -1.04219, 0.653525));
    v.add(new PVector(5.211502, -0.46351, 0.546063));
    v.add(new PVector(5.180136, -0.12839, 0.724857));
    d = new Data("trees-5.033_Cone.034", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(4.655026, -0.12839, 0.724857));
    v.add(new PVector(4.623659, -0.46351, 0.546063));
    v.add(new PVector(4.80979, -1.04219, 0.653525));
    v.add(new PVector(4.917581, -1.04219, 0.840224));
    v.add(new PVector(4.91758, -0.46351, 1.055149));
    v.add(new PVector(4.778423, -0.12839, 0.938588));
    d = new Data("trees-5.034_Cone.035", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(5.040979, -0.12839, 0.48383));
    v.add(new PVector(5.211502, -0.46351, 0.546063));
    v.add(new PVector(5.025371, -1.04219, 0.653525));
    v.add(new PVector(4.80979, -1.04219, 0.653525));
    v.add(new PVector(4.623659, -0.46351, 0.546063));
    v.add(new PVector(4.794183, -0.12839, 0.483829));
    d = new Data("trees-5.035_Cone.036", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.809198, -0.630737, 1.193964));
    v.add(new PVector(-3.709308, -1.09482, 1.085691));
    v.add(new PVector(-3.304652, -0.658488, 1.221908));
    v.add(new PVector(-3.305673, -0.467307, 1.218631));
    d = new Data("trees-5.036_Cone.037", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.324021, -0.300578, 1.159743));
    v.add(new PVector(-3.717006, -0.300578, 1.094035));
    v.add(new PVector(-3.809198, -0.630737, 1.193964));
    v.add(new PVector(-3.305673, -0.467307, 1.218631));
    d = new Data("trees-5.037_Cone.038", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.8141, -0.300578, 0.707607));
    v.add(new PVector(-3.874273, -0.467307, 0.694053));
    v.add(new PVector(-3.809198, -0.630737, 1.193964));
    v.add(new PVector(-3.717006, -0.300578, 1.094035));
    d = new Data("trees-5.038_Cone.039", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.557326, -1.09482, 0.410964));
    v.add(new PVector(-3.601148, -0.630737, 0.270321));
    v.add(new PVector(-3.135674, -0.467307, 0.46392));
    v.add(new PVector(-3.133347, -0.658488, 0.461397));
    d = new Data("trees-5.039_Cone.040", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.8141, -0.300578, 0.707607));
    v.add(new PVector(-3.560703, -0.300578, 0.400126));
    v.add(new PVector(-3.601148, -0.630737, 0.270321));
    v.add(new PVector(-3.874273, -0.467307, 0.694053));
    d = new Data("trees-5.040_Cone.041", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-2.905274, -0.630737, 0.912319));
    v.add(new PVector(-3.048986, -1.09482, 0.879948));
    v.add(new PVector(-3.133347, -0.658488, 0.461397));
    v.add(new PVector(-3.135674, -0.467307, 0.46392));
    d = new Data("trees-5.041_Cone.042", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.305673, -0.467307, 1.218631));
    v.add(new PVector(-3.304652, -0.658488, 1.221908));
    v.add(new PVector(-3.048986, -1.09482, 0.879948));
    v.add(new PVector(-2.905274, -0.630737, 0.912319));
    d = new Data("trees-5.042_Cone.043", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.177499, -0.300578, 0.509254));
    v.add(new PVector(-3.037911, -0.300578, 0.882442));
    v.add(new PVector(-2.905274, -0.630737, 0.912319));
    v.add(new PVector(-3.135674, -0.467307, 0.46392));
    d = new Data("trees-5.043_Cone.044", 2, v);
    dd.add(d);

    v = new ArrayList();
    v.add(new PVector(-3.453953, -0.018155, 0.742734));
    v.add(new PVector(-3.453953, -0.33046, 0.742734));
    v.add(new PVector(-3.473674, -0.33046, 0.830283));
    v.add(new PVector(-3.473674, -0.018155, 0.830283));
    d = new Data("trees-5.046_Cone.047", 2, v);
    dd.add(d);

    trees = new Trees("trees-4", dd);
    p.add(trees);


    return p;
  }
}
