// Global variables
int size = 9;
int row = 4;
int col = 7;
int[] startDate = {2020, 1, 23};
int[] endDate = {2023, 3, 1};

PImage[] bigImgs = new PImage[size];;
PImage[] smallImgs = new PImage[row * col];
PImage bigImg;
PFont font;

int imgPos = 0;
int pixelPos = 0;
int counter = 0;
int standWalk = 1;
int move = 0;

void setup()
{
  size(1080, 750);
  background(0, 128, 0);
  noStroke();
  
  for(int i = 0; i < size; i++) {
    bigImgs[i] = loadImage((i+1)+".jpg");
  }
  bigImg = bigImgs[int(random(0,size-1))];
  font = createFont("Arial", 30, true);
  textFont(font);
  
  // Divide the image into smaller parts
  divideImg(); 
}

void draw() {
  // Draw the animation
  drawAnimation();
}

void drawAnimation() {
  // Background and date settings
  background(0, 128, 0);
  fill(0);
  textAlign(RIGHT);
  text(startDate[2] + " / " + startDate[1] + " / " + startDate[0], 1040, 40);
  
  // Increment the date
  incrementDate();

  // Draw the characters
  translate(counter-950, 30);
  if(counter <= 1050)
    counter += 1;
  if(counter%10 == 0)
    standWalk += 1;
  drawCharacters();
}

void incrementDate() {
  //Increment the date in the startDate
  if(!(startDate[0]==endDate[0] && startDate[1]==endDate[1] && startDate[2]==endDate[2])) {
    startDate[2] += 1;
    if((startDate[1]==1 || startDate[1]==3 || startDate[1]==5 || startDate[1]==7 || startDate[1]==8 || startDate[1]==10 || startDate[1]==12) && startDate[2]>31) {
      startDate[1] += 1;
      startDate[2] = 1;
    }
    else if((startDate[1]==4 || startDate[1]==6 || startDate[1]==9 || startDate[1]==11) && startDate[2]>30) {
      startDate[1] += 1;
      startDate[2] = 1;
    }
    else if(startDate[1]==2 && startDate[2]>28) {
      startDate[1] += 1;
      startDate[2] = 1;
    }
    if(startDate[1] > 12) {
      startDate[0] += 1;
      startDate[1] = 1;
    }
  }
}

void drawCharacters() {
  //Draw the characters
  if(standWalk%2 == 0) {
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < 7; j++) {
        if(counter == 1051)
          drawHumanStand(j*140, i*175, i*7+j, 1);
        else if(counter > 500)
          drawHumanStand(j*140, i*175, i*7+j, 2);
        else
          drawHumanStand(j*140, i*175, i*7+j, 3);
      }
    }
  }
  else {
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < 7; j++) {
        if(counter == 1051)
          drawHumanWalk(j*140, i*175, i*7+j, 1);
        else if(counter > 500)
          drawHumanWalk(j*140, i*175, i*7+j, 2);
        else
          drawHumanWalk(j*140, i*175, i*7+j, 3);
      }
    }
  }
}

void smileFace() {
  //Draw a smiling face
  ellipse(0, -23, 80, 80);
  fill(0);
  ellipse(-15, -30, 8, 8);
  ellipse(15, -30, 8, 8);
  arc(0, -15, 40, 40, 0, PI);
  fill(237, 175, 40);
}

void sadFace() {
  //Draw a sad face
  pushMatrix();
    ellipse(0, -23, 80, 80);
    fill(0);
    ellipse(-15, -30, 8, 8);
    ellipse(15, -30, 8, 8);
    rotate(PI);
    arc(0, -5, 40, 40, 0, PI);
    fill(237, 175, 40);
  popMatrix();
}

void moveImg(int pos, int mode) {
  //Display the image
  if(mode == 1) {
    if(move > 0)
      move -= 10;
    image(smallImgs[pos], -76, -move/500);
  }
  else if(mode == 2)
    image(smallImgs[pos], -76, -30);
  else if(mode == 3) {
    if(move < 15000)
      move += 1;
    image(smallImgs[pos], -76, -move/500);
  }
}

void drawHumanStand(int x, int y, int pos, int mode) {
  //Draw a standing character
  fill(237, 175, 40);
  pushMatrix();
    translate(20+x, 90+y);
    if(mode == 1)
      smileFace();
    else
      sadFace();
    rect(-5, 15, 10, 50);
    pushMatrix();
      translate(0, 60);
      rotate(45*PI/180);
      rect(-5, 0, 10, 40);
    popMatrix();
    pushMatrix();
      translate(0, 60);
      rotate(-45*PI/180);
      rect(-5, 0, 10, 40);
    popMatrix();
    pushMatrix();
      translate(0, 40);
      rotate(120*PI/180);
      rect(0, 0, 10, 40);
    popMatrix();
    pushMatrix();
      translate(2, 50);
      rotate(-120*PI/180);
      rect(0, 0, 10, 40);
    popMatrix();
    moveImg(pos, mode);
  popMatrix();
}

void drawHumanWalk(int x, int y, int pos, int mode) {
  //Draw a walking character
  fill(237, 175, 40);
  pushMatrix();
    translate(20+x, 90+y);
    if(mode == 1)
      smileFace();
    else
      sadFace();
    rect(-5, 15, 10, 50);
    pushMatrix();
      translate(0, 60);
      rotate(25*PI/180);
      rect(-5, 0, 10, 40);
    popMatrix();
    pushMatrix();
      translate(0, 60);
      rotate(-25*PI/180);
      rect(-5, 0, 10, 40);
    popMatrix();
    pushMatrix();
      translate(0, 40);
      rotate(120*PI/180);
      rect(0, 0, 10, 40);
    popMatrix();
    pushMatrix();
      translate(2, 50);
      rotate(-120*PI/180);
      rect(0, 0, 10, 40);
    popMatrix();
    moveImg(pos, mode);
  popMatrix();
}

void divideImg() {
  //Divide the image into smaller parts
  bigImg.loadPixels();
  for(int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      smallImgs[imgPos] = createImage(152,102,RGB);
      smallImgs[imgPos].loadPixels();
      pixelPos = 0;
      for(int k = i*bigImg.height/row; k < (i+1)*bigImg.height/row; k++) {
        for(int h = j*bigImg.width/col; h < (j+1)*bigImg.width/col; h++) {
          smallImgs[imgPos].pixels[pixelPos] = bigImg.pixels[h+k*bigImg.width];
          pixelPos += 1;
        }
      }
      smallImgs[imgPos].updatePixels();
      imgPos += 1;
    }
  }
  bigImg.updatePixels();
}
