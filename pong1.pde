int gamestate = 0;

int ballx = 20;
int bally = 20;

int xmovement = 9;
int ymovement = 9;

void setup(){
    size(700, 700);
}

void draw(){
    background(0);
    if(gamestate == 0){
        fill(255);
        rect(250, 450, 200, 150);
        textSize(75);
        fill(255);
        text("Pong", 260, 150);
        fill(0);
        text("Play", 275, 550);
    }
    if(gamestate == 1){
        fill(255);
        rect(0, 650, 700, 50);
        if(mouseX <= 600) rect(mouseX, 600, 100, 30);
        else rect(600, 600, 100, 30);
        rect(ballx, bally, 50, 50);
        ballx = ballx + xmovement;
        if(ballx >= 650) xmovement = floor(random(-9, -20));
        if(ballx <= 0) xmovement = floor(random(9, 20));

        bally = bally + ymovement;
        if(bally >= 600) ymovement = floor(random(-9, -20));
        if(bally <= 0) ymovement = floor(random(9, 20));
    }
}

void mousePressed(){
    if(gamestate == 0){
        if(mouseX >= 250 && mouseX <= 450 && mouseY >= 450 && mouseY <= 600){
            gamestate = 1;
        }
    }
}