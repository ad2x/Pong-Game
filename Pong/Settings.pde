void options() {
  background(DGrey);
  
  difficulty_(50, 50);
  
  difficulty_button(100, 150, 166.67, 166.67, easy);
  difficulty_button(316.67, 150, 166.67, 166.67, normal);
  difficulty_button(533.34, 150, 166.67, 166.67, hard);
  
  stats_(50, 450);
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

void difficulty_button(float x, float y, float dx, float dy, int difficulty) {
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
    if (mouseX > x && mouseX < x + dx && mouseY > y && mouseY < y + dy) {
      fill(LYellow);
      if (mousePressed) {
        fill(LLYellow);
      }
    }
  } else if (difficulty == 2) {
    fill(Red);
    stroke(DRed);
    if (mouseX > x && mouseX < x + dx && mouseY > y && mouseY < y + dy) {
      fill(LRed);
      if (mousePressed) {
        fill(LLRed);
      }
    }
  }
  
  rect(0, 0, dx, dy);
  
  if (game_difficulty == difficulty) {
    noFill();
    stroke(Black);
    strokeWeight(8);
    
    circle(83.335, 83.335, 60);
  }
  
  popMatrix();
}

void difficulty_select(float x, float y, float dx, float dy, int difficulty) {
  if (mouseX > x && mouseX < x + dx && mouseY > y && mouseY < y + dy && mode == settings && game_difficulty != difficulty) {
    game_difficulty = difficulty;
    
    button.rewind();
    button.play();
    
    int[] stuffint = new int[1];
    stuffint[0] = difficulty;
    
    String[] stuffstring = str(stuffint);
    
    saveStrings("stuff.txt", stuffstring);
  }
}

//Stats 
void stats_(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DDGrey);
  strokeWeight(10);
  
  rect(0, 0, 700, 300);
  
  fill(Black);
  textFont(titleFont);
  textSize(30);
  
  text("SinglePlayer", 175, 50);
  text("MultiPlayer", 525, 50);
  
  textFont(menuFont);
  textSize(100);
  
  fill(NRed);
  
  text(wonredS, 115, 175);
  text(wonredM, 465, 175);
  
  fill(NBlue);
  
  text(wonblueS, 235, 175);
  text(wonblueM, 585, 175);
  
  fill(Black);
  
  text(":", 175, 162);
  text(":", 525, 162);
  
  popMatrix();
}
