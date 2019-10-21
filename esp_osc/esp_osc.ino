#include <WiFi.h>
#include <WebServer.h>
#include <WiFiUdp.h>
//#include <OSCMessage.h>


/* Put your SSID & Password */
const char* ssid = "ESP32_Sabrina";  // Enter SSID here
const char* password = "12345678";  //Enter Password here

/* Put IP Address details */
IPAddress local_ip(192, 168, 1, 184);
IPAddress gateway(192, 168, 4, 1);
IPAddress subnet(255, 255, 255, 0);

WebServer server(80);

WiFiUDP udp;

void setup() {
  pinMode(32, INPUT);
  Serial.begin(115200);

  WiFi.softAP(ssid, password);
  IPAddress IP = WiFi.softAPIP();
  Serial.print("AP IP address: ");
  Serial.println(IP);
  
  WiFi.softAPConfig(local_ip, gateway, subnet);

  server.begin();
}

void loop() {
  int input = analogRead(32);
  input = 10;
  udp.beginPacket("192.168.4.1", 4444);
  udp.printf("%d\n", input);
  udp.endPacket();
  Serial.println("sent");
  //Wait for 1 second
  delay(1000);

}
