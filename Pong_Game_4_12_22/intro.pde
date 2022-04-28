void intro () {
 theme.play ();
 background (backgroundcolor);
 fill (textcolor);
 textFont (font, 128);
 textSize (60);
 text ("PONG GAME", 400, 250);
 
 //One Player, Two Player, and Options buttons
 fill (96, 98, 96);
 tactileRect (175, 325, 200, 100);
 rect (175, 325, 200, 100);
 tactileRect (425, 325, 200, 100);
 rect (425, 325, 200, 100);
 tactileRect (300, 455, 200, 100);
 rect (300, 455, 200, 100);
 textSize (20);
 fill (textcolor);
 text ("TWO PLAYER", 275, 375);
 text ("ONE PLAYER", 525, 375);
 text ("OPTIONS", 400, 500);
 
 //line design
 strokeWeight (3);
 stroke (red);
 for (int i = 0; i <= 800; i = i + 10) {
   line (800 - i, 0, 0, i);
 }
 stroke (blue);
 for (int i = 0; i <= 800; i = i + 10) {
   line (800, i, 800-i, 800);
 }
 stroke (darkred);
 for (int i = 0; i <= 800; i = i + 10) {
   line (0, i, i, 800);
 }
 stroke (darkblue);
 for (int i = 0; i <= 800; i = i + 10) {
   line (i, 0, 800, i);
 }
}

void introClicks () {
  //mode change
  if (mouseX > 175 && mouseX < 375 && mouseY > 325 && mouseY < 425){
    mode = GAME;
    AI = false;
  }
  if (mouseX > 300 && mouseX < 500 && mouseY > 455 && mouseY < 555){
    mode = OPTIONS;
  }
  if (mouseX > 425 && mouseX < 625 && mouseY > 325 && mouseY < 425){
    mode = GAME;
    AI = true;
  }
}
