void start() {
  background(DGrey);
  
  //Buttons 
  if (multip_button == true) {
    same_pc_button(0, 50);
    lan_button(0, 233);
  } else {
    multiplayer_button(0, 0);
  }
  
  border();
}

//==== Background UI ====
void border() {
  fill(DDGrey);
  stroke(NBlue);
  strokeWeight(10);
  
  rect(-50, -50, 900, 100);
  rect(-50, height - 50, 900, 100);
  rect(width - 50, - 50, 100, 900);
  rect(-50, -50, 100, 900);
  
  int d = 250;
  
  ellipse(0, 0, d, d);
  ellipse(0, height, d, d);
  ellipse(width, 0, d, d);
  ellipse(width, height, d, d);
}

//==== Single-Player Button ====

//==== Multiplayer Buttons ====
//-- Main Button --
void multiplayer_button(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(DDGrey);
  stroke(NBlue);
  strokeWeight(10);
  
  if (mouseX > x + 50 && mouseX < x + 400 && mouseY > y + 50 && mouseY < y + 400) {
    stroke(NBlue1);
    if (mousePressed == true) {
      stroke(NBlue2);
    }
  }
  
  rect(0, 0, 400, 400);
  
  popMatrix();
}

void multiplayer_button_check(float x, float y) {
  if (mouseX > x + 50 && mouseX < x + 400 && mouseY > y + 50 && mouseY < y + 400) {
    if (mode == start && multip_button == false) {
      multip_button = true;
    }
  } else {
    multip_button = false;
  }
}

//-- 1 Computer vs Lan --
void same_pc_button(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(DGrey);
  stroke(NBlue);
  strokeWeight(10);
  
  if (mouseX > x + 50 && mouseX < x + 400 && mouseY > y + 50 && mouseY < y + 175) {
    stroke(NBlue1);
    if (mousePressed == true) {
      stroke(NBlue2);
    }
  }
  
  rect(0, 0, 400, 175);
  
  popMatrix();
}

void lan_button(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(DGrey);
  stroke(NBlue);
  strokeWeight(10);
  
  if (mouseX > x + 50 && mouseX < x + 400 && mouseY > y && mouseY < y + 167) {
    stroke(NBlue1);
    if (mousePressed == true) {
      stroke(NBlue2);
    }
  }
  
  rect(0, 0, 400, 167);
  
  popMatrix();
}
//==== Stats ====
