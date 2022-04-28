void options () {
  //banner
  background (backgroundcolor);
  textSize (60);
  fill (textcolor);
  text ("OPTIONS", 400, 100);
  
  //dark mode
  fill (0);
  stroke (255);
  square (200, 200, 150);
  fill (white);
  circle (275, 275, 50);
  fill (black);
  stroke (black);
  circle (290, 275, 40);
  fill (textcolor);
  textSize (20);
  text ("Dark Mode", 275, 375);
  
  //light mode
  fill (255);
  stroke (0);
  square (450, 200, 150);
  fill (black);
  circle (525, 275, 50);
  line (525, 240, 525, 310);
  line (490, 275, 560, 275);
  line (500, 250, 550, 300);
  line (550, 250, 500, 300);
  fill (textcolor);
  text ("Light Mode", 525, 375);
  
  //back button
  tactileRect (50, 50, 75, 25);
  fill (backgroundcolor);
  rect (30, 30, 75, 50);
  stroke (textcolor);
  line (60, 40, 40, 55);
  line (40, 55, 60, 70);
  line (45, 55, 90, 55);
  
  //two types of paddles
  fill (backgroundcolor);
  tactileRect (200, 400, 150, 150);
  if (chosenpaddle == 1) {
    stroke (textcolor);
  }
  square (200, 400, 150);
  tactileRect (450, 400, 150, 150);
   if (chosenpaddle == 2) {
    stroke (textcolor);
  }
  square (450, 400, 150);
  fill (textcolor);
  textSize (15);
  text ("Circular Paddles", 275, 575);
  text ("Rectangular Paddles", 525, 575);
  fill (backgroundcolor);
  stroke (textcolor);
  circle (275, 475, 100);
  line (525, 430, 525, 530);
}

void optionsClicks () {
  //changing from dark mode to light mode
  if (mouseX > 200 && mouseX < 350 && mouseY > 200 && mouseY < 350){
    backgroundcolor = black;
    textcolor = white;
  }
  if (mouseX > 400 && mouseX < 550 && mouseY > 200 && mouseY < 350){
    backgroundcolor = white;
    textcolor = black;
  }
  
  //changing paddle type
  if (mouseX > 200 && mouseX < 350 && mouseY > 400 && mouseY < 550){
    chosenpaddle = 1;
  }
  if (mouseX > 400 && mouseX < 550 && mouseY > 400 && mouseY < 550){
    chosenpaddle = 2;
  }
  
  //mode change
  if (mouseX > 30 && mouseX < 95 && mouseY > 30 && mouseY < 80){
    mode = INTRO;
  }
}
