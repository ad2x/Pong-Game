void mouseReleased() {
  if (mouseButton == LEFT) {
    rectcheck_all();
  }
  
  //Start Menu Buttons
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
