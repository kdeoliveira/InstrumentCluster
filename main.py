import sys, os

from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtQml import *
from PyQt5.QtQuick import *

from functools import partial

class AppData(QObject):
    def __init__(self):
        super(QObject, self).__init__()

class AppValues(QObject):
    """
    Gets values from Data backend
    """

    #SIGNALS
    rpmChanged = pyqtSignal(int)
    speedChanged = pyqtSignal(int)

    def __init__(self, *args, **kwargs):
        super(QObject, self).__init__(*args,**kwargs)
        self._rpm = 520
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




if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    view = QQuickView()
    view.setResizeMode(QQuickView.SizeRootObjectToView)

#    engine = QQmlApplicationEngine()
#    engine.addImportPath("AutomativeCluster/imports/AutomativeCluster")

    """
    Model context property for Data/Values
    """
    data = AppValues()


    qmlFile = os.path.join(os.path.dirname(__file__), "AutomativeCluster/AutomativeCluster.qml")
    dataFile = os.path.join(os.path.dirname(__file__), "AutomativeCluster/backend/Data/Values.qml")

    engine = view.engine()

#    Registering QObject to QML
#    qmlRegisterType(AppValues)
#    qmlRegisterType(AppData, "App", 1,0, "AppValues", attachedProperties = AppValues)

    engine.rootContext().setContextProperty("AppValues", data)
    engine.addImportPath("AutomativeCluster/imports")
    engine.addImportPath("AutomativeCluster/backend")
    view.setSource(QUrl.fromLocalFile(os.path.abspath(qmlFile)))

    if view.status() == QQuickView.Error:
        sys.exit(-1)

    print(data.rpm)

    view.showFullScreen()
    sys.exit(app.exec())

    del view


