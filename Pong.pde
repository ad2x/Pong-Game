//Pong

//Alexander Double
//1-3b
//April 8 2021

import java.util.Arrays;

//==== Mode Framework ====
int mode;

final int title = 0;
final int start_sp = 1;
final int start_mp = 2;

//==== Colour Palette ====
color Black = #000000;
color DDGrey = #393939;
color DGrey = #5A5A5A;
color Grey = #818181;
color LGrey = #A7A7A7;
color LLGrey = #C6C6C6;
color White = #FFFFFF;


//==== Variables ====
//-- Fonts --
PFont titleFont;
PFont menuFont;

//-- Exp --
int cexp;
int clevel;

//==== Setup ====
void setup() {
  size(800, 800, FX2D);
  
  //-- Create Fonts --
  titleFont = createFont("Modular Amplitude.otf", width/4);
  menuFont = createFont("Square.ttf", width/23);
  textAlign(CENTER, CENTER);
}

//==== Draw ====
void draw() {
  
  //-- Mode Framework --
  switch(mode) {
    case 0:
      title_screen();
      break;
    case 1:
      start_menu_SP();
      break;
    case 2:
      start_menu_MP();
      break;
  }
}

//==== Universal/General Functions ====

//-- Level UI --
void levelui(float x, float y, int xp, int level) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight((width + height)/250);
  
  rect(0, 0, width/3, height/7);
  
  popMatrix();
}
