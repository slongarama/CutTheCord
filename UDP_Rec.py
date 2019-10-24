import socket
import OSC
import serial # sudo pip install pyserial
import re
import gpiozero as gp

def parseUDP(raw_input):
    str_input = str(raw_input)
    str_input = str_input[2:]
    str_input = str_input[:-1]

    split_input = str_input.split('--')
    parsed = []
    for val in split_input:
        parsed.append(int(val))

    return parsed

class Listener():
	osc_client = None

	def add_osc_connect(self, client_connection):
		self.osc_client = client_connection
		print(self.osc_client)

	def sendOSC(self, val, content):
		msg = OSC.OSCMessage()
		msg.setAddress("/Chimes")
		for c in content:
			msg.append(c)
		self.osc_client.send(msg)


def main():
    UDP_IP = "192.168.1.2"
    UDP_PORT = 57222

    sock = socket.socket(socket.AF_INET, # Internet
                         socket.SOCK_DGRAM) # UDP
    sock.bind((UDP_IP, UDP_PORT))

    c = OSC.OSCClient()
	c.connect(('127.0.0.1', 44444))

    listener = Listener()
	listener.add_osc_connect(c)

    while True:
        data, addr = sock.recvfrom(1024) # buffer size is 1024 bytes
        data = parseUDP(data)
        print(data)

        try:
			msg = []
			msg = ""
            listener.sendOSC(i, msg)
			print(msg)

		except Exception as e:
			print(e)




if __name__ == "__main__":
	main()
