import socket
import OSC

def parseUDP(raw_input):
    str_input = str(raw_input)
    str_input = str_input[2:]
    str_input = str_input[:-1]

    split_input = str_input.split('--')
    parsed = []
    for val in split_input:
        parsed.append(int(val))

    return parsed

def main():
    UDP_IP = "192.168.1.2"
    UDP_PORT = 57222

    sock = socket.socket(socket.AF_INET, # Internet
                         socket.SOCK_DGRAM) # UDP
    sock.bind((UDP_IP, UDP_PORT))

    while True:
        data, addr = sock.recvfrom(1024) # buffer size is 1024 bytes
        data = parseUDP(data)
        print(data)




if __name__ == "__main__":
	main()
