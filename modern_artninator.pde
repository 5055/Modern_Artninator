int amountx= 10;
int amounty= 10;
int colorchange = 11;
int rectSize = 10;
boolean randomstapgroote = false;
boolean xscalestapgroote =false;


PVector[][] V = new PVector[amountx][amounty];
PVector[][] A = new PVector[amountx][amounty];
color c = color(255, 255, 255);
boolean toggleVectors, timestop;


void setup() {
  size(801, 801);
  background(c);
  toggleVectors = false;
  timestop = false;
  for (int i =0; i<amountx; i++) {
    for (int j =0; j<amounty; j++) {
      int r =0;
      int g = 0;
      V[i][j] =new PVector(floor(((width-1)/4+i*(width-1)/amountx/2)/rectSize)*rectSize, floor(((height-1)/4+j*(height-1)/amounty/2)/rectSize)*rectSize);
      if (randomstapgroote) {
        r =int(random(0, 4));
      }
      if (xscalestapgroote) {
        g = i;
      }
      A[i][j] =new PVector(((r+g)%4)*rectSize+rectSize, 0);
}
}
}
void draw() {
  rectMode(CENTER);
if(!timestop){
  for (int i =0; i<amountx; i++) {
    for (int j =0; j<amounty; j++) {
      c = get((int)V[i][j].x, (int) V[i][j].y);
      if (-c%2 ==0) {
        fill(c+colorchange); 
        rect(V[i][j].x, V[i][j].y, rectSize, rectSize);
        A[i][j] =new PVector(-A[i][j].y,A[i][j].x);
        V[i][j].add(A[i][j].x, A[i][j].y);
        color q =get((int)V[i][j].x, (int) V[i][j].y);
        if (toggleVectors) {
          fill(255, 255, 255);
          rect(V[i][j].x, V[i][j].y, rectSize, rectSize);
          fill(q);
          rect(V[i][j].x, V[i][j].y, rectSize*0.6, rectSize*0.6);
        }
      } else if (-c%2 ==1) {
        fill(c+colorchange); 
        rect(V[i][j].x, V[i][j].y, rectSize, rectSize);
        A[i][j] =new PVector(A[i][j].y,-A[i][j].x);
        V[i][j].add(A[i][j].x, A[i][j].y);
        color q =get((int)V[i][j].x, (int) V[i][j].y);
        if (toggleVectors) {
          fill(255, 255, 255);
          rect(V[i][j].x, V[i][j].y, rectSize, rectSize);
          fill(q);
          rect(V[i][j].x, V[i][j].y, rectSize*0.6, rectSize*0.6);
        }
      }
    }
  }
}
}
void mouseClicked() {
    if(mouseButton == LEFT) {
      if (!timestop) {
    timestop = true;
  } else {
    timestop = false;
  }
  }
   else if(mouseButton == RIGHT) {
  if (!toggleVectors) {
    toggleVectors = true;
  } else {
    toggleVectors = false;
  }
}
}
