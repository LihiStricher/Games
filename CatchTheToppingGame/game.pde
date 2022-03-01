Image background = new Image();
Image endScreenWin = new Image();
Image endScreenLose = new Image();
Image restartButton = new Image();
SplashScreen scr = new SplashScreen();
Music music = new Music();
Music catchSound = new Music();
Music missedSound = new Music();
Image pizza = new Image(); 
Image top1 = new Image();
Image life1 = new Image();
Image life2 = new Image();
Image life3 = new Image();
Text score = new Text();
int lifeCounter; 
int catchCounter;
int topCounter; 
boolean restartButtonShow;

void setup() 
{
  size(612, 408);
  background.setImage("background.jpg");
  lifeCounter = 3; 
  catchCounter = 0; 
  topCounter = 0;
  restartButtonShow = false;
  setUpSplashScreen();
  setUpMusic();
  setUpPizza();
  setUpTop();
  setUpLife();
  setUpText();
  draw();
}

void setUpSplashScreen()
{
  scr.Image = "screen.jpg";
  scr.GameName = "catch the topping";
  scr.backgroundColor = color(0, 0, 255);
  scr.GameAuthor1 = "lihi";
}

void setUpMusic()
{
  music.load("game sound.mp3");
  music.loop = true; 
  music.play(); 
  catchSound.load("catch.mp3");
  missedSound.load("missed.mp3");
}

void setUpPizza()
{
  pizza.setImage("pizza.png");
  pizza.width = 240;
  pizza.height = 120;
  pizza.x = 0; 
  pizza.y = 300;
}

void setUpLife()
{
  life1.setImage("life1.png");
  life1.width = 56;
  life1.height = 48;
  life1.x = 0;
  life1.y =0;
  life2.setImage("life2.png");
  life2.width = 56;
  life2.height = 48;
  life2.x = 60;
  life2.y =0;
  life3.setImage("life3.png");
  life3.width = 56;
  life3.height = 48;
  life3.x = 120;
  life3.y =0;
}

void setUpText()
{
  score.x = 500;
  score.y = 50;
  score.brush = color(0, 234, 89);
  score.text = Integer.toString(catchCounter);
  score.textSize = 50;
  score.font = "Arial";
}

void setUpTop()
{
  top1.setImage("top8.png");
  top1.width = 60;
  top1.height = 60;
  top1.x = width/2; 
  top1.y = 0;
  top1.direction = Direction.DOWN; 
  top1.speed = 1;
}

void keyPressed()
{
  if (keyCode == RIGHT)
  {
    pizza.direction = Direction.RIGHT;
    pizza.speed = 4;
  } else if (keyCode == LEFT)
  {
    pizza.direction = Direction.LEFT;
    pizza.speed = 4;
  } else if (keyCode == UP)
  {
    pizza.speed = 0;
  }
}

void draw() 
{
  background.draw();
  scr.Show();
  if (scr.show == false)
  {
    pizza.draw();
    if (pizza.x > width-200)
    {
      pizza.speed = 0;
      pizza.x = width - 200;
    }
    if (pizza.x < -30)
    {
      pizza.speed = 0;
      pizza.x = -30;
    }
    if (top1.y > height)
    {
      top1.speed = 0;
      top1.y = 0;
      top1.x = int(random(0, width-200));
      top1.direction = Direction.DOWN; 
      top1.speed = 1;
      topCounter ++;
    }
    top1.draw();
    if ((top1.x > pizza.x - 25)&&(int(top1.x+60) < int(pizza.x+260))&&( top1.y == 300))
    {
      catched();
    } 
    else if (top1.y == 350)
    {
      missed();
    }
    if (lifeCounter == 3)
    {
      life1.draw();
      life2.draw();
      life3.draw();
    } else if (lifeCounter == 2)
    {
      life1.draw();
      life2.draw();
    } else if (lifeCounter == 1)
    {
      life1.draw();
    }
    score.draw();
    endOfGame();
  }
}

void mousePressed()
{
  if (restartButtonShow)
  {
    if (restartButton.pointInShape(mouseX, mouseY))
    {
      setup();
    }
  }
}

void catched()
{
  catchSound.play();
  top1.speed = 0;
  top1.y = 0;
  top1.x = int(random(0, width-200));
  top1.direction = Direction.DOWN; 
  top1.speed = 1;
  catchCounter++;
  topCounter++;
  setUpText();
}

void missed()
{
  missedSound.play();
  lifeCounter--;
}

void showRestartButton()
{
  restartButton.setImage("restartButton.png");
  restartButton.width = 70;
  restartButton.height = 70;
  restartButton.x = 250;
  restartButton.y = 300;
  restartButton.draw();
  restartButtonShow = true;
}

void endOfGame()
{
  if (topCounter == 10 && catchCounter >= 7)
  {
    endScreenWin.setImage("screenWin.png");
    endScreenWin.width = 612;
    endScreenWin.height = 408;
    endScreenWin.draw();
    showRestartButton();
  } else if (lifeCounter == -1)
  {
    endScreenLose.setImage("screenLose.png");
    endScreenLose.width = 612;
    endScreenLose.height = 408;
    endScreenLose.draw();
    showRestartButton();
  }
}
