void title_screen() {
  background(DDGrey);
  
  //-- Title --
  title_title(width/2, height/4);
  
  //-- Play Button --
  title_play_button(width/4, 2.75*height/4, 2.5*width/8, 1.2*height/8, "Singleplayer");
  title_play_button(3*width/4, 2.75*height/4, 2.5*width/8, 1.2*height/8, "Multiplayer");
}

//==== Title ====
void title_title(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  fill(White);
  textSize(width/4);
  textFont(titleFont);
  
  text("Pong", 0, 0);
  
  popMatrix();
}

//==== Play Button ====
//-- Button --
void title_play_button(float x, float y, float dx, float dy, String name) {
  pushMatrix();
  translate(x, y);
  
  fill(White);
  stroke(LLGrey);
  
  //-- Hover --
  if (mouseX > x - 125 && mouseX < x  + 125 && mouseY > y - 60 && mouseY < y + 60) {
    stroke(LGrey);
    
    //-- Tactility
    if (mousePressed) {
      stroke(Grey);
    }
  }  
  
  strokeWeight((width + height)/160);
  
  rect(-dx/2, -dy/2, dx, dy);
  
  //-- Text --
  
  fill(DDGrey);
  textSize(60);
  textFont(menuFont);
  
  text(name, 0, 0);
  
  popMatrix();
}

//-- Check --
void title_play_button_check(float x, float y, float dx, float dy, int game_mode) {
  if (mouseX > x - dx/2 && mouseX < x + dx/2 && mouseY > y - dy/2 && mouseY < y + dy/2 && mode == title) {
    mode = game_mode;
  }
}
