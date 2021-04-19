void end() {
  background(DDGrey);
  
  winnerscore(width/2, height/4);
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
