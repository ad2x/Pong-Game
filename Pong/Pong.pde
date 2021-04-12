//Pong

//Alexander Double
//1-3b
//April 8 2021

import java.util.Arrays;

//==== Mode Framework ====
int mode;

final int title = 0;
final int start = 1;

//For the esc func, so I can just go back to the previous mode instead of making a big if else/switch function
IntList pmode;

//==== Colour Palette ====
color Black = #000000;
color DDGrey = #393939;
color DGrey = #5A5A5A;
color Grey = #818181;
color LGrey = #A7A7A7;
color LLGrey = #C6C6C6;
color White = #FFFFFF;

//==== Variables ====
//== General ==
//-- Fonts --
PFont titleFont;
PFont menuFont;

//-- Rect Button Checks --
//I'm using an intlist to be able to connect buttons and their respective button checks
IntList rectbuttons;

//-- Exp --
int cexp;
int clevel;


//==== Setup ====
void setup() {
  size(800, 800, FX2D);
  
  //-- Create Fonts --
  titleFont = createFont("Modular Amplitude.otf", 200);
  menuFont = createFont("Square.ttf", 55);
  textAlign(CENTER, CENTER);
  
  //-- Initialize rectbuttons --
  rectbuttons = new IntList();
  
  //Stands for "number of rect mode buttons"
  int normb = 1;
  for (int i = 0; i < normb; i = i + 1) {
    rectbuttons.append(0);
  }
  
  //-- Initialize pmode --
  pmode = new IntList();
}

//==== Draw ====
void draw() {
  
  //-- Mode Framework --
  switch(mode) {
    case 0:
      title();
      break;
    case 1:
      start();
      break;
  }
  
  //-- Testing -- 
  
}

//==== Universal/General Functions ====

//-- Level UI --
void levelui(float x, float y, int xp, int level) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 200, 100);
  
  popMatrix();
}

//-- Universal Rect. Button --
void rect_mode_button(float x, float y, float dx, float dy, int curve, String name, int buttonN, int bmode) {
  pushMatrix();
  translate(x, y);
  
  fill(White);
  stroke(LLGrey);
  
  //-- Hover --
  if (mouseX > x - dx/2 && mouseX < x  + dx/2 && mouseY > y - dy/2 && mouseY < y + dy/2) {
    stroke(LGrey);
    
    //-- Tactility
    if (mousePressed) {
      stroke(Grey);
    }
  }  
  
  strokeWeight(10);
  
  rect(-dx/2, -dy/2, dx, dy, curve, curve, curve, curve);
  
  //-- Text --
  
  fill(DDGrey);
  textSize(55);
  textFont(menuFont);
  
  text(name, 0, 0);
    
  //-- Check --
  if (rectbuttons.get(buttonN) == 1) {
    pmode.append(mode);
    mode = bmode;
    rectbuttons.set(buttonN, 0);
  }
  
  popMatrix();
}
