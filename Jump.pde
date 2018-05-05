//Jump
boolean debug = true;        // Show bounding boxes
color fgColor = color(0);    //Foreground color
color bgColor = color(255);  //Background color

int horizon = 75; // Horizon line height (From Bottom)

float enemy_speed = 5;  // Speed of enemies
int enemy_spacing = 60; // frames between enemies



Player player;
ArrayList<Enemy> Enemies = new ArrayList();


void setup() {
  size(800, 300);

  player = new Player();
  spawn_enemy();
}

void draw() {
  background(bgColor);

  player.update();
  player.display();

  // Add enemy
  println(Enemies.size());
  if (frameCount % enemy_spacing == 0) {
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
      fill(0);
      rect(0, 0, 10, 10);
    }

    //Display enemy
    temp.display();
  }

  stroke(fgColor);
  line(0, height - horizon, width, height - horizon);
}

void keyPressed() {
  if (key == ' ') {
    player.jump();
  }
}
void spawn_enemy() {
  Enemies.add(new Cactai());
}
