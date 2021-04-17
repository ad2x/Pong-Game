void start() {
  background(DGrey);
  
  //Buttons 
  rect_mode_button(300, 200, 275, 105, 5, "2 Player", 40, 1, 2, 1, 1);
  rect_mode_button(500, 410, 275, 105, 5, "Singleplayer", 35, 2, 2, 0, 1);
  rect_mode_button(300, 620, 275, 105, 5, "Settings", 42, 3, 4, 2, 1);
  
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
