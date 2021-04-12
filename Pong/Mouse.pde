void mouseReleased() {
  rectcheck_all();
}

//==== Universal Rect Check ====
void rectcheck_all() {
  //-- Title Screen --
  //Play
  rectcheck(400, 550, 200, 100, 0);
}

void rectcheck(float x, float y, float dx, float dy, int buttonN) {
  if (mouseX > x - dx/2 && mouseX < x  + dx/2 && mouseY > y - dy/2 && mouseY < y + dy/2) {
    rectbuttons.set(buttonN, 1);
  }
}
