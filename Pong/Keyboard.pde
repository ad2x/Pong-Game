void keyPressed() {
  //-- Esc Func --
  menu_esc();
  
  //-- Player Movement --
  pcontrol(true);
}

void keyReleased() {
  pcontrol(false);
}

//==== Menu Esc Func ====
void menu_esc() {
  if (keyCode == ESC && mode != title) {
    key = 0;
    
    int lmode = pmode.get(pmode.size() - 1);
    pmode.remove(pmode.get(pmode.size() - 1));
    
    mode = lmode;
  }
}

//==== Movement ====
void pcontrol(boolean keys) {
  if (mode == game && paused == false) {
    if (key == 'w' || key == 'W') {
      if (keys == true) {
        wkey = true;
      } else {
        wkey = false;
      }
    }
    if (key == 's' || key == 'S') {
      if (keys == true) {
        skey = true;
      } else {
        skey = false;
      }
    }
    if (keyCode == UP){
      if (keys == true) {
        upkey = true;
      } else {
        upkey = false;
      }
    }
    if (keyCode == DOWN){
      if (keys == true) {
        downkey = true;
      } else {
        downkey = false;
      }
    }
  }
}
