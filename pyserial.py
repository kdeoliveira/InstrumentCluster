from PyQt5.QtCore import *
from PyQt5.QtQml import *
from multiprocessing import Process

import serial, time
import configparser

class AppValues(QObject):
   """
   Gets values from Data backend
   """

   #SIGNALS
   rpmChanged = pyqtSignal(int)
   speedChanged = pyqtSignal(int)

   def __init__(self, *args, **kwargs):
       super(QObject, self).__init__(*args,**kwargs)
       self._rpm = 15
       self._speed = 10
       self.rpmChanged.connect(lambda x : self.onChange(x))
       self.speedChanged.connect(lambda x : self.onChange(x))

   """
   QML Object properties
   notify: emits signal on property change
   """
   @pyqtProperty(int, notify=rpmChanged)
   def rpm(self):
       return self._rpm
   @pyqtProperty(int, notify=speedChanged)
   def speed(self):
       return self._speed

   """
   QML Object setters
   """
   @rpm.setter
   def rpm(self, event):
       if self._rpm != event:
           self._rpm = event
           self.rpmChanged.emit(event)
   @speed.setter
   def speed(self, event):
       if self._speed != event:
           self._speed = event
           self.speedChanged.emit(event)

   @pyqtSlot(int, result = int)
   def onChange(self, event):
       """
       QML Object slot associated to signals
       """
       print("onChange slot: ",event)

   @pyqtSlot(int, result = int)
   def set_rpm(self, event):
       if self._rpm != event:
           self._rpm = event
           self.rpmChanged.emit(event)
   @pyqtSlot(int, result = int)
   def set_speed(self, event):
       if self._speed != event:
           self._speed = event
           self.speedChanged.emit(event)

class Runnable(QRunnable):
    def run(self):
        VELOCIMETER()

DATA = AppValues()

config_file = configparser.ConfigParser()
config_file.read('ini_read.ini')

NUM_POINTS = int(config_file['DEFAULTS']['NUM_POINTS'])
MAX_POINT = int(config_file['DEFAULTS']['MAX'])
MIN_POINT = int(config_file['DEFAULTS']['MIN'])

data_file = open('data.txt', 'w')

data = [0]*NUM_POINTS
summation = 0
average = 0

bus = serial.Serial('/dev/ttyACM0', baudrate= 9600,timeout=1)
QThread.msleep(3)

CURRENT_RPM = 0
CURRENT_SPEED = 0

def get_data():
    global CURRENT_SPEED
    bus.write(b'y')
    rpm, speed = bus.readline().decode('ASCII').strip('\r\n').split(',')
    rpm = int(rpm) *7.96 - 143.29
    CURRENT_SPEED = int(speed) * 3.3
    if(rpm < MIN_POINT):
        return MIN_POINT
    elif rpm > MAX_POINT:
        return MAX_POINT
    else:
        return rpm

def get_average(val = 0, index = 0):
    global average
    
    if index in range(0, NUM_POINTS):
        data[index] = get_data()
        val += data[index]
        index += 1
    else:
        average = (sum(data)/NUM_POINTS) #Average
        index = 0
        val = 0
        return
    get_average(val, index)

def write_to_file(f):
    f.write(str(data))
    f.write('\tAverage:' + str(average) + '\n')

def VELOCIMETER():
    global CURRENT_RPM
    try:
        while True:
            get_average()
            write_to_file(data_file)
            CURRENT_RPM = int(average)
            QMetaObject.invokeMethod(
                DATA,
                "set_rpm",
                Qt.QueuedConnection,
                Q_ARG(int, int(average))
            )
            QMetaObject.invokeMethod(
                DATA,
                "set_speed",
                Qt.QueuedConnection,
                Q_ARG(int, int(CURRENT_SPEED))
            )

    except KeyboardInterrupt:
        data_file.close()
        print("Application closed")




# worker = Process(target=RPM)
# worker.start()
