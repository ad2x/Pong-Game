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
  if (paused == true && game_state == playing && countdown == false) {
    fill(Black, 60);
    noStroke();
    rect(0, 0, width, height);
  }
  
  //Exit Button
  exitbutton(50, 50);
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
        switch(game_difficulty) {
          case 0:
            righty = righty + 3;
            break;
          case 1:
            righty = righty + 4;
            break;
          case 2:
            righty = righty + 4 + (abs(bally - righty)/50);
            break;
        }
      } else if (bally < righty && righty > d && paused == false) {
        switch(game_difficulty) {
          case 0:
            righty = righty - 3;
            break;
          case 1:
            righty = righty - 4;
            break;
          case 2:
            righty = righty - 4 - (abs(bally - righty)/50);
            break;
        }
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
  
  if (dist(ballx, bally, leftx, lefty) <= (balld + leftd)/2) {
    ballstroke = NBlue;
    bounce.rewind(); 
    bounce.play();
    
    if (game_mode == singleplayer) {
      ballvx = (ballx - leftx)/speed[game_difficulty];
      ballvy = (bally - lefty)/speed[game_difficulty];
    } else {
      ballvx = (ballx - leftx)/speed[hard];
      ballvy = (bally - lefty)/speed[hard];
    }
  }
  
  if (dist(ballx, bally, rightx, righty) <= (balld + rightd)/2) {
    ballstroke = NRed;
    bounce.rewind(); 
    bounce.play();
    
    if (game_mode == singleplayer) {
      ballvx = (ballx - rightx)/speed[game_difficulty];
      ballvy = (bally - righty)/speed[game_difficulty];
    } else {
      ballvx = (ballx - rightx)/speed[hard];
      ballvy = (bally - righty)/speed[hard];
    }
  }
  
  if (paused == false) {
  ballx = ballx + ballvx;
  bally = bally + ballvy;
  }
  
  if (bally < d/2) {
    bally = d/2;
    ballvy = -ballvy;
    bounce.rewind();
    bounce.play();
  } else if (bally > height - d/2) {
    bally = height - d/2;
    ballvy = -ballvy;
    bounce.rewind();
    bounce.play();
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
    
    score.rewind();
    score.play();
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
    
    score.rewind();
    score.play();
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
    
    readyeffect.rewind();
    readyeffect.play();
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
    
    endeffect.rewind();
    endeffect.play();
    
    if (score1 > score2) {
      if (game_mode == singleplayer) {
        wonblueS++;
      } else {
        wonblueM++;
      }
    } else {
      if (game_mode == singleplayer) {
        wonredS++;
      } else {
        wonredM++;
      }
    }
  }
}

void counterincrease() {
  if (score1 == 3|| score2 == 3) {
    counter++;
  }
}

//==== Exit Button ====
void exitbutton(float x, float y) {
  if (paused == true && game_state == playing && countdown == false) {
    pushMatrix();
    translate(x, y);
    
    stroke(White);
    strokeWeight(20);
        
    if (mouseX > x - 15 && mouseX < x + 15 && mouseY > y - 15 && mouseY < y + 15) {
      stroke(Black);
      if (mousePressed == true) {
        stroke(DDGrey);
      }
    }
    
    line(-15, -15, 15, 15);
    line(-15, 15, 15, -15);
    
    popMatrix();
  }
}

void exitfunc(float x, float y) {
  if (mouseX > x - 15 && mouseX < x + 15 && mouseY > y - 15 && mouseY < y + 15 && game_state == playing && paused == true && mode == game && countdown == false) {
    mode = start;
  }
}
