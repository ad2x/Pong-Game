void cursor(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  noFill();
  strokeWeight(3);
  
  if (mousePressed == true) {
    stroke(#003CFA);
    ellipse(0, 0, 15, 15);
  } else {
    stroke(#033EFC);
    ellipse(0, 0, 18, 18);
  }
  
  popMatrix();
}
