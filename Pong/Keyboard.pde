void keyPressed() {
  //-- Esc Func --
  menu_esc();
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
