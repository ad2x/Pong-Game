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
      readybutton(width/4 - 100, 600, 1);
      readybutton(3*width/4 - 100, 600, 2);
    }
  }
  
  //Timer
  if (countdown == true) {
    countdowntimer(width/2, height/4, timer);
  }
  
  gameend();
  counterincrease();
  
  //Paused Effect
  if (paused == true && game_state == playing) {
    fill(Black, 60);
    noStroke();
    rect(0, 0, width, height);
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
    if (wkey == true  && lefty > leftd) lefty = lefty - 7;
    if (skey == true  && lefty < height - leftd) lefty = lefty + 7;
    
    if (upkey == true) {
      if (game_mode == 1) {
        if (righty > rightd) righty = righty - 7;
      }
    }
    
    if (downkey == true) {
      if (game_mode == 1) {
        if (righty < height - rightd) righty = righty + 7;
      }
    }
  }
  
  if (game_mode == singleplayer && player == false && ballx < width) {
    if (abs(bally - righty) > 5) {
      if (bally > righty && righty < height - d && paused == false) {
        righty = righty + 5;
      } else if (bally < righty && righty > d && paused == false) {
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
  
  if (bally < d/2 - 50) {
    bally = d/2;
  } else if (bally > height - d/2 + 50) {
    bally = height - d/2;
  }
  
  //Scoring
  if (ballx < -d) {
    ballx = width/2;
    bally = height/2;
    ballvy = 0;
    ballvx = 8;
    
    score2++;
    
    timer = second() + minute()*60;
    countdown = true;
    
    paused = true;
    
    wkey = skey = downkey = upkey = false;
  } else if (ballx > width + d) {
    ballx = width/2;
    bally = height/2;
    ballvy = 0;
    ballvx = -8;
    
    score1++;
    
    timer = second() + minute()*60;
    countdown = true;
    
    paused = true;
    
    wkey = skey = downkey = upkey = false;
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
  
  fill(DGrey);
  
  stroke(White);
  
  if (mouseX > x && mouseX < x + 200 && mouseY > y && mouseY < y + 100) {
    stroke(#09f311);
  }
  
  if (ready_checks.get(ready_check) == 1) {
    stroke(#02DE07);
  }
  
  rect(0, 0, 200, 100);
  
  fill(White);
  
  if (mouseX > x && mouseX < x + 200 && mouseY > y && mouseY < y + 100) {
    fill(#09f311);
  }
  
  if (ready_checks.get(ready_check) == 1) {
    fill(#02DE07);
  }
  
  textFont(menuFont);
  textSize(60);
  
  text("Ready", 100, 50);
    
  popMatrix();
  
  //Button functionality
  if (ready_checks.get(0) == 1 && game_mode == singleplayer) {
    game_state = playing;
    paused = false;
    ready_checks.set(0, 0);
  }
  
  if (ready_checks.get(1) == 1 && ready_checks.get(2) == 1 && game_mode == multiplayer) {
    game_state = playing;
    paused = false;
    ready_checks.set(1, 0);
    ready_checks.set(2, 0);
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

//==== Countdown ====
void countdowntimer(float x, float y, int time) {
  pushMatrix();
  translate(x, y);
  
  fill(DDGrey, 90);
  textFont(titleFont);
  textSize(300);
  
  int secondsleft = time - (second() + minute() * 60) + 3;
  
  text(secondsleft, 0, 0);
  
  popMatrix();
  
  //End timer
  if (secondsleft == 0) {
    countdown = false;
    paused = false;
  }
  
  //Not really related to the timer itself but needs to only happen while the timer is called
  if (abs(height/2 - lefty) > 8) {
    if (lefty < height/2) {
      lefty = lefty + 8;
    } else if (lefty > height/2) {
      lefty = lefty - 8;
    }
  }
  
  if (abs(height/2 - righty) > 8) {
    if (righty < height/2) {
      righty = righty + 8;
    } else if (righty > height/2) {
      righty = righty - 8;
    }
  }
}

//==== Game End Check ====
void gameend() {
  if (counter == 24) {   
    mode = end;
    counter = 0;
    
    if (score1 > score2) {
      wonblue++;
    } else {
      wonred++;
    }
  }
}

void counterincrease() {
  if (score1 == 1|| score2 == 1) {
    counter++;
  }
}
