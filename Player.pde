class Player {
  PVector pos, vel, acc;
  float startY;

  Boolean jump = false;
  PVector jump_force;
  PVector gravity;

  float w = 20;
  float h = 40;

  Player() {
    this.pos = new PVector(100, 195);
    this.vel = new PVector();
    this.acc = new PVector();
    this.startY = this.pos.y;

    this.jump_force = new PVector(0, -10);
    this.gravity = new PVector(0, 0.5);
  }
  void update() {
    this.vel.add(acc);
    this.pos.add(vel);
    this.acc.mult(0);

    if (this.pos.y >= this.startY) {
      this.jump = false;
      this.pos.y = this.startY;
      this.vel.mult(0);
    } else {
      this.jump = true;
      addForce(gravity);
    }
  }
  void display() {
    if (debug) {
      noFill();
      stroke(0, 255, 0);
      rect(this.pos.x, this.pos.y, this.w, this.h);
    }
  }
  void jump() {
    if (!jump) addForce(jump_force);
  }
  void addForce(PVector force) {
    this.acc.add(force);
  }
}
