import processing.sound.*;
import oscP5.*;
import netP5.*;
SinOsc sine;

int photoVal;
int piezoVal;
int touchVal;

OscP5 oscP5;
NetAddress myRemoteLocation;


void setup() {
  size(640, 360);
  sine = new SinOsc(this);
  //sine.freq(10);
  sine.play();
}


void draw() {
  sine.pan(map(mouseX, 0, width, -1.0, 1.0));
  //sine.freq(0);
  //sine.play();
}

void mousePressed() {
  float freq=200;
  float amp=0.5;
  float add=0.0;
  float pos=1;
  sine.set(freq, amp, add, pos);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}

void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */
  
  if(theOscMessage.checkAddrPattern("/test")==true) {
    /* check if the typetag is the right one. */
    if(theOscMessage.checkTypetag("ifs")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      int firstValue = theOscMessage.get(0).intValue();  
      float secondValue = theOscMessage.get(1).floatValue();
      String thirdValue = theOscMessage.get(2).stringValue();
      print("### received an osc message /test with typetag ifs.");
      println(" values: "+firstValue+", "+secondValue+", "+thirdValue);
      return;
    }  
  } 
  println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
}
