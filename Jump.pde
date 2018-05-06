//Jump
boolean debug = true;        // Show bounding boxes
color fgColor = color(0);    //Foreground color
color bgColor = color(255);  //Background color

int horizon = 75; // Horizon line height (From Bottom)

float enemy_speed = 5;  // Speed of enemies
int enemy_spacing = 60; // frames between enemies
int next_enemy = enemy_spacing;

HUD hud;

Player player;
ArrayList<Enemy> Enemies = new ArrayList();

float score = 0;
float max_score;
float score_gain = .5; 

void setup() {
  size(800, 300);

  hud = new HUD();

  player = new Player();
  spawn_enemy();
}

void draw() {
  background(bgColor);
  hud.display();

  score += score_gain;

  player.update();
  player.display();

  // Add enemy
  if (frameCount - next_enemy == 0) {
    spawn_enemy();
  }
  for (int i = Enemies.size() - 1; i >= 0; i--) {
    // Get the current enemy
    Enemy temp = Enemies.get(i); 

    //Update the enemy
    temp.update();

    //If the enemy are outside of the window remove enemy.
    if (temp.pos.x < -temp.w) {
      Enemies.remove(temp);
      break;
    }

    //Check if the player has collided with the enemy
    if (temp.collition()) {
      reset();
    }

    //Display enemy
    temp.display();
  }

  stroke(fgColor);
  line(0, height - horizon, width, height - horizon);
}

void reset() {
  Enemies.clear();
  if (score > max_score) {
    max_score = score;
  }
  score = 0;
}

void keyPressed() {
  if (key == ' ') {
    player.jump();
  }
}
void spawn_enemy() {
  //Enemies.add(new Cactai());
  Enemies.add(new Bird(2));
  enemy_spacing = (int)random(50, 70);
  next_enemy += enemy_spacing;
}
