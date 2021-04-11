void keyPressed() {
  //-- Esc Func --
  menu_esc();
}

//==== Menu Esc Func ====
void menu_esc() {
  if (keyCode == ESC) {
    key = 0;
    
    mode = pmode.get(pmode.size()-1);
    }
}
