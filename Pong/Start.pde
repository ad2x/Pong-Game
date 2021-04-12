void start() {
  background(DDGrey);
  
  bar(-50, -50);
  bar(-50, 650);
  
  levelui(550, 0);
}

//==== Level + balance ====
//-- Level UI --
void levelui(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  stroke(NBlue);
  strokeWeight(10);
  
  line(0, 0, 0, 150);
  
  fill(DDGrey);
  textFont(menuFont);
  textSize(60);
  
  textAlign(TOP, LEFT);
  
  text("Level " + clevel, 15, 56);
  
  textAlign(CENTER, CENTER);
  
  popMatrix();
}

//==== Background UI ====
void bar(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(DGrey);
  stroke(NBlue);
  strokeWeight(15);
  
  rect(0, 0, 900, 200);
  
  popMatrix();
}
