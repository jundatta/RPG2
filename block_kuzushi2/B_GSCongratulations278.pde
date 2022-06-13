// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】元ネタはRoni Kaufmanさん
//　　　　 ⇒A fork of Iceberg by Richard Bourne
//         自動化（Iceberg Auto）にしたのはRichard Bourneさん
// 【作品名】Iceberg Auto（元ネタの名前はIceberg）
// https://openprocessing.org/sketch/1427999
// https://openprocessing.org/sketch/1427685（Roni Kaufmanさん）
//

class GameSceneCongratulations278 extends GameSceneCongratulationsBase {
  // By Roni Kaufman
  // https://ronikaufman.github.io
  // https://twitter.com/KaufmanRoni

  /*
Algorithm inspired by the one described by Matt DesLauriers in this talk: https://youtube.com/watch?v=tPqGn-4VdgA
   "1. use a large set of random 2D points
   2. select a cluster of points and outline it
   3. remove these points from the data set
   4. repeat from step 2 on remaining points"
   */

  ArrayList<ArrayList<PVector>> clusters;
  ArrayList<ArrayList<PVector>> hulls;

  boolean bYouDied = false;

  @Override void setup() {
    var size = max(width, height)*.95;
    noStroke();
    fill(255);

    ArrayList<PVector> points = new ArrayList();
    for (var i = 0; i < 2000; i++) {
      points.add(new PVector(width/2+random(-size/2, size/2), height/2+random(-size/2, size/2)));
    }

    clusters = divide(points);
    hulls = new ArrayList();
    //hulls = [convexHull(clusters[0]), convexHull(clusters[1])];
    hulls.add(convexHull(clusters.get(0)));
    hulls.add(convexHull(clusters.get(1)));
  }
  @Override void draw() {
    if (frameCount%60 == 0) {
      mouseX = (int)random(130, width - 130);
      mouseY = (int)random(60, height - 60);
      mouseReleased();
    }
    background(#2560AC);
    for (var hull : hulls) {
      if (hull.size() > 3) {
        beginShape();
        for (var p : hull) {
          vertex(p.x, p.y);
        }
        endShape(CLOSE);
      }
    }

    logoRightLower(#ff0000);
  }

  void mouseReleased() {
    var p = new PVector(mouseX, mouseY);
    fill(230, 230, random(230, 255));
    if (bYouDied) {
      fill(255, 0, 0);
      bYouDied = false;
    }
    int argmin = -1;
    float minDist = width*height;

    for (var i = 0; i < clusters.size(); i++) {
      for (var q : clusters.get(i)) {
        var d = distSquared(p, q);
        if (d < minDist) {
          argmin = i;
          minDist = d;
          continue;
        }
      }
    }

    if (hulls.get(argmin).size() > 5) {
      //    var clu = clusters.splice(argmin, 1)[0];
      ArrayList<PVector> clu = clusters.remove(argmin);
      ArrayList<ArrayList<PVector>> newClusters = divide(clu);
      //clusters = [...clusters, ...newClusters];
      for (ArrayList<PVector> nc : newClusters) {
        clusters.add(nc);
      }
      hulls.remove(argmin);
      //hulls = [...hulls, convexHull(newClusters[0]), convexHull(newClusters[1])];
      hulls.add(convexHull(newClusters.get(0)));
      hulls.add(convexHull(newClusters.get(1)));
    }
  }

  // divide points into two convex clusters
  ArrayList<ArrayList<PVector>> divide(ArrayList<PVector> points) {
    ArrayList<ArrayList<PVector>> clusters = new ArrayList();

    // initialize centroids randomly
    ArrayList<PVector> centroids = new ArrayList();
    for (var i = 0; i < 2; i++) {
      PVector c;
      do {
        c = P5JSrandom(points);
      } while (centroids.indexOf(c) != -1);
      centroids.add(c);
      clusters.add(new ArrayList());
    }

    // assign clusters
    for (var p : points) {
      var argmin = 0;
      var minDist = distSquared(p, centroids.get(0));
      for (var i = 1; i < 2; i++) {
        var d = distSquared(p, centroids.get(i));
        if (d < minDist) {
          minDist = d;
          argmin = i;
        }
      }
      clusters.get(argmin).add(p);
    }

    return clusters;
  }

  ArrayList<PVector> convexHull(ArrayList<PVector> points) {
    // adapted from https://en.wikipedia.org/wiki/Gift_wrapping_algorithm#Pseudocode
    points.sort((p, q) -> (int)(p.x - q.x));
    ArrayList<PVector> hull = new ArrayList();
    PVector endPoint;
    var pointOnHull = points.get(0);
    boolean bEquals = false;
    // PC-8001（TN8001）さんありがとう＼(^_^)／
    int i = 0;
    do {
      // 抜けてこなくなったら自爆する
      if (42 < i++) {
        println("you died");
        bYouDied = true;
        break;
      }
      hull.add(pointOnHull);
      endPoint = points.get(0);
      for (var j = 0; j < points.size(); j++) {
        var p = PVector.sub(endPoint, pointOnHull);
        var q = PVector.sub(points.get(j), pointOnHull);
        bEquals = (endPoint.x == pointOnHull.x) && (endPoint.y == pointOnHull.y);
        if (bEquals || (p.cross(q)).z < 0) {
          endPoint = points.get(j);
        }
      }
      pointOnHull = endPoint;
      bEquals = (endPoint.x == points.get(0).x) && (endPoint.y == points.get(0).y);
    } while (!bEquals);
    return hull;
  }
  
  float distSquared(PVector p, PVector q) {
    return sq(p.x - q.x) + sq(p.y - q.y);
  }
  
  @Override void mousePressed() {
    gGameStack.change(new GameSceneTitle());
  }
  @Override void keyPressed() {
    super.keyPressed();

    gGameStack.change(new GameSceneTitle());
  }
}
