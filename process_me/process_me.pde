import processing.sound.*;
import oscP5.*;
import netP5.*;
SinOsc sine;

int photoVal;
int piezoVal;
int touchVal;
int touchThreshold = 40;

float amp = 1;
float freq;
float freqMod;
float add;

OscP5 oscP5;

void setup() {
  size(720, 480);
  sine = new SinOsc(this);
  sine.play();
  sine.amp(amp);

  oscP5 = new OscP5(this, 44444);   //listening
}


void draw() {
  // Map photoVal from 400Hz to 1000Hz for frequency  
  freq = map(photoVal, 0, 4095, 400.0, 1000.0);
  
  // Map piezoVal to frequency modulator
  if (piezoVal > 2000) piezoVal = 2000;
  freqMod = map(piezoVal, 0, 2000, 1, 2.5);
  freq = freq * freqMod;

  // If capacitive touch is on, add 1.0 to frequency
  if (touchVal < touchThreshold) add = 1.5;
  else add = 0.0;
  
  sine.set(freq, amp, add, 0);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  print("### received an osc message.");
  println(" addrpattern: "+theOscMessage.addrPattern());

  photoVal = theOscMessage.get(0).intValue();
  piezoVal = theOscMessage.get(1).intValue();
  touchVal = theOscMessage.get(2).intValue();

  print(theOscMessage.get(0).intValue() + "--");
  print(theOscMessage.get(1).intValue() + "--");
  println(theOscMessage.get(2).intValue());
}
