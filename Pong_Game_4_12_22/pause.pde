void pause () {
  theme.pause ();
  fill (textcolor);
  textSize (60);
  text ("Pause", 400, 400);
}

void pauseClicks () {
  if (mouseX > 695 && mouseX < 770 && mouseY > 30 && mouseY < 80) {
    mode = GAME;
  }
}
