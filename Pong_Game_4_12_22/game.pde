void game () {
  background (backgroundcolor);
  
  //centerline
  strokeWeight (5);
  stroke (textcolor);
  line (width/2, 0, width/2, height);
  
  //top line 
  fill (textcolor);
  line (0, 100, 800, 100);;
  
  //draw paddles
  if (chosenpaddle == 1) {
    fill (blue);
    circle (leftx, lefty, leftd);
    fill (red);
    circle (rightx, righty, rightd);
  }
  if (chosenpaddle == 2) {
    strokeWeight (10);
    stroke (blue);
    line (20, lefty, 20, lefty + 150);
    stroke (red);
    line (780, righty, 780, righty + 150);
  }
  
  //move paddles
  if (chosenpaddle == 1) {
    if (lefty > leftd/2 + 100) {
      if (wkey == true) lefty = lefty - 5;
    }
     if (lefty < 800 - (leftd/2 + 50)) {
      if (skey == true) lefty = lefty + 5;
    }
    if (AI == false) {
      if (righty > rightd/2 + 100) {
        if (upkey == true) righty = righty - 5;
      }
      if (righty < 800 - (rightd/2 + 50)) {
        if (downkey == true) righty = righty + 5;
      }
    } else {
      if (ballx > 400) {
        if (bally > righty && righty < 800 - (rightd/2 + 50)) righty = righty + 5;
        if (bally < righty && righty > rightd/2 + 100) righty = righty - 5;
      }
    }
  }
  
  if (chosenpaddle == 2) {
    if (lefty > 100) {
      if (wkey == true) lefty = lefty - 5;
    }
     if (lefty < 600) {
      if (skey == true) lefty = lefty + 5;
    }
    if (AI == false) {
      if (righty > 100) {
        if (upkey == true) righty = righty - 5;
      }
      if (righty < 600) {
        if (downkey == true) righty = righty + 5;
      }
    } else {
      if (ballx > 400) {
        if (bally > righty && righty < 600) righty = righty + 5;
        if (bally < righty && righty > 100) righty = righty - 5;
      }
    }
  }
  
  //draw ball
  fill (cream);
  strokeWeight (5);
  stroke (textcolor);
  circle (ballx, bally, balld);
  
  //move ball
  if (timer < 0) {
    ballx = ballx + ballvx;
    bally = bally + ballvy;
  }
  
  //bouncing ball
  if (bally <  (100 + balld/2) || bally > height - balld/2) {
    ballvy = ballvy * -1;
  } 
  
  //bouncing ball off paddles
  if (chosenpaddle == 1) {
    if (dist (ballx, bally, leftx, lefty) <= (balld/2) + (leftd/2) && bally >  (100 + balld/2) && bally < height - balld/2) {
      ballvx = (ballx - leftx) / 15;
      ballvy = (bally - lefty) / 15;
      bump.rewind ();
      bump.play ();
    }
    if (dist (ballx, bally, rightx, righty) <= (balld/2) + (rightd/2)&& bally > (100 + balld/2) && bally < height - balld/2) {
      ballvx = (ballx - rightx) / 15;
      ballvy = (bally - righty) / 15;
      bump.rewind ();
      bump.play ();
    }
  } 
  
  if (chosenpaddle == 2) {
    if ((dist (ballx, bally, 20, lefty) <= (balld/2) + 25 || dist (ballx, bally, 20, lefty + 150) <= (balld/2) + 30) && bally > (100 + balld/2) && bally < height - balld/2) {
      ballvx = (ballx - 20) / 15;
      ballvy = (bally - lefty) / 15;
      bump.rewind ();
      bump.play ();
    }
    if ((dist (ballx, bally, 780, righty) <= (balld/2) + 25|| dist (ballx, bally, 780, righty + 150) <= (balld/2) + 30) && bally > (100 + balld/2) && bally < height - balld/2) {
      ballvx = (ballx - 780) / 15;
      ballvy = (bally - righty) / 15;
      bump.rewind ();
      bump.play ();
    }
  }
  
  //scoring
  if (ballx < (0 - (balld/2))) {
    rightscore++;
    coin.rewind ();
    coin.play ();
    ballx = width / 2;
    bally = height / 2;
    ballvx = random (-5, 5);
    ballvy = random (-5, 5);
    timer = 100;
  }
  
  if (ballx > (800 + (balld/2))) {
    leftscore++;
    coin.rewind ();
    coin.play ();
    ballx = width / 2;
    bally = height / 2;
    ballvx = random (-5, 5);
    ballvy = random (-5, 5);
    timer = 100;
  }
  
  //scoreboard
  textSize (50);
  fill (textcolor);
  text (leftscore, width / 4, 50);
  text (rightscore, 3 * width / 4, 50);
  timer = timer - 1;
  
  //changing to gameover
  if (leftscore == 3 || rightscore == 3) {
    mode = GAMEOVER;
  }
  
  //back button
  tactileRect (30, 30, 75, 50);
  fill (backgroundcolor);
  rect (30, 30, 75, 50);
  stroke (textcolor);
  line (60, 40, 40, 55);
  line (40, 55, 60, 70);
  line (45, 55, 90, 55);  
  
  //pause button
  tactileRect (695, 30, 75, 50);
  fill (backgroundcolor);
  rect (695, 30, 75, 50);
  stroke (textcolor);
  if (mode == GAME) {
    line (725, 40, 725, 70);
    line (740, 40, 740, 70);
  }
}

void gameClicks () {
  //back to Intro 
  if (mouseX > 30 && mouseX < 105 && mouseY > 30 && mouseY < 80) {
    mode = INTRO;
    leftscore = 0;
    rightscore = 0;
    ballvx = random (-5, 5);
    ballvy = random (-5, 5);
    lefty = height/2;
    righty = height/2;
    timer = 100;
    ballx = width / 2;
    bally = height / 2;
  }
  
  //Pause 
  if (mouseX > 695 && mouseX < 770 && mouseY > 30 && mouseY < 80) {
    mode = PAUSE;
    rect (695, 30, 75, 50);
    triangle (715, 40, 715, 70, 750, 55);
  }
}
