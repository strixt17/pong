int gamestate = 0;

int ballx = 20;
int bally = 20;

int xmovement = 9;
int ymovement = 9;

int lives = 3;

int score = 0;

void setup(){
    size(700, 700);
}

void draw(){
    background(0);
    if(gamestate == 0){
        textSize(75);
        fill(255);
        text("Pong", 260, 150);
        againbutton();
    }
    if(gamestate == 1){
        fill(255);
        rect(0, 650, 700, 50);
        if(mouseX <= 600) rect(mouseX, 600, 100, 30);
        else rect(600, 600, 100, 30);
        rect(ballx, bally, 50, 50);
        if(bally >= 550){
            if(ballx >= mouseX - 50 && ballx + 50 <= mouseX + 150){
                score = score + 1;
            }
            else lives = lives - 1;
        }
        if(ballx >= 650) xmovement = floor(random(-9, -20));
        if(ballx <= 0) xmovement = floor(random(9, 20));
        ballx = ballx + xmovement;

        if(ballx >= 650) ballx = 650;

        
        if(bally >= 550) ymovement = floor(random(-9, -20));
        if(bally <= 0) ymovement = floor(random(9, 20));
        bally = bally + ymovement;

        if(bally >= 650) ballx = 650;

        if(lives == 0){
            gamestate = 2;
        }
        
        text("Lives: " + lives, 420, 70);
        text("Score: " + score, 20, 70);
    }
    if(gamestate == 2){
        fill(255);
        text("Score: " + score, 20, 70);
        againbutton();
    }
}

void mousePressed(){
    if(gamestate == 0){
        if(mouseX >= 250 && mouseX <= 450 && mouseY >= 450 && mouseY <= 600){
            gamestate = 1;
        }
    }
    if(gamestate == 2){
        if(mouseX >= 250 && mouseX <= 450 && mouseY >= 450 && mouseY <= 600){
            gamestate = 0;
            lives = 3;
            score = 0;
            ballx = 20;
            bally = 20;
        }
    }
}

void againbutton(){
    fill(255);
    rect(250, 450, 200, 150);
    fill(0);
    text("Play", 275, 550);
}