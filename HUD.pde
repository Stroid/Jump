class HUD {
  void display() {
    fill(0);
    if (max_score > 0) {
      text((int)score + " | " + (int)max_score, 10, 10);
    } else {
      text((int)score, 10, 10);
    }
  }
}
