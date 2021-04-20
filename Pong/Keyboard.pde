void keyPressed() {
  //-- Esc Func --
  menu_esc();
  
  //-- Player Movement --
  pcontrol(true);
  
  //-- Screen Shot --
  screencap();
}

void keyReleased() {
  pcontrol(false);
}

//==== Menu Esc Func ====
void menu_esc() {
  if (keyCode == ESC && mode != title && game_state != playing) {
    key = 0;
    
    int lmode = pmode.get(pmode.size() - 1);
    pmode.remove(pmode.get(pmode.size() - 1));
    
    mode = lmode;
    
    game_state = ready;
  } else if (keyCode == ESC && game_state == playing && countdown == false) {
    key = 0;
    
    paused = !paused;
  } else if (keyCode == ESC && countdown == true) {
    key = 0;
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

//==== Screenshot ====
void screencap() {
  if (keyCode == CONTROL && key == 'p') {
    save("screenshot.png");
  }
}
