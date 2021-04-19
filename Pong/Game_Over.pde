void end() {
  background(DDGrey);
  
  winnerscore(width/2, height/4);
  
  escpointer(200, 650);
  playagainbutton(600, 650);
}

//==== Winner + Final Score ====
void winnerscore(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  textFont(titleFont);
  textSize(130);
  
  if (score1 > score2) {
    fill(NBlue);
    text("Blue Wins!", 0, 0);
  } else {
    fill(NRed);
    text("Red Wins!", 0, 0);
  }
  
  fill(White);
  textFont(menuFont);
  textSize(85);
  
  text(score1 + " - " + score2, 0, height/4);
  
  popMatrix();
}

//==== Esc Box ====
void escpointer(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(White);
  
  dottedLine(- 150, - 100, 150, - 100, 30);
  dottedLine(- 150, - 100, - 150, 100, 20);
  dottedLine(- 150, 100, 150, 100, 30);
  dottedLine(150, - 100, 150, 100, 20);
  
  textFont(titleFont);
  textSize(25);
  
  text("Games Won:", - 60, - 80);
  
  textSize(85);
  
  text("-", 0, 0);
  
  textFont(menuFont);
  textSize(85);
  fill(NBlue);
  
  text(wonblue, -60, 0);
  
  textFont(menuFont);
  textSize(85);
  fill(NRed);
  
  text(wonred, 60, 0);
  
  popMatrix();
}

//==== Play Again ====
void playagainbutton(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(White);
  
  dottedLine(- 150, - 100, 150, - 100, 30);
  dottedLine(- 150, - 100, - 150, 100, 20);
  dottedLine(- 150, 100, 150, 100, 30);
  dottedLine(150, - 100, 150, 100, 20);
  
  textFont(titleFont);
  textSize(60);
  
  if (mouseX > x - 150 && mouseX < x + 150 && mouseY > y - 100 && mouseY < y + 100) {
    fill(LGrey);
    
    if (mousePressed) {
      fill(Grey);
    }
  } else {
    fill(White);
  }
  
  text("Play", 0, - 30);
  text("Again", 0, 30);
  
  popMatrix();
}

void playagaincheck(float x, float y) {
  if (mouseX > x - 150 && mouseX < x + 150 && mouseY > y - 100 && mouseY < y + 100) {
    mode = game;
    game_state = ready;
    
    variabledump();
  }
}
