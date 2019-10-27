# CPSC334 Module 3 - Cut the Cord
Artist: Sabrina Long

## Magic Sound Wand
The Magic Sound Wand allows a user to interact with their environment untethered. By waving the wand, the user can turn light, vibration, and human touch into interesting (and eerie) sounds.

## Constructing the Magic Wand
To construct your own magic wand, you will need the following materials:
- ESP32
- Breadboard strip with power and ground only
- Piezoelectric sensor
- Photocell sensor
- Tinfoil
- Styrofoam ball
- Wooden rod
- Wires and solder
- Tape, fabric, cloth covering

Steps:
1. Mount the styrofoam ball onto the wooden rod with hot glue
2. Solder the sensors and wires such that the only end points are to GPIO, power, and ground
3. Glue the sensors onto the styrofoam ball
4. Mount the ESP32 onto the wooden rod and connect all sensors
5. Cover the styrofoam ball and the ESP32 with a cloth or fabric covering

## Using the Magic Wand

To set up your Magic Wand, you will need to

1. Flash "sensorsUDP.ino" onto your ESP32
2. Connect your computer to the ESP32 wifi network (see details in sensorsUDP.ino)
3. Run receiveUDP.py on your wifi-connected machine (with python2)
4. Run sineModulator.pde on your wifi-connected machine
5. Connect the Magic Wand ESP32 to a portable battery


