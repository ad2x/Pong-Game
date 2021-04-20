void options() {
  background(DGrey);
  
  difficulty_(50, 50);
  
  difficultybutton(100, 150, 166.67, 166.67, 0);
  difficultybutton(216.67, 150, 166.67, 166.67, 1);
}

//==== Difficulty ====
void difficulty_(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DDGrey);
  strokeWeight(10);
  
  rect(0, 0, 700, 300);
  
  fill(Black);
  textFont(titleFont);
  textSize(60);
  
  text("Difficulty", 350, 30);
  
  popMatrix();
}

void difficultybutton(float x, float y, float dx, float dy, int difficulty) {
  pushMatrix();
  translate(x, y);
  
  if (difficulty == 0) {
    fill(Green);
    stroke(DGreen);
    if (mouseX > x && mouseX < x + dx && mouseY > y && mouseY < y + dy) {
      fill(LGreen);
      if (mousePressed) {
        fill(LLGreen);
      }
    }
  } else if (difficulty == 1) {
    fill(Yellow);
    stroke(DYellow);
    if (mouseX > 0 && mouseX < dx && mouseY > 0 && mouseY < dy) {
      fill(LYellow);
      if (mousePressed) {
        fill(LLYellow);
      }
    }
  } else if (difficulty == 2) {
    fill(Red);
    stroke(DRed);
    if (mouseX > 0 && mouseX < dx && mouseY > 0 && mouseY < dy) {
      fill(LRed);
      if (mousePressed) {
        fill(LLRed);
      }
    }
  }
  
  rect(0, 0, dx, dy);
  
  popMatrix();
}
