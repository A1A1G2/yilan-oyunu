  int[][]kare=new int[32][18];
  int dir=UP;
  int[] head={10,8};
  int[] food={8,8};
  int mass=1;
  int dead=0;
void setup(){
  fullScreen();
  //her kareyi 0 yap
    for(int i=0;i<32;i++){
    for(int j=0;j<18;j++){
      kare[i][j]=0;
    }
  }
}

void draw(){
  if (dead==1){background(random(255),random(255),random(255));delay(50);}
  else{
  delay(200);
  foodControl();
  cleaner();
  headMove();
  kare[head[0]][head[1]]=mass;
  make();
  }
}
void keyPressed(){
  if(keyCode==UP){if(dir!=DOWN){dir=UP;}}
  else if(keyCode==DOWN){if(dir!=UP){dir=DOWN;}}
  else if(keyCode==RIGHT){if(dir!=LEFT){dir=RIGHT;}}
  else if(keyCode==LEFT){if(dir!=RIGHT){dir=LEFT;}}
}
void headMove(){
  if(dir==UP && head[1]>0){head[1]--;}
  else if(dir==DOWN && head[1]<17){head[1]++;}
  else if(dir==LEFT && head[0]>0){head[0]--;}
  else if(dir==RIGHT && head[0]<31){head[0]++;} 
  if(kare[head[0]][head[1]]>0){dead=1;}
}
void cleaner(){
  for(int i=0;i<32;i++){
    for(int j=0;j<18;j++){
      if(kare[i][j]!=0 && kare[i][j]!=-1){
        kare[i][j]--;
      }
    }
  }
}
void foodControl(){
  if (head[0]==food[0] &&head[1]==food[1]){
  mass++;
  food[0]=(int)random(32);
  food[1]=(int)random(18);
  
  }
  kare[food[0]][food[1]]=-1;
}
void make(){
  for(int i=0;i<32;i++){
    for(int j=0;j<18;j++){
      if(kare[i][j]==0){
        fill(0);
      }
      else if(kare[i][j]==-1){
        fill(0,255,0);
      }
      else {fill(255);}
      rect(i*60,j*60,60,60);
    }
  }
}
