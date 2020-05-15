import sys, os

from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtQml import *
from PyQt5.QtQuick import *


class FuelIcon(QQuickItem):
    def __init__(self):
        super(QQuickItem, self).__init__()
        self.img = Image()

class Image(QImage):
    def __init__(self):
        super(QImage, self).__init__()
        self.height = 85
        self.width = 105
        self.x = 0
        self.y = 0
        self.color(7)


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    win = QWindow()

    fuel = FuelIcon()
    fuel.setParent(win)

    win.show()


    sys.exit(app.exec())
