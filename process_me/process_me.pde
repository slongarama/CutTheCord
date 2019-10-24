import processing.sound.*;
SinOsc sine;

int photoVal;
int piezoVal;
int touchVal;

void setup() {
  sine = new SinOsc(this);
  sine.freq(10);
  sine.play();
}


void draw() {
  //sine.freq(0);
  //sine.play();
}
