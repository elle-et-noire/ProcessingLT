//simple yoke-game sample by MASA

int BulletNumber = 50;
float[] bulletX, bulletY;//bullet position (x, y)
float[] bulletVy;//bullet velocity (0, y)
float bulletR = 5;//bullet radius

float playerX = 320;
float playerY = 400;
float playerR = 10;//player radius

boolean gameover;

void setup(){
  size(640, 480);//set window size
  
  //initialize arrays
  bulletX = new float[BulletNumber];
  bulletY = new float[BulletNumber];
  bulletVy = new float[BulletNumber];
  
  for(int i = 0; i < BulletNumber; i++){//initialize bullet
    resetBullet(i);
  }
  gameover = false;
  println("GameStart!");
}

void resetBullet(int i) {
  bulletX[i] = random(0, 640);
  bulletY[i] = 0;
  bulletVy[i] = random(0.8, 4.0);
}

void draw(){
  if(!gameover){ //update characters' state
    for(int i = 0; i < BulletNumber; i++)
    {
      bulletY[i] += bulletVy[i];//update bullet position by velocity
      
      if(bulletY[i] > 480) {
        //reset bullet
        resetBullet(i);
      }
      
      if(pow(playerX - bulletX[i], 2) + pow(playerY - bulletY[i], 2) < pow(playerR + bulletR, 2)){
        //calc distance of bullet and player
        gameover = true;
        println("GameOver");
      }
    }
    
    playerX = mouseX;//update player position
    
  }//!gameover
  
  if(gameover){
    background(255, 0, 0);
  }else{
    background(128);//fill background by gray color
  }
  
  fill(64, 64, 255);
  for(int i = 0; i < BulletNumber; i++){//draw bullets
    ellipse(bulletX[i], bulletY[i], bulletR * 2, bulletR * 2);
  }
  
  fill(255, 255, 255);
  ellipse(playerX, playerY, playerR * 2, playerR * 2);//draw player 
}

void mousePressed(){
  setup();
}
