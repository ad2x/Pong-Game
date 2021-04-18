void game() {
  background(DGrey);
  
  //Divider
  divider();
  
  //Paddles
  paddle(leftx, lefty, leftd, true);
  paddle(rightx, righty, rightd, false);
  
  //Ball
  ball(ballx, bally, balld);
}

//==== Paddles ====
void paddle(float x, float y, float d, boolean player) {
  pushMatrix();
  translate(x, y);
  
  fill(DDGrey);
  if (player == true) {
    stroke(NBlue1);
    if (dist(ballx, bally, leftx, lefty) <= (balld + leftd)/2) {
      stroke(NBlueD);
    } 
  } else {
    stroke(NRed);
    if (dist(ballx, bally, rightx, righty) <= (balld + rightd)/2) {
      stroke(NRed1);
    } 
  }
  strokeWeight(10);
  
  circle(0, 0, d);
  
  popMatrix();
  
  //Movement
  if (wkey == true  && lefty > leftd/2) lefty = lefty - 5;
  if (skey == true  && lefty < height - leftd/2) lefty = lefty + 5;
  
  if (upkey == true) {
    if (game_mode == 1) {
      if (righty > rightd/2) righty = righty - 5;
    }
  }
  
  if (downkey == true) {
    if (game_mode == 1) {
      if (righty < height - rightd/2) righty = righty + 5;
    }
  }
}

//==== Ball ====
void ball(float x, float y, float d) {
  pushMatrix();
  translate(x, y);
  
  fill(DDGrey);
  stroke(ballstroke);
  strokeWeight(6);
  
  circle(0, 0, d);
  
  popMatrix();
  
  //Movement
  if (bally < balld/2 || bally > height - balld/2) ballvy = -ballvy;
  
  if (dist(ballx, bally, leftx, lefty) <= (balld + leftd)/2) {
    ballvx = (ballx - leftx)/15;
    ballvy = (bally - lefty)/15;
    ballstroke = NBlue;
  }
  
  if (dist(ballx, bally, rightx, righty) <= (balld + rightd)/2) {
    ballvx = (ballx - rightx)/15;
    ballvy = (bally - righty)/15;
    ballstroke = NRed;
  }
  
  if (paused == false) {
  ballx = ballx + ballvx;
  bally = bally + ballvy;
  }
}

//==== Background Stuff ====
void divider() {
  fill(DDGrey);
  strokeWeight(10);
  
  dottedLine(width/2, 0, width/2, height, 50);
}
