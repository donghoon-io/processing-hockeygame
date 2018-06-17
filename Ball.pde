class Ball {
  float x = 400;
  float y = 300;
  boolean ran1 = random(-0.5, 0.5)<=0, ran2 = random(-0.5, 0.5)<=0;
  float speed_x=random(3, 6);
  float speed_y=random(2, 4);

  Ball() {
    if (ran1) {
      speed_x*=-1;
    }
    if (ran2) {
      speed_y*=-1;
    }
  }

  void bUpdate() {
    if (Player1.x-23<=this.x&&this.x<=Player1.x+23&&Player1.y-70<=this.y&&this.y<=Player1.y+70) {
      this.speed_x*=-1.15;
      hockeyPuck.play();
    }
    if (Player2.x-23<=this.x&&this.x<=Player2.x+23&&Player2.y-70<=this.y&&this.y<=Player2.y+70) {
      this.speed_x*=-1.15;
      hockeyPuck.play();
    }
    if ((580<this.y&&this.y<590)||(10<this.y&&this.y<20)) {
      this.speed_y*=-1;
    }
    if (this.x<-15 ) {
      R_score++;
      applause.play();
      restart(false);
    } else if (this.x>815 ) {
      L_score++;
      applause.play();
      restart(false);
    }
    this.x+=this.speed_x;
    this.y+=this.speed_y;
  }
  void bDraw() {
    strokeWeight(0);
    fill(#ECFFE5);
    stroke(color(255, 255, 255));
    ellipse(x, y, 20, 20);
  }
}