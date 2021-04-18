void game() {
  background(DGrey);
  
  //Score Counters
  scorecounter(width/4, height/2, score1);
  scorecounter(3*width/4, height/2, score2);
  
  //Divider
  divider();
  
  //Paddles
  paddle(leftx, lefty, leftd, true);
  paddle(rightx, righty, rightd, false);
  
  //Ball
  ball(ballx, bally, balld);
  
  if (game_state == ready) {
    if (game_mode == singleplayer) {
      readybutton(300, 600, 0);
    } else {
      
    }
  }
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
  if (player == true) {
    if (wkey == true  && lefty > leftd/2) lefty = lefty - 7;
    if (skey == true  && lefty < height - leftd/2) lefty = lefty + 7;
    
    if (upkey == true) {
      if (game_mode == 1) {
        if (righty > rightd/2) righty = righty - 7;
      }
    }
    
    if (downkey == true) {
      if (game_mode == 1) {
        if (righty < height - rightd/2) righty = righty + 7;
      }
    }
  }
  
  if (game_mode == singleplayer && player == false && ballx < width) {
    if (abs(bally - righty) > 5) {
      if (bally > righty && righty < height - d/2) {
        righty = righty + 5;
      } else if (bally < righty && righty > d/2) {
        righty = righty - 5;
      }
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
  
  //Scoring
  if (ballx < -d) {
    ballx = width/2;
    bally = height/2;
    ballvy = 0;
    ballvx = 8;
    
    score2++;
  } else if (ballx > width + d) {
    ballx = width/2;
    bally = height/2;
    ballvy = 0;
    ballvx = -8;
    
    score1++;
  }
}

//==== Background Stuff ====
void divider() {
  fill(DDGrey);
  strokeWeight(10);
  
  dottedLine(width/2, 0, width/2, height, 50);
}

//==== Ready Button ====
void readybutton(float x, float y, int ready_check) {
  pushMatrix();
  translate(x, y);
    
  if (ready_checks.get(ready_check) == 1) {
    stroke(#09f311);
  } else {
    stroke(White);
  }
  
  fill(DGrey);
  
  rect(0, 0, 200, 100);
  
  if (ready_checks.get(ready_check) == 1) {
    fill(#09f311);
  } else {
    fill(White);
  }
  
  textFont(menuFont);
  textSize(60);
  
  text("Ready", 100, 50);
    
  popMatrix();
  
  //Button functionality
  if (ready_checks.get(ready_check) == 1) {
    game_state = playing;
    paused = false;
    ready_checks.set(ready_check, 0);
  }
}

void readybuttoncheck(float x, float y, int ready_check) {
  if (mouseX > x && mouseX < x + 200 && mouseY > y && mouseY < y + 100) {
    if (ready_checks.get(ready_check) == 0) {
      ready_checks.set(ready_check, 1);
    } else {
      ready_checks.set(ready_check, 0);
    }
  }
}

//==== Scores ====
void scorecounter(float x, float y, int score) {
  pushMatrix();
  translate(x, y);
  
  fill(Black, 80);
  textFont(titleFont);
  textSize(180);
    
  text(score, 0, 0);
    
  popMatrix();
}
