void gameover () {
  theme.pause ();
  gameover.play ();
  backgroundcolor = black;
  textcolor = white;
  
  //background and design
  textSize (60);
  fill (textcolor);
  if (leftscore > rightscore) {
    background (darkblue);
    strokeWeight (3);
    stroke (blue);
    for (int i = 0; i <= 800; i = i + 10) {
      line (i, 0, 800, 800 - i);
    }
    for (int i = 0; i <= 800; i = i + 10) {
      line (800 - i, 0, 0, 800 - i);
    }
    text ("left player wins!", 400, 200);
  } else {
    background (darkred);
    strokeWeight (3);
    stroke (red);
    for (int i = 0; i <= 800; i = i + 10) {
      line (i, 0, 800, 800 - i);
    }
    for (int i = 0; i <= 800; i = i + 10) {
      line (800 - i, 0, 0, 800 - i);
    }
    text ("right player wins!", 400, 200);
  }
  
  //restart and exit buttons
  fill (96, 98, 96); 
  tactileRect (150, 350, 200, 100);
  rect (150, 350, 200, 100);
  tactileRect (450, 350, 200, 100);
  rect (450, 350, 200, 100);
  textSize (20);
  fill (textcolor);
  text ("Restart", 250, 400);
  text ("Exit", 550, 400);
}

void gameoverClicks () {
  //mode change
  if (mouseX > 150 && mouseX < 350 && mouseY > 350 && mouseY < 450) {
    mode = INTRO;
    leftscore = 0;
    rightscore = 0;
    chosenpaddle = 1;
    ballvx = random (-5, 5);
    ballvy = random (-5, 5);
    lefty = height/2;
    righty = height/2;
    theme.rewind ();
    gameover.rewind ();
    timer = 100;
    ballx = width / 2;
    bally = height / 2;
  }
  if (mouseX > 450 && mouseX < 650 && mouseY > 350 && mouseY < 450) {
    exit ();
  }
}
