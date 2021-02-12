import processing.sound.*;

int top, bot, left, right, move, player1Y, player2Y, diam, scorep1, scorep2, stype, ptype, randomWall, randomPlayer, randomGoal, maincol1, maincol2, maincol3, seccol1, seccol2, seccol3, thircol1, thircol2, thircol3;
float cx, cy, incx, incy;
boolean w, s, u, d, start, goalp1, goalp2, ctrl, random;
String sound, palette;
PFont mono;
SoundFile wallBounce, playerBounce, goalSound;

void setup() {
  size(1000, 750);

  //Font initializer
  mono = createFont("VCR_OSD_MONO_1.001.ttf", 32);
  textFont(mono);

  //Sound initializer
  sound = "Classic Pong";
  stype = 0;
  wallBounce = new SoundFile(this, "wallBounce0.mp3");
  playerBounce = new SoundFile(this, "playerBounce0.mp3");
  goalSound = new SoundFile(this, "goalSound0.mp3");

  //Ball and players initializer
  top = 150;
  bot = 700;
  left = 5;
  right = 995;
  if (round(random(1)) == 1) incx = 2; 
  else incx = -2;
  if (round(random(1)) == 1) incy = random(1, 4); 
  else incy = random(-1, -4);
  move = 3;
  diam = 6;

  //Score initializer
  scorep1 = 0;
  scorep2 = 0;

  //Key flags initializer
  w = false;
  s = false;
  u = false;
  d = false;
  start = false;
  ctrl = false;

  //Palette initializer
  ptype = 0;
  maincol1 = 255;
  maincol2 = 255;
  maincol3 = 255;
  seccol1 = 0;
  seccol2 = 0;
  seccol3 = 0;
  thircol1 = 56;
  thircol2 = 56;
  thircol3 = 56;
  palette = "Classic";
  
  //Start state setter
  reset();
}

void draw() {
  setField();
  if (start) {
    modifyMovement();
    checkBallPos();
  } else if (scorep1 == 7 | scorep2 == 7) {
    if (scorep1 == 7) text("Player 1 wins!", 5, 145);
    else text("Player 2 wins!", 830, 145);
    noLoop();
  } else {
    text("Press ENTER to start playing", 5, 145);
    text("First to 7 wins!", 810, 145);
    textSize(13);
    text("Player 1: W to go up, S to go down.\nPlayer 2: UP to go up, DOWN to go down.", 5, 715);
    text("Sound type (TAB to change)\n" + sound, 775, 715);
    text("Palette colour (SHIFT to change)\n" + palette, 395, 715);
  }
  drawProps();
}

/*
 * Pressed keys controller. Checks which keys were pressed
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) u = true;
    else if (keyCode == DOWN) d = true;
  } else {
    if (key == ENTER) start = true;
    if (key == 'w') w = true;
    else if (key == 's') s = true;
  }
}

/*
 * Released keys controller. Checks which keys were released
 */
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) u = false;
    else if (keyCode == DOWN) d = false;
    else if (keyCode == SHIFT && !start) changePalette();
  } else {
    if (key == TAB && !start) changeSound();
    else if (key == 'w') w = false;
    else if (key == 's') s = false;
  }
}

/*
 * Game field drawer. Draws all game lines, text and scoreboard
 */
void setField() {
  stroke(maincol1, maincol2, maincol3);
  background(seccol1, seccol2, seccol3);
  noFill();
  line(500, 150, 500, 700);
  rect(5, 150, 990, 550);
  fill(thircol1, thircol2, thircol3);
  textSize(200);
  text(scorep1, 250, 488);
  text("-", 443, 503);
  text(scorep2, 640, 488);
  textSize(20);
  text("Player 1", 265, 505);
  text("Player 2", 652, 505);
  fill(maincol1, maincol2, maincol3);
  textSize(120);
  text("PONG!", 340, 100);
  textSize(20);
}

/*
 * Resets game to the start state
 */
void reset() {
  setField();
  player1Y = 400;
  player2Y = 400;
  cx = 500;
  cy = 425;
  if (round(random(1)) == 1) incx = 2; 
  else incx = -2;
  if (round(random(1)) == 1) incy = random(1, 4); 
  else incy = random(-1, -4);
  drawProps();
  start = false;
}

/*
 * Updates player and ball position to move them
 */
void modifyMovement() {
  if (u && player2Y - move >= top) player2Y -= move;
  if (d && player2Y + 50 + move <= bot) player2Y += move;
  if (w && player1Y - move >= top) player1Y -= move;
  if (s && player1Y + 50 + move <= bot) player1Y += move;

  cx += incx;
  cy += incy;
}

/*
 * Checks if the ball collides with a wall or a player, and updates its
 * increments if needed
 */
void checkBallPos() {
  if (cy-diam/2 <= top || cy+diam/2 >= bot) {
    incy = -incy; 
    if (random) wallBounce = new SoundFile(this, "wallBounce" + round(random(-0.5, 7.5)) +".mp3");
    wallBounce.play();
  }

  if ((cx-diam/2 <= 50 && cx-diam/2 >= 45) && (cy >= player1Y && cy <= player1Y + 50)) {
    if (random) playerBounce = new SoundFile(this, "playerBounce" + round(random(-0.5, 7.5)) +".mp3");
    playerBounce.play();
    incx = -incx;
    incx += 0.2;
    if (incy < 0) {
      incy -= 0.2;
    } else {
      incy += 0.2;
    }
  }
  if ((cx+diam/2 <= 955 && cx+diam/2 >= 950) && (cy >= player2Y && cy <= player2Y + 50)) {
    if (random) playerBounce = new SoundFile(this, "playerBounce" + round(random(-0.5, 7.5)) +".mp3");
    playerBounce.play();
    incx = -incx;
    incx -= 0.2;
    if (incy < 0) {
      incy -= 0.2;
    } else {
      incy += 0.2;
    }
  }

  if (cx-diam/2 <= left) { 
    incx = -incx; 
    goal(false);
  }
  if (cx+diam/2 >= right) {
    incx = -incx; 
    goal(true);
  }
}

/*
 * Adds points to the scoreboard and resets de field
 */
void goal(boolean player1) {
  if (random) goalSound = new SoundFile(this, "goalSound" + round(random(-0.5, 7.5)) +".mp3");
  goalSound.play();
  if (player1) scorep1++;
  else scorep2++;
  reset();
}

/*
 * Draws both players and the ball
 */
void drawProps() {
  rect(45, player1Y, 5, 50);
  rect(950, player2Y, 5, 50);
  circle(round(cx), round(cy), diam);
}

/*
 * Sound selector controller. Manages which sound is selected before
 * starting a game
 */
void changeSound() {
  stype++;
  if (stype > 8) stype = 0;
  switch (stype) {
  case 0:
    sound = "Classic Pong";
    random = false;
    wallBounce = new SoundFile(this, "wallBounce0.mp3");
    playerBounce = new SoundFile(this, "playerBounce0.mp3");
    goalSound = new SoundFile(this, "goalSound0.mp3");
    break;
  case 1:
    sound = "8-bit Game";
    random = false;
    wallBounce = new SoundFile(this, "wallBounce1.mp3");
    playerBounce = new SoundFile(this, "playerBounce1.mp3");
    goalSound = new SoundFile(this, "goalSound1.mp3");
    break;
  case 2:
    sound = "Ping Pong";
    random = false;
    wallBounce = new SoundFile(this, "wallBounce2.mp3");
    playerBounce = new SoundFile(this, "playerBounce2.mp3");
    goalSound = new SoundFile(this, "goalSound2.mp3");
    break;
  case 3:
    sound = "Tennis";
    random = false;
    wallBounce = new SoundFile(this, "wallBounce3.mp3");
    playerBounce = new SoundFile(this, "playerBounce3.mp3");
    goalSound = new SoundFile(this, "goalSound3.mp3");
    break;
  case 4:
    sound = "Percussion";
    random = false;
    wallBounce = new SoundFile(this, "wallBounce4.mp3");
    playerBounce = new SoundFile(this, "playerBounce4.mp3");
    goalSound = new SoundFile(this, "goalSound4.mp3");
    break;
  case 5:
    sound = "Dubstep?";
    random = false;
    wallBounce = new SoundFile(this, "wallBounce5.mp3");
    playerBounce = new SoundFile(this, "playerBounce5.mp3");
    goalSound = new SoundFile(this, "goalSound5.mp3");
    break;
  case 6:
    sound = "Super Mario?!";
    random = false;
    wallBounce = new SoundFile(this, "wallBounce6.mp3");
    playerBounce = new SoundFile(this, "playerBounce6.mp3");
    goalSound = new SoundFile(this, "goalSound6.mp3");
    break;
  case 7:
    sound = "CATS??!!";
    random = false;
    wallBounce = new SoundFile(this, "wallBounce7.mp3");
    playerBounce = new SoundFile(this, "playerBounce7.mp3");
    goalSound = new SoundFile(this, "goalSound7.mp3");
    break;
  case 8:
    sound = "All random";
    random = true;
  }
}

/*
 * Palette selector controller. Manages which color palette is used to 
 * paint the field before starting a game
 */
void changePalette() {
  ptype++;
  if (ptype > 8) ptype = 0;
  switch (ptype) {
  case 0:
    palette = "Classic";

    maincol1 = 255;
    maincol2 = 255;
    maincol3 = 255;
    seccol1 = 0;
    seccol2 = 0;
    seccol3 = 0;
    thircol1 = 56;
    thircol2 = 56;
    thircol3 = 56;

    break;
  case 1:
    palette = "Negative";

    maincol1 = 0;
    maincol2 = 0;
    maincol3 = 0;
    seccol1 = 255;
    seccol2 = 255;
    seccol3 = 255;
    thircol1 = 199;
    thircol2 = 199;
    thircol3 = 199;

    break;
  case 2:
    palette = "Cold";

    maincol1 = 247;
    maincol2 = 247;
    maincol3 = 165;
    seccol1 = 6;
    seccol2 = 22;
    seccol3 = 73;
    thircol1 = 148;
    thircol2 = 190;
    thircol3 = 246;

    break;
  case 3:
    palette = "Warm";

    maincol1 = 247;
    maincol2 = 247;
    maincol3 = 165;
    seccol1 = 155;
    seccol2 = 30;
    seccol3 = 30;
    thircol1 = 232;
    thircol2 = 130;
    thircol3 = 52;

    break;
  case 4:
    palette = "Pastel";

    maincol1 = 234;
    maincol2 = 159;
    maincol3 = 246;
    seccol1 = 21;
    seccol2 = 57;
    seccol3 = 174;
    thircol1 = 250;
    thircol2 = 234;
    thircol3 = 154;

    break;
  case 5:
    palette = "Sepia";

    maincol1 = 242;
    maincol2 = 152;
    maincol3 = 101;
    seccol1 = 112;
    seccol2 = 63;
    seccol3 = 19;
    thircol1 = 145;
    thircol2 = 145;
    thircol3 = 145;

    break;
  case 6:
    palette = "Sandstorm";

    maincol1 = 132;
    maincol2 = 26;
    maincol3 = 61;
    seccol1 = 246;
    seccol2 = 226;
    seccol3 = 187;
    thircol1 = 255;
    thircol2 = 255;
    thircol3 = 255;

    break;
  case 7:
    palette = "Tennis Field";

    maincol1 = 255;
    maincol2 = 255;
    maincol3 = 255;
    seccol1 = 9;
    seccol2 = 117;
    seccol3 = 20;
    thircol1 = 236;
    thircol2 = 230;
    thircol3 = 41;

    break;
  case 8:
    palette = "Ping Pong Table";

    maincol1 = 255;
    maincol2 = 255;
    maincol3 = 255;
    seccol1 = 22;
    seccol2 = 79;
    seccol3 = 195;
    thircol1 = 165;
    thircol2 = 11;
    thircol3 = 11;

    break;
  }
}
