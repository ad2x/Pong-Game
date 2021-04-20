void title() {
  background(DDGrey);
  
  //-- Title --
  title_title(width/2, height/4);
  
  //-- Play Button --
  rect_mode_button(400, 550, 200, 100, 15, "Play", 55, 0, 1, 2, 0);
}

//==== Title ====
void title_title(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(White);
  textSize(200);
  textFont(titleFont);
  
  text("Pong", 0, 0);
  
  popMatrix();
}
