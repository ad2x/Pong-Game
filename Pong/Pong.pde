//Pong

//Alexander Double
//1-3b
//April 8 2021

import java.util.Arrays;

//==== Mode Framework ====
//Main
int mode;

final int title = 0;
final int start = 1;
final int game = 2;
final int end = 3;
final int settings = 4;

//Game
int game_mode;

final int singleplayer = 0;
final int multiplayer = 1;

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

color DDBlue = #0e2433;
color DBlue = #1c4966;
color Blue = #296d98;
color LBlue = #3792cb;
color LLBlue = #45b6fe;

color NBlue = #1F51FF;
color NBlue1 = #0F49FF;
color NBlue2 = #033FFF;

//==== Variables ====
//== General ==
//-- Fonts --
PFont titleFont;
PFont menuFont;

//-- Rect Button Checks --
//I'm using an intlist to be able to connect buttons and their respective button checks
IntList rectbuttons;

//-- Start Button Booleans --
boolean multip_button;

//==== Setup ====
void setup() {
  size(800, 800, FX2D);
  
  noCursor();
  
  //-- Create Fonts --
  titleFont = createFont("Modular Amplitude.otf", 200);
  menuFont = createFont("Square.ttf", 55);
  textAlign(CENTER, CENTER);
  
  //-- Initialize rectbuttons --
  rectbuttons = new IntList();
  
  //Stands for "number of rect mode buttons"
  int normb = 4;
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
    case 2:
      game();
      break;
    case 3:
      end();
      break;
    case 4:
      options();
      break;
  }
  
  cursor(mouseX, mouseY);  
}

//==== Universal/General Functions ====

//-- Universal Rect. Button --
void rect_mode_button(float x, float y, float dx, float dy, int curve, String name, int textSize, int buttonN, int m_mode, int g_mode, int colour) {
  pushMatrix();
  translate(x, y);
  
  switch(colour) {
    case 0:
      fill(White);
      stroke(LLGrey);
      break;
    case 1:
      fill(DDGrey);
      stroke(NBlue);
  }
  
  //-- Hover --
  if (mouseX > x - dx/2 && mouseX < x  + dx/2 && mouseY > y - dy/2 && mouseY < y + dy/2) {
    
    switch(colour) {
      case 0:
        stroke(LGrey);
        break;
      case 1:
       stroke(NBlue1);
       break;
    }
    
    //-- Tactility
    if (mousePressed) {
      switch(colour) {
        case 0:
          stroke(Grey);
          break;
        case 1:
          stroke(NBlue2);
          break;
      }
     }
  }  
  
  strokeWeight(10);
  
  rect(-dx/2, -dy/2, dx, dy, curve, curve, curve, curve);
  
  //-- Text --
  
  switch(colour) {
    case 0:
      fill(DDGrey);
      break;
    case 1:
      fill(Grey);
      break;
  }

  textFont(menuFont);
  textSize(textSize);
  
  text(name, 0, 0);
    
  //-- Check --
  if (rectbuttons.get(buttonN) == 1) {
    pmode.append(mode);
    mode = m_mode;
    rectbuttons.set(buttonN, 0);
    
    game_mode = g_mode;
  }
  
  popMatrix();
}
