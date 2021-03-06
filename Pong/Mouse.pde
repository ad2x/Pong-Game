void mouseReleased() {
  if (mouseButton == LEFT) {
    rectcheck_all();
  }
  
  //Ready Button
  if (mode == game && game_state == ready) {
    readybuttoncheck(300, 600, 0);
    readybuttoncheck(width/4 - 100, 600, 1);
    readybuttoncheck(3*width/4 - 100, 600, 2);
  }
  
  //Play Again Button
  if (mode == end) {
    playagaincheck(600, 650);
  }
  
  //Difficulty Settings
  difficulty_select(100, 150, 166.67, 166.67, easy);
  difficulty_select(316.67, 150, 166.67, 166.67, normal);
  difficulty_select(533.34, 150, 166.67, 166.67, hard);
  
  //Exit Button
  exitfunc(50, 50);
}

//==== Universal Rect Check ====
void rectcheck_all() {
  switch(mode) {
    case 0:
      //Play
      rectcheck(400, 550, 200, 100, 0);
      break;
    case 1:
      //Multiplayer
      rectcheck(300, 200, 275, 105, 1);
      //Singleplayer
      rectcheck(500, 410, 275, 105, 2);
      //Settings
      rectcheck(300, 620, 275, 105, 3);
      break;
    default:
      break;
  }
}

void rectcheck(float x, float y, float dx, float dy, int buttonN) {
  if (mouseX > x - dx/2 && mouseX < x  + dx/2 && mouseY > y - dy/2 && mouseY < y + dy/2) {
    rectbuttons.set(buttonN, 1);
  }
}
