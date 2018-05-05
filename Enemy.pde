class Enemy {
  PVector pos;
  Float w, h;
  Enemy(float x, float y, float w, float h) {
    this.pos = new PVector(x, y);

    this.w = w;
    this.h = h;
  }

  void update() {
  this.pos.x -= enemy_speed;
}

  void display() {
    if (debug) {
      noFill();
      stroke(255, 0, 0);
      rect(this.pos.x, this.pos.y, this.w, this.h);
    }
  }
boolean  collition() {
  float x1 = this.pos.x;
  float y1 = this.pos.y;
  float w1 = this.w;
  float h1 = this.h;
  float x2 = player.pos.x;
  float y2 = player.pos.y;
  float w2 = player.w;
  float h2 = player.h;
  
  if (x2 - x1 + w2 < 0) {
    return false;
  }
  if (x2 - x1 - w1 > 0) {
    return false;
  }
  if (y2 - y1 + h2 < 0) {
    return false;
  }
  if (y2 - y1 - h1 > 0) {
    return false;
  }
  return true;
}
}
