// コングラチュレーション画面
//
// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Spherical pillar. Draw by openFrameworks
// https://junkiyoshi.com/2022/02/02/
//

class GameSceneCongratulations277 extends GameSceneCongratulationsBase {
  class ofMeshFace {
    PVector[] vertices;
    ofMeshFace(PVector v0, PVector v1, PVector v2) {
      vertices = new PVector[3];
      vertices[0] = v0;
      vertices[1] = v1;
      vertices[2] = v2;
    }
    PVector getVertex(int index) {
      return vertices[index];
    }
  }
  ofMeshFace[] triangle_list;
  ofMeshFace[] loadTriangleList(String filePath) {
    String[] lines = loadStrings(filePath);
    float[] vertices = new float[lines.length];
    for (int i = 0; i < lines.length; i++) {
      String s = lines[i];
      vertices[i] = float(s);
    }

    ofMeshFace[] triangleList = new ofMeshFace[vertices.length / (3 * 3)];
    for (int i = 0; i < vertices.length; i += (3 * 3)) {
      PVector v0 = new PVector(vertices[i + (0*3+0)], vertices[i + (0*3+1)], vertices[i + (0*3+2)]);
      PVector v1 = new PVector(vertices[i + (1*3+0)], vertices[i + (1*3+1)], vertices[i + (1*3+2)]);
      PVector v2 = new PVector(vertices[i + (2*3+0)], vertices[i + (2*3+1)], vertices[i + (2*3+2)]);
      triangleList[i / (3 * 3)] = new ofMeshFace(v0, v1, v2);
    }
    return triangleList;
  }

  class ofMesh {
    ArrayList<PVector> vertices;
    ArrayList<Integer> indices;
    ofMesh() {
      vertices = new ArrayList();
      indices = new ArrayList();
    }
    void addVertices(ArrayList<PVector> vs) {
      vertices.addAll(vs);
    }
    void addIndex(int index) {
      indices.add(index);
    }
    void addTriangle(int i0, int i1, int i2) {
      addIndex(i0);
      addIndex(i1);
      addIndex(i2);
    }
    int getNumVertices() {
      return vertices.size();
    }
    int getNumIndices() {
      return indices.size();
    }
    PVector getVertex(int i) {
      return vertices.get(i);
    }
    int getIndex(int i) {
      return indices.get(i);
    }
    void clear() {
      vertices = new ArrayList();
      indices = new ArrayList();
    }
  }
  ofMesh mesh;
  ofMesh frame;

  @Override void setup() {
    //auto ico_sphere = ofIcoSpherePrimitive(300, 3);
    //triangle_list.insert(triangle_list.end(), ico_sphere.getMesh().getUniqueFaces().begin(), ico_sphere.getMesh().getUniqueFaces().end());

    //triangle_list = loadTriangleList("data/277/triangle_list.txt");

    // PC-8001（TN8001）さんありがとう＼(^_^)／
    // （。。。こうしてワトソンはすごすごと引き上げるのであった...orz）
    PShape s = new Sphere(300, 3).get();
    triangle_list = new ofMeshFace[s.getVertexCount() / 3];
    for (int i = 0; i < s.getVertexCount(); i += 3) {
      PVector v0 = s.getVertex(i+0);
      PVector v1 = s.getVertex(i+1);
      PVector v2 = s.getVertex(i+2);
      triangle_list[i / 3] = new ofMeshFace(v0, v1, v2);
    }

    //  frame.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);

    mesh = new ofMesh();
    frame = new ofMesh();
  }
  //vertices.add(PVector.normalize(triangle_list[i].getVertex(0)) * (radius + 5) - avg);
  PVector verticesNormalize(PVector v, float r, PVector avg) {
    PVector n = new PVector(v.x, v.y, v.z);
    n.normalize();
    n.mult(r);
    n.sub(avg);
    return n;
  }

  //--------------------------------------------------------------
  void update() {
    mesh.clear();
    frame.clear();

    for (float radius = 150; radius <= 300; radius += 10) {
      for (int i = 0; i < triangle_list.length; i++) {
        //      PVector avg = (triangle_list[i].getVertex(0) + triangle_list[i].getVertex(1) + triangle_list[i].getVertex(2)) / 3;
        var t = triangle_list[i];
        PVector avg = PVector.add(t.getVertex(0), t.getVertex(1));
        avg.add(t.getVertex(2));
        avg.div(3.0f);
        var noise_value = openFrameworks.ofNoise(avg.y * 0.0065 + frameCount * 0.035, avg.x * 0.0025, avg.z * 0.0025);

        if (noise_value < 0.35) {
          noise_value = 0;
        } else if (noise_value > 0.7) {
          noise_value = 1;
        } else {
          noise_value = map(noise_value, 0.35, 0.7, 0, 1);
        }

        ArrayList<PVector> vertices = new ArrayList();

        //vertices.add(PVector.normalize(triangle_list[i].getVertex(0)) * (radius + 5) - avg);
        //vertices.add(PVector.normalize(triangle_list[i].getVertex(1)) * (radius + 5) - avg);
        //vertices.add(PVector.normalize(triangle_list[i].getVertex(2)) * (radius + 5) - avg);

        //vertices.add(PVector.normalize(triangle_list[i].getVertex(0)) * (radius - 5) - avg);
        //vertices.add(PVector.normalize(triangle_list[i].getVertex(1)) * (radius - 5) - avg);
        //vertices.add(PVector.normalize(triangle_list[i].getVertex(2)) * (radius - 5) - avg);

        vertices.add(verticesNormalize(t.getVertex(0), radius + 5, avg));
        vertices.add(verticesNormalize(t.getVertex(1), radius + 5, avg));
        vertices.add(verticesNormalize(t.getVertex(2), radius + 5, avg));

        vertices.add(verticesNormalize(t.getVertex(0), radius - 5, avg));
        vertices.add(verticesNormalize(t.getVertex(1), radius - 5, avg));
        vertices.add(verticesNormalize(t.getVertex(2), radius - 5, avg));

        for (var vertex : vertices) {
          //vertex *= noise_value;
          //vertex += avg;
          vertex.mult(noise_value);
          vertex.add(avg);
        }

        mesh.addVertices(vertices);
        frame.addVertices(vertices);

        //for (int k = 0; k < 6; k++) {
        //  mesh.addColor(ofColor(0));
        //  frame.addColor(ofColor(255));
        //}

        mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 2, mesh.getNumVertices() - 3);
        mesh.addTriangle(mesh.getNumVertices() - 4, mesh.getNumVertices() - 5, mesh.getNumVertices() - 6);

        mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 2, mesh.getNumVertices() - 5);
        mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 5, mesh.getNumVertices() - 4);

        mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 3, mesh.getNumVertices() - 6);
        mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 6, mesh.getNumVertices() - 4);

        mesh.addTriangle(mesh.getNumVertices() - 2, mesh.getNumVertices() - 3, mesh.getNumVertices() - 6);
        mesh.addTriangle(mesh.getNumVertices() - 2, mesh.getNumVertices() - 6, mesh.getNumVertices() - 5);

        if (radius == 150) {
          frame.addIndex(frame.getNumVertices() - 1);
          frame.addIndex(frame.getNumVertices() - 2);
          frame.addIndex(frame.getNumVertices() - 2);
          frame.addIndex(frame.getNumVertices() - 3);
          frame.addIndex(frame.getNumVertices() - 1);
          frame.addIndex(frame.getNumVertices() - 3);
        }

        if (radius == 300) {
          frame.addIndex(frame.getNumVertices() - 4);
          frame.addIndex(frame.getNumVertices() - 5);
          frame.addIndex(frame.getNumVertices() - 5);
          frame.addIndex(frame.getNumVertices() - 6);
          frame.addIndex(frame.getNumVertices() - 4);
          frame.addIndex(frame.getNumVertices() - 6);
        }

        frame.addIndex(frame.getNumVertices() - 1);
        frame.addIndex(frame.getNumVertices() - 4);
        frame.addIndex(frame.getNumVertices() - 2);
        frame.addIndex(frame.getNumVertices() - 5);
        frame.addIndex(frame.getNumVertices() - 3);
        frame.addIndex(frame.getNumVertices() - 6);
      }
    }
  }

  //--------------------------------------------------------------
  @Override void draw() {
    push();
    update();

    translate(width/2, height/2);
    background(0);

    rotateY(radians(frameCount * 0.333333333333333333));

    //  mesh.drawFaces();
    noStroke();
    fill(0);
    beginShape(TRIANGLES);
    for (int i = 0; i < mesh.getNumIndices(); i++) {
      int idx = mesh.getIndex(i);
      PVector v = mesh.getVertex(idx);
      vertex(v.x, v.y, v.z);
    }
    endShape();

    //  frame.drawWireframe();
    stroke(255);
    beginShape(LINES);
    for (int i = 0; i < frame.getNumIndices(); i++) {
      int idx = frame.getIndex(i);
      PVector v = frame.getVertex(idx);
      vertex(v.x, v.y, v.z);
    }
    endShape();
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
