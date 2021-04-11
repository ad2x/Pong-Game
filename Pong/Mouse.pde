void mouseReleased() {
  rectcheck(400, 550, 200, 100, 0);
}

//==== Universal Rect Check ====
void rectcheck(float x, float y, float dx, float dy, int buttonN) {
  if (mouseX > x - dx/2 && mouseX < x  + dx/2 && mouseY > y - dy/2 && mouseY < y + dy/2) {
    rectbuttons.set(buttonN, 1);
  }
}
