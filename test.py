import serial, time


bus = serial.Serial('/dev/tty0', timeout=1)
time.sleep(3)
while True:
    bus.write(b'y')
    # rpm,speed = (bus.readline().decode('ASCII')).strip().split(',')
    # rpm, speed = bus.readline().decode('ASCII').strip('\r\n').split(',')
    print(bus.readline())
    # print((bus.readline().decode("ASCII")).strip().split('\n\r'))
