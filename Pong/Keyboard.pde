void keyPressed() {
  //-- Esc Func --
  menu_esc();
}

//==== Menu Esc Func ====
void menu_esc() {
  if (keyCode == ESC) {
    key = 0;
    
    switch(mode) {
      case 0:
        exit();
        break;
      case 1:
        mode = title;
        break;
      case 2:
        mode = title;
        break;
    }
  }
}
