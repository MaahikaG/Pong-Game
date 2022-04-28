//Maahika Gupta
//Mode Framework
//2-4
//April 11, 2022

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// sound variables
Minim minim;
AudioPlayer theme, coin, bump, gameover;

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int OPTIONS = 5;

// color pallette
color darkblue = #283d3b;
color blue = #197278;
color cream = #edddd4;
color red = #c44536;
color darkred = #772e25;
color black = #000000;
color white = #FFFFFF;
color backgroundcolor;
color textcolor;

//paddle variables
int chosenpaddle;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld, ballvx, ballvy; //ball
boolean AI;

//keyboard variables
boolean wkey, skey, upkey, downkey;

//scoring variables
int leftscore, rightscore, timer;

PFont font;

void setup () {
  size (800, 800);
  mode = INTRO;
  textAlign (CENTER, CENTER);
  font = createFont("The Led Display St.ttf", 40);
  
  //initialize background and text color
  backgroundcolor = black;
  textcolor = white;
  
  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  rightd = 200;
  rightx = width;
  righty = height/2;
  chosenpaddle = 1;
  
  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
  ballvx = random (-5, 5);
  ballvy = random (-5, 5);
  
  //initialize keyboard 
  wkey = skey = upkey = downkey = false;
  
  //initialize score
  rightscore = leftscore = 0;
  timer = 100;
  
  //initialize minim
  minim = new Minim(this);
  theme = minim.loadFile("mario bros theme copy.mp3");
  coin = minim.loadFile("coin copy.wav");
  bump = minim.loadFile("bump copy.wav");
  gameover = minim.loadFile("gameover copy.wav");
}

void draw () {
  if (mode == INTRO) {
    intro ();
  } else if (mode == OPTIONS) {
    options ();
  } else if (mode == GAME) {
    game ();
  } else if (mode == PAUSE) {
    pause ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else {
    println ("Mode error: " + mode);
  }
}

void tactileRect (int x, int y, int w, int l) {
  strokeWeight (5);
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+l) {
    stroke (textcolor);
  } else {
    stroke (backgroundcolor);
  }
}
