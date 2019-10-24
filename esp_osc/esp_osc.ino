#include <WiFi.h>
#include <WebServer.h>
#include <WiFiUDP.h>
//#include <OSCMessage.h>

const int photoCell = 34;
const int piezoPin = 32;
const int foilPin = 27;

const int ledPin = 21;
const int ledThreshold = 30;

/* Put your SSID & Password */
const char* ssid = "ESP32_Sabrina";  // Enter SSID here
const char* password = "12345678";  //Enter Password here

const char * udpAddress = "192.168.1.2";
const int udpPort = 57222;

/* Put IP Address details */
IPAddress local_ip(192, 168, 1, 1);
IPAddress gateway(192, 168, 1, 1);
IPAddress subnet(255, 255, 255, 0);

WebServer server(80);
WiFiUDP udp;



void setup() {
  Serial.begin(115200);

  pinMode(photoCell, INPUT_PULLUP);
  pinMode(piezoPin, INPUT_PULLUP);
  digitalWrite(photoCell, LOW);
  digitalWrite(piezoPin, LOW);

  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW);


  WiFi.softAP(ssid, password);
  IPAddress IP = WiFi.softAPIP();
  Serial.print("AP IP address: ");
  Serial.println(IP);
  WiFi.softAPConfig(local_ip, gateway, subnet);

  server.begin();
  delay(1000);
}

void loop() {
  int photoVal = analogRead(photoCell);
  Serial.print(photoVal);
  Serial.print("--");

  int piezoVal = analogRead(piezoPin);
  Serial.print(piezoVal);
  Serial.print("--");

  int touchVal = touchRead(foilPin);
  Serial.println(touchVal);

  if (touchVal < ledThreshold) {
    // turn LED on
    digitalWrite(ledPin, HIGH);
    //    Serial.println(" - LED on");
  }
  else {
    // turn LED off
    digitalWrite(ledPin, LOW);
    //    Serial.println(" - LED off");
  }

  // Send UDP message
  udp.beginPacket(udpAddress, udpPort);
  udp.printf("%d--%d--%d", photoVal, piezoVal, touchVal);
  udp.endPacket();

  //Wait for 1 second
  delay(1000);

}
