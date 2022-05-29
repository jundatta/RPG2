// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)
// 【作品名】Random walk network. Draw by openFrameworks
// https://junkiyoshi.com/2022/02/09/
//

class GameSceneCongratulations271 extends GameSceneCongratulationsBase {
  ArrayList<PVector> glocation_list;
  ArrayList<ArrayList<Integer>> next_index_list;
  ArrayList<Integer> destination_list;

  ArrayList<Actor> actor_list;

  PGraphics pg;

  //--------------------------------------------------------------
  class Actor {
    int select_index;
    int next_index;

    PVector location;
    ArrayList<PVector> log;
    color col;

    boolean findDestination(ArrayList<Integer> destination_list, int index) {
      for (int destination : destination_list) {
        if (destination == index) {
          return true;
        }
      }
      return false;
    }
    Actor(ArrayList<PVector> location_list, ArrayList<Integer> destination_list) {
      this.log = new ArrayList();

      this.select_index = (int)random(0, location_list.size());
      while (true) {
        //var itr = find(destination_list.begin(), destination_list.end(), this.select_index);
        //if (itr == destination_list.end()) {
        //  destination_list.push_back(this.select_index);
        //  break;
        //}
        if (!findDestination(destination_list, this.select_index)) {
          destination_list.add(this.select_index);
          break;
        }

        this.select_index = (this.select_index + 1) % location_list.size();
      }

      this.next_index = this.select_index;
    }

    //--------------------------------------------------------------
    void update(int frame_span, final ArrayList<PVector> location_list, ArrayList<ArrayList<Integer>> next_index_list, ArrayList<Integer> destination_list) {
      if (frameCount % frame_span == 0) {
        var tmp_index = this.select_index;
        this.select_index = this.next_index;
        ArrayList<Integer> nextIndexArray = next_index_list.get(this.select_index);
        int retry = nextIndexArray.size();
        this.next_index = nextIndexArray.get((int)random(0, next_index_list.get(this.select_index).size()));
        while (--retry > 0) {
          //var destination_itr = find(destination_list.begin(), destination_list.end(), this.next_index);
          //if (destination_itr == destination_list.end()) {
          //  if (tmp_index != this.next_index) {
          //    destination_list.push_back(this.next_index);
          //    break;
          //  }
          //}
          if (!findDestination(destination_list, this.next_index)) {
            if (tmp_index != this.next_index) {
              destination_list.add(this.next_index);
              break;
            }
          }

          ArrayList<Integer> nextIndex = next_index_list.get(this.select_index);
          this.next_index = nextIndex.get((this.next_index + 1) % nextIndex.size());
        }
        if (retry <= 0) {
          destination_list.add(this.select_index);
          this.next_index = this.select_index;
        }
      }

      var param = frameCount % frame_span;
      PVector nextLocation = location_list.get(this.next_index);
      PVector selectLocation = location_list.get(this.select_index);
      var distance = PVector.sub(nextLocation, selectLocation);
      distance = distance.div(frame_span);
      distance = distance.mult(param);
      this.location = PVector.add(selectLocation, distance);

      this.log.add(0, this.location);
      while (this.log.size() > 20) {
        this.log.remove(this.log.size()-1);
      }
    }

    //--------------------------------------------------------------
    PVector getLocation() {
      return this.location;
    }

    //--------------------------------------------------------------
    ArrayList<PVector> getLog() {
      return this.log;
    }

    //--------------------------------------------------------------
    void setColor(color col) {
      this.col = col;
    }

    //--------------------------------------------------------------
    color getColor() {
      return this.col;
    }
  }

  //--------------------------------------------------------------
  @Override void setup() {
    pg = createGraphics(width, height);

    //  ofSetFrameRate(30);

    glocation_list = new ArrayList();
    var span = 40;
    for (int x = -280; x <= 280; x += span) {
      for (int y = -280; y <= 280; y += span) {
        glocation_list.add(new PVector(x, y, 0));
      }
    }

    next_index_list = new ArrayList();
    var param = span * sqrt(3);
    for (var location : glocation_list) {
      ArrayList<Integer> next_index = new ArrayList();
      int index = -1;
      for (var other : glocation_list) {
        index++;
        if (location == other) {
          continue;
        }

        float distance = PVector.dist(location, other);
        if (distance <= param) {
          next_index.add(index);
        }
      }

      next_index_list.add(next_index);
    }

    color[] base_color_list = { #ef476f, #ffd166, #06d6a0, #118ab2, #073b4c };

    destination_list = new ArrayList();
    actor_list = new ArrayList();
    for (int i = 0; i < 180; i++) {
      Actor actor = new Actor(glocation_list, destination_list);
      actor.setColor(base_color_list[(int)random(0, base_color_list.length)]);
      actor_list.add(actor);
    }
  }

  //--------------------------------------------------------------
  void update() {
    int frame_span = 10;
    int prev_index_size = 0;

    if (frameCount % frame_span == 0) {
      prev_index_size = destination_list.size();
    }

    for (var actor : actor_list) {
      actor.update(frame_span, glocation_list, next_index_list, destination_list);
    }

    if (prev_index_size != 0) {
      //destination_list.erase(destination_list.begin(), destination_list.begin() + prev_index_size);
      ArrayList<Integer> newDestnationList = new ArrayList();
      for (int i = prev_index_size; i < destination_list.size(); i++) {
        newDestnationList.add(destination_list.get(i));
      }
      destination_list = newDestnationList;
    }
  }

  //--------------------------------------------------------------
  @Override void draw() {
    update();

    pg.beginDraw();
    pg.background(255);

    //  ofTranslate(ofGetWindowSize() * 0.5);
    pg.translate(width/2, height/2);

    color baseColor = color(0, 0, 0, 128);
    pg.stroke(baseColor);
    pg.strokeWeight(1);
    for (var location : glocation_list) {
      pg.circle(location.x, location.y, 6+(3*0.5f));  // いい感じに微調整させて頂きました
    }

    pg.strokeWeight(3);
    for (var actor : actor_list) {
      color actorColor = actor.getColor();
      pg.stroke(actorColor);
      pg.fill(actorColor);
      PVector location = actor.getLocation();
      pg.circle(location.x, location.y, 6);
      pg.noFill();

      pg.beginShape();
      for (var l : actor.getLog()) {
        pg.vertex(l.x, l.y);
      }
      pg.endShape();
    }
    pg.endDraw();
    image(pg, 0, 0);
    
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
