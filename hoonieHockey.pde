import processing.serial.*;
import processing.sound.*;

SoundFile hockeyPuck;
SoundFile applause;

String serial;
Serial port;

float joyY = 0;
float heiY = 0;

int click = 1;

int L_score = 0;
int R_score = 0;

boolean joystickEnabled = true;

Player Player1;
Player Player2;
Ball Initball;

void setup() {
  size(800, 600);
  frameRate(60);

  hockeyPuck=new SoundFile(this, "hockeyPuck.wav");
  applause=new SoundFile(this, "applause.wav");

  port = new Serial(this, Serial.list()[3], 9600);
  port.clear();
  serial = port.readStringUntil(10);
  serial = null;
  restart(true);
}

void input() {
  if (joystickEnabled) {
    while (port.available() > 0 ) {
      serial = port.readStringUntil(10);
    }
    if (serial!=null) {
      String[] a = split(serial, ',');    
      String y1 = a[0];
      String y2 = a[3];
      String c = a[2];
      float xpos = new Float(y1);
      float dist = new Float(y2);
      float cl = new Float(c);
      joyY = map(xpos, 0, 1023, 600, 0);
      if (200<=dist&&dist<=1000) heiY = map(dist, 200, 1000, 0, 600);
      else if (dist<200) dist=200;
      else dist=1000;
      click=(int)cl;
    } else {
      joyY=300;
      heiY=300;
    }
  } else {
    joyY = mouseY-25;
    heiY = mouseX-25;
  }
  if (click==0) {
    restart(true);
  }
}

void draw() {
  fill(130);
  rect(0, 0, width, height);
  fill(0, 255);
  fill(135, 206, 250);
  strokeWeight(3);
  stroke(100);
  rect(25, 25, 750, 550);
  line(400, 25, 400, 575);
  fill(135, 206, 250);
  ellipse(400, 300, 100, 100);
  input();
  Initball.bUpdate();
  Initball.bDraw();
  Player1.pUpdate();
  Player1.pDraw();
  Player2.pUpdate();
  Player2.pDraw();
  fill(100);
  textSize(25);
  text("Player 1", 270, 100);
  text("score: "+L_score, 270, 130);
  text("Player 2", 440, 100);
  text("score: "+R_score, 440, 130);
}

void restart(boolean score_restart) {  
  Player1 = new Player(300, 0, "Joystick");
  Player2 = new Player(300, 1, "Height");
  if (score_restart) {  
    L_score=0;
    R_score=0;
  }
  Initball=new Ball();
}