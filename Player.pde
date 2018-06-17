class Player {
  float x=0;
  float y=300;
  String type;

  Player(float cursorY, int team, String type) {  
    this.y = cursorY;
    if (team==0) {
      this.x=10;
    } else if (team==1) {
      this.x=790;
    }
    this.type=type;
  }

  void pUpdate() {
    if (this.type=="Joystick") {
      this.y=joyY;
    } else if (this.type=="Height") {
      this.y=heiY;
    }
  }

  void pDraw() {
    strokeWeight(0);            // 블럭경계선 두께
    fill(#ECFFE5);              // 볼의 컬러
    stroke(color(255, 0, 0, 0));   // 테두리 색상은 연한 갈색
    rect(x - 10, this.y - 70, 20, 140); // 라켓사각형그리기
  }
}